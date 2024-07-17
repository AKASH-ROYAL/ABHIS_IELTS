
import 'package:ielts_frontend/export.dart';

class QuizPage extends StatefulWidget {
  final String taskTitle;
  final VoidCallback onComplete;

  QuizPage({required this.taskTitle, required this.onComplete});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<String?> _selectedAnswers = [null, null, null];
  final List<String> _correctAnswers = ['Colin', 'A locked and neglected garden', 'Dickon and a robin'];

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
            content: Text('Congratulations! You have submitted all answers correctly.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  widget.onComplete();
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
            content: Text('Please enter the correct answers. Incorrect answers are highlighted in red.'),
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
                        SizedBox(height: 2.0), // Space between the icon and the first text
                        Row(
                          children: [
                            Text(
                              "Travel Destination",
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.0), // Space between the texts
                        Row(
                          children: [
                            Text(
                              "Task 01",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0), // Space between the text and the audio player
                        // Dummy audio player
                        Container(
                          width: 320, // Adjust the width as needed
                          height: 40, // Adjust the height as needed
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Adjust padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.play_arrow, color: Colors.black, size: 24), // Adjust icon size
                              Expanded(
                                child: Slider(
                                  value: 0.0,
                                  onChanged: (value) {},
                                ),
                              ),
                              Icon(Icons.volume_up, color: Colors.black, size: 24), // Adjust icon size
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
                        'assets/images/right.png', // Update the path to your image
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
                            color: Colors.teal.shade800
                        ),
                      ),
                      Text(
                        'Score: 0/5',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade800
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  QuestionWidget(
                    questionNumber: '1',
                    questionText: "What is the name of Mary's cousin who is believed to be an invalid?",
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
                    questionText: "What does Mary discover that becomes symbolic of her own neglected spirit?",
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
                    questionText: "Who becomes Mary's companions in her efforts to restore the garden?",
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
          style: TextStyle(fontSize: 14,color: Colors.teal.shade600),
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