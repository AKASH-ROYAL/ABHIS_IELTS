import 'package:ielts_frontend/activity/reading/view/reading_quiz.dart';
import 'package:ielts_frontend/export.dart';
import 'package:ielts_frontend/widgets/helper_widgets/hamburger_icon.dart';

class ReadingList extends StatelessWidget {
  const ReadingList({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              color: Color(0xFF0d5d50),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 90),
                child: Row(
                  children: [
                    HamburgerIcon(),
                    Spacer(),
                    Text(
                      'Reading Exercise',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.black),
                      onPressed: () {
                        // Implement the notification button action here
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Text(
                  'Exercises',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0d5d50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF7BBFB2),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        '"The Secret Garden"',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '     "The Secret Garden" is a novel about Mary Lennox, a young girl who is born in India to wealthy British parents. After her parents die in a cholera outbreak, Mary is sent to live with her uncle, Archibald Craven, in Yorkshire, England. Mr. Craven is grieving over the loss of his wife, Lily, and is largely absent from the mansion, Misselthwaite Manor.\n\n'
                      'Mary is initially spoiled, sickly, and temperamental due to her neglectful upbringing in India. She explores the grounds of Misselthwaite Manor and discovers a locked, neglected garden that belonged to Mrs. Craven. With the help of a local boy named Dickon and a robin she befriends, Mary sets out to restore the garden to its former glory. As she works on the garden, Mary undergoes a transformation—physically, mentally, and emotionally.\n\n'
                      'Mary also befriends her cousin, Colin, who is believed to be an invalid and is kept hidden away from the world by his father, Mr. Craven. Mary and Dickon introduce Colin to the secret garden, and he begins to thrive in the fresh air and natural surroundings. With Mary\'s support and encouragement, Colin gains strength and confidence, ultimately standing up to his father and embracing life.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(()=>ReadingQuizScreen());
                   },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3A7869),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: Text('Quiz Time..',
                      style: TextStyle(color: Colors.white)),
                ),
                // Add more buttons or widgets as needed
              ],
            ),
            // Add more content or widgets below the row as needed
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz';

  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Screen'),
        backgroundColor: Color(0xFF3A7869),
      ),
      body: Center(
        child: Text('This is the Quiz Screen'),
      ),
    );
  }
}
