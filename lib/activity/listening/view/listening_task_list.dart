


import 'package:ielts_frontend/activity/listening/helper_widgets/task_widget.dart';
import 'package:ielts_frontend/activity/listening/model/task_model.dart';
import 'package:ielts_frontend/export.dart';
import 'package:ielts_frontend/widgets/helper_widgets/hamburger_icon.dart';

class ListeningTaskList extends StatefulWidget {
  const ListeningTaskList({super.key});

  @override
  _ListeningTaskListState createState() => _ListeningTaskListState();
}

class _ListeningTaskListState extends State<ListeningTaskList> {
  final List<Task> tasks = [
    Task('Travel Destination', true),
    Task('Ace Language School', false),
    Task('Clean Eats', false),
    Task('Gorillas', false),
    Task('Divine Touch', false),
    Task('The Future of Management', false),
    Task('Student Internships', false),
    Task('The Eastern Red Cedar Tree', false),
    Task('William Shakespeare', false),
    Task('Imperial Garden', false),
  ];

  int get completedTasksCount =>
      tasks.where((task) => task.unlocked).length - 1;

  void completeTask(int index) {
    setState(() {
      if (index < tasks.length - 1) {
        tasks[index + 1].unlocked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TemplateScaffold(
      body: Column(
        children: [
          Container(
            height: 120, // Adjust the height as needed
            color: Colors.teal.shade800,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HamburgerIcon(),
                     SizedBox(width: 16.0), // Adjust spacing if needed
                    Expanded(
                      child: Text(
                        'Listening',
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Completed",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircularProgressIndicator(
                                value: completedTasksCount / tasks.length,
                                backgroundColor: Colors.teal.shade200,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.yellow),
                              ),
                              Text(
                                "${(completedTasksCount / tasks.length * 100)
                                    .toInt()}%",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/a.png', // Replace with your image path
                            height: 80, // Adjust size as needed
                            width: 80,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 16.0, // Adjust spacing from right edge
                  child: Image.asset(
                    'assets/images/right.png', // Replace with your image path
                    height: 90, // Adjust size as needed
                    width: 90,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'TASK',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskWidget(
                  task: tasks[index],
                  index: index + 1,
                  onCompleteTask: () => completeTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



