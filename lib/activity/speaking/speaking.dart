import 'package:ielts_frontend/export.dart';
import 'package:ielts_frontend/widgets/helper_widgets/hamburger_icon.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:async';
import 'package:confetti/confetti.dart';

class SpeakingTaskPage extends StatefulWidget {
  const SpeakingTaskPage({super.key});

  @override
  _SpeakingTaskPageState createState() => _SpeakingTaskPageState();
}

class _SpeakingTaskPageState extends State<SpeakingTaskPage> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _spokenText = 'Speak Now......';
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );
    if (available) {
      setState(() {
        _isListening = true;
        _stopwatch.start();
        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {});
        });
      });
      _speech.listen(
        onResult: (val) => setState(() {
          _spokenText = val.recognizedWords;
        }),
      );
    }
  }

  void _stopListening() async {
    await _speech.stop();
    setState(() {
      _isListening = false;
      _stopwatch.stop();
      _timer.cancel();
    });
  }

  void _toggleListening() {
    if (_isListening) {
      _stopListening();
    } else {
      _startListening();
    }
  }

  void _saveSpokenText() {
    _stopListening(); // Stop the stopwatch when saving
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DisplayTextPage(spokenText: _spokenText),
      ),
    );
  }

  String _formatTime(int milliseconds) {
    int seconds = milliseconds ~/ 1000;
    int minutes = seconds ~/ 60;
    seconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScaffold(
      backgroundColor: Colors.green.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              color: Color(0xFF0d5d50),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ).onTap(() {
                    Get.back();
                  }),
                  SizedBox(width: 20),
                  Text(
                    "Speaking",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFF0d5d50),
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'TASK 01',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.spatial_audio_off, size: 30, color: Colors.white),
                  SizedBox(width: 40),
                  Icon(Icons.person_pin_outlined,
                      size: 34, color: Colors.white),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  "Exercises",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xFF0d5d50),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Travel Destination',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.deepPurple,
                          ),
                        ),
                        Text(
                          'SUBTEXT',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0d5d50),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'From the historic median to the majestic Atlas Mountains, this Moroccan gem offers an unforgettable journey....',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              _formatTime(_stopwatch.elapsedMilliseconds),
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: _toggleListening,
              child: Column(
                children: [
                  Icon(
                    _isListening ? Icons.mic : Icons.mic_off,
                    size: 100.0,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    _isListening ? 'Speak Now' : 'Mic Muted',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _saveSpokenText,
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Color(0xFF0d5d50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisplayTextPage extends StatefulWidget {
  final String spokenText;

  DisplayTextPage({super.key, required this.spokenText});

  @override
  _DisplayTextPageState createState() => _DisplayTextPageState();
}

class _DisplayTextPageState extends State<DisplayTextPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _showConfetti() {
    _confettiController.play();
    Future.delayed(Duration(seconds: 3), () {
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => ReadingList()), // Navigation
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0d5d50),
        title: Text('Spoken Text', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(
            color: Colors.white), // Set the back button color to white
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'You said:',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          widget.spokenText,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: _showConfetti,
                    child:
                        Text('Submit', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      backgroundColor: Color(0xFF0d5d50),
                      minimumSize: Size.fromHeight(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.orange,
                Colors.purple,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
