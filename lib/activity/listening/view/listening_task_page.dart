import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:ielts_frontend/export.dart';

class ListeningTaskPage extends StatefulWidget {
  const ListeningTaskPage();

  @override
  _ListeningTaskPageState createState() => _ListeningTaskPageState();
}

class _ListeningTaskPageState extends State<ListeningTaskPage> {
  final List<String?> _selectedAnswers = [null, null, null];
  final List<String> _correctAnswers = [
    'Colin',
    'A locked and neglected garden',
    'Dickon and a robin'
  ];
  late AudioPlayer _audioPlayer;
  String _audioPath =
      'https://archive.org/download/WizKhalifaSeeYouAgainFt.CharliePuthOfficialVideoFurious7Soundtrack_201506/Wiz%20Khalifa%20-%20See%20You%20Again%20ft.%20Charlie%20Puth%20%5BOfficial%20Video%5D%20Furious%207%20Soundtrack.mp3'; // Path to your audio file

  Duration _currentPosition = Duration.zero;
  Duration _totalDuration =
      Duration(minutes: 1); // Total duration for the timer
  bool _isMuted = false;
  Timer? _timer; // Timer variable
  Duration _elapsedTime = Duration(minutes: 1); // Start with the total duration

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _loadAudio();

    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _totalDuration = duration;
        _elapsedTime = duration; // Initialize elapsed time with total duration
      });
    });

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _currentPosition = position;
      });
    });
  }

  Future<void> _loadAudio() async {
    try {
      await _audioPlayer
          .setSource(UrlSource(_audioPath)); // Load the audio file from URL
    } catch (e) {
      print('Error loading audio: $e');
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Release resources when no longer needed
    _timer?.cancel(); // Cancel the timer when disposing
    super.dispose();
  }

  Future<void> _playAudio() async {
    try {
      await _audioPlayer.resume();
      _startTimer(); // Start the timer when audio plays
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  Future<void> _pauseAudio() async {
    try {
      await _audioPlayer.pause();
      _timer?.cancel(); // Cancel the timer when audio pauses
    } catch (e) {
      print('Error pausing audio: $e');
    }
  }

  void _togglePlayback() async {
    try {
      if (_audioPlayer.state == PlayerState.playing) {
        await _pauseAudio();
      } else {
        await _playAudio();
      }
    } catch (e) {
      print('Error toggling playback: $e');
    }
  }

  void _seek(double seconds) async {
    try {
      await _audioPlayer.seek(Duration(seconds: seconds.toInt()));
      setState(() {
        _elapsedTime = _totalDuration -
            Duration(
                seconds: seconds.toInt()); // Update elapsed time when seeking
      });
    } catch (e) {
      print('Error seeking audio: $e');
    }
  }

  void _toggleMute() async {
    try {
      if (_isMuted) {
        await _audioPlayer.setVolume(1.0);
      } else {
        await _audioPlayer.setVolume(0.0);
      }
      setState(() {
        _isMuted = !_isMuted;
      });
    } catch (e) {
      print('Error toggling mute: $e');
    }
  }

  void _startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_elapsedTime > Duration.zero) {
          _elapsedTime -= Duration(seconds: 1); // Decrement the elapsed time
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _submitAnswers() {
    bool allCorrect = true;
    for (int i = 0; i < _selectedAnswers.length; i++) {
      if (_selectedAnswers[i] != _correctAnswers[i]) {
        allCorrect = false;
        break;
      }
    }

    if (allCorrect) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Quiz Completed'),
            content: Text(
                'Congratulations! You have submitted all answers correctly.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // widget.onComplete();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Incorrect Answers'),
            content: Text(
                'Please enter the correct answers. Incorrect answers are highlighted in red.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            color: Color(0xFF0d5d50),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () {
                                Get.back();
                                // Implement the menu button action here
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 2.0),
                        // Space between the icon and the first text
                        Row(
                          children: [
                            Text(
                              "Travel Destination",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.0),
                        // Space between the texts
                        Row(
                          children: [
                            Text(
                              "Task 01",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        // Space between the text and the audio player
                        // Dummy audio player
                        Container(
                          width: 300,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: InkWell(
                                  child: Icon(
                                    _audioPlayer.state == PlayerState.playing
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.black,
                                    size: 32,
                                  ),
                                  onTap: _togglePlayback,
                                ),
                              ),
                              Expanded(
                                child: Slider(
                                  value: (_totalDuration - _elapsedTime)
                                      .inSeconds
                                      .toDouble(),
                                  max: _totalDuration.inSeconds.toDouble() + 1,
                                  onChanged: (value) {
                                    _seek(value);
                                  },
                                ),
                              ),
                              Text(
                                '${_elapsedTime.inMinutes}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}', // Display the timer
                                style: TextStyle(color: Colors.black),
                              ),
                              IconButton(
                                icon: Icon(
                                  _isMuted ? Icons.volume_off : Icons.volume_up,
                                  color: Colors.black,
                                  size: 24,
                                ),
                                onPressed: _toggleMute,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Add the image on the right side
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/right.png',
                        // Update the path to your image
                        width: 80,
                        height: 100,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quiz',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800),
                      ),
                      Text(
                        'Score: 0/5',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  QuestionWidget(
                    questionNumber: '1',
                    questionText:
                        "What is the name of Mary's cousin who is believed to be an invalid?",
                    options: ['Dickon', 'Tom', 'Colin', 'John'],
                    selectedOption: _selectedAnswers[0],
                    onOptionSelected: (option) {
                      setState(() {
                        _selectedAnswers[0] = option;
                      });
                    },
                    isCorrect: _selectedAnswers[0] == _correctAnswers[0],
                  ),
                  SizedBox(height: 16),
                  QuestionWidget(
                    questionNumber: '2',
                    questionText:
                        "What does Mary discover that becomes symbolic of her own neglected spirit?",
                    options: [
                      'A hidden treasure in the attic',
                      'A secret passage in the manor',
                      'A locked and neglected garden',
                      'A mysterious diary belonging',
                    ],
                    selectedOption: _selectedAnswers[1],
                    onOptionSelected: (option) {
                      setState(() {
                        _selectedAnswers[1] = option;
                      });
                    },
                    isCorrect: _selectedAnswers[1] == _correctAnswers[1],
                  ),
                  SizedBox(height: 16),
                  QuestionWidget(
                    questionNumber: '3',
                    questionText:
                        "Who becomes Mary's companions in her efforts to restore the garden?",
                    options: [
                      'Mr. Craven and Mrs. Medlock',
                      'Colin and Lily',
                      'Dickon and a robin',
                      'Martha and Ben Weatherstaff',
                    ],
                    selectedOption: _selectedAnswers[2],
                    onOptionSelected: (option) {
                      setState(() {
                        _selectedAnswers[2] = option;
                      });
                    },
                    isCorrect: _selectedAnswers[2] == _correctAnswers[2],
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitAnswers,
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String questionNumber;
  final String questionText;
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String?> onOptionSelected;
  final bool isCorrect;

  QuestionWidget({
    required this.questionNumber,
    required this.questionText,
    required this.options,
    required this.selectedOption,
    required this.onOptionSelected,
    required this.isCorrect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.yellow,
          padding: EdgeInsets.all(4.0),
          child: Text(
            'Q $questionNumber:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          questionText,
          style: TextStyle(fontSize: 14, color: Colors.teal.shade600),
        ),
        SizedBox(height: 8),
        Column(
          children: options.map((option) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedOption == option && !isCorrect
                      ? Colors.red
                      : Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: RadioListTile<String?>(
                title: Text(option),
                value: option,
                groupValue: selectedOption,
                onChanged: (value) {
                  onOptionSelected(value);
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
