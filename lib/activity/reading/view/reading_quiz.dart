import 'dart:async';

import 'package:ielts_frontend/activity/reading/view/Reading.dart';
import 'package:ielts_frontend/export.dart';

class ReadingQuizScreen extends StatefulWidget {
  @override
  _ReadingQuizScreenState createState() => _ReadingQuizScreenState();
}

class _ReadingQuizScreenState extends State<ReadingQuizScreen> {
  List<String> selectedOptions = List.filled(4, '');
  final Map<int, String> correctAnswers = {
    0: 'Colin',
    1: 'A locked and neglected garden',
    2: 'Dickon and a robin',
    3: 'A locked and neglected garden',
  };

  int score = 0;

  void handleOptionSelected(int questionIndex, String option) {
    setState(() {
      selectedOptions[questionIndex] = option;
    });
  }

  void calculateScore() {
    score = 0;
    for (int i = 0; i < selectedOptions.length; i++) {
      if (selectedOptions[i] == correctAnswers[i]) {
        score++;
      }
    }
    setState(() {});
  }

  void showScoreAndRedirect() {
    calculateScore();
    showDialog(
      context: context,
      builder: (context) => CountdownDialog(
        score: score,
        onCountdownComplete: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ReadingList()));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 32,),
          Expanded(
            child: Container(
              color: Color(0xFF0d5d50), // Set your desired color here
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white), // Set icon color if needed
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ReadingList()));
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "TASK 01",
                            style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Score: $score/4',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Row(children: [

                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: Icon(Icons.menu_book,size: 54.2,color: Colors.white,),
                    ),
                    Spacer(),
                    SizedBox(width: 50,),
                    Icon(Icons.person,size: 54.2,color: Colors.white,)
                  ],)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        QuizQuestion(
                          questionNumber: '01',
                          questionText:
                          'What is the name of Mary\'s cousin who is believed to be an invalid?',
                          options: ['Dickon', 'Tom', 'Colin', 'John'],
                          onOptionSelected: (option) =>
                              handleOptionSelected(0, option),
                          selectedOption: selectedOptions[0],
                        ),
                        QuizQuestion(
                          questionNumber: '02',
                          questionText:
                          'What does Mary discover that becomes symbolic of her own neglected spirit?',
                          options: [
                            'A hidden treasure in the attic',
                            'A secret passage in the manor',
                            'A locked and neglected garden',
                            'A mysterious diary belonging',
                          ],
                          onOptionSelected: (option) =>
                              handleOptionSelected(1, option),
                          selectedOption: selectedOptions[1],
                        ),
                        QuizQuestion(
                          questionNumber: '03',
                          questionText:
                          'Who becomes Mary\'s companions in her efforts to restore the garden?',
                          options: [
                            'Mr. Craven and Mrs. Medlock',
                            'Colin and Lily',
                            'Dickon and a robin',
                            'Martha and Ben Weatherstaff',
                          ],
                          onOptionSelected: (option) =>
                              handleOptionSelected(2, option),
                          selectedOption: selectedOptions[2],
                        ),
                        QuizQuestion(
                          questionNumber: '04',
                          questionText:
                          'What does Mary discover that becomes symbolic of her own neglected spirit?',
                          options: [
                            'A hidden treasure in the attic',
                            'A secret passage in the manor',
                            'A locked and neglected garden',
                            'A mysterious diary belonging',
                          ],
                          onOptionSelected: (option) =>
                              handleOptionSelected(3, option),
                          selectedOption: selectedOptions[3],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: showScoreAndRedirect,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white), // Text color inside the button
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Color(0xFF0d5d50), // Text and icon color when the button is enabled
                          // Optional: other button styles like shape, padding, etc.
                        ),
                      )

                    ],
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

class CountdownDialog extends StatefulWidget {
  final int score;
  final VoidCallback onCountdownComplete;

  const CountdownDialog({
    Key? key,
    required this.score,
    required this.onCountdownComplete,
  }) : super(key: key);

  @override
  _CountdownDialogState createState() => _CountdownDialogState();
}

class _CountdownDialogState extends State<CountdownDialog> {
  int countdown = 10;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown == 0) {
        timer.cancel();
        widget.onCountdownComplete();
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Quiz Completed!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Your score is ${widget.score}/4',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              'Redirecting in $countdown seconds...',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizQuestion extends StatelessWidget {
  final String questionNumber;
  final String questionText;
  final List<String> options;
  final Function(String) onOptionSelected;
  final String selectedOption;

  const QuizQuestion({
    Key? key,
    required this.questionNumber,
    required this.questionText,
    required this.options,
    required this.onOptionSelected,
    required this.selectedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.orange,
              child: Text(
                questionNumber,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                questionText,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        ...options.map((option) {
          return OptionWidget(
            optionText: option,
            isSelected: option == selectedOption,
            onOptionSelected: onOptionSelected,
          );
        }).toList(),
        Divider(),
      ],
    );
  }
}

class OptionWidget extends StatelessWidget {
  final String optionText;
  final bool isSelected;
  final Function(String) onOptionSelected;

  const OptionWidget({
    Key? key,
    required this.optionText,
    required this.isSelected,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onOptionSelected(optionText);
      },
      child: Row(
        children: [
          Radio<String>(
            value: optionText,
            groupValue: isSelected ? optionText : null,
            onChanged: (value) {
              onOptionSelected(optionText);
            },
          ),
          Expanded(child: Text(optionText)),
        ],
      ),
    );
  }
}