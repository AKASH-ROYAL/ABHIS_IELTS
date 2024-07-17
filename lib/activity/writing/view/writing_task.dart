import 'package:flutter/cupertino.dart';
import 'package:ielts_frontend/activity/writing/view/Writting_page.dart';
import 'package:ielts_frontend/export.dart';
import 'package:ielts_frontend/widgets/helper_widgets/hamburger_icon.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class WritingTask extends StatefulWidget {
  const WritingTask({super.key});

  @override
  _WritingTaskState createState() => _WritingTaskState();
}

class _WritingTaskState extends State<WritingTask> {
  final List<Task> tasks = [
    Task("Floor-Plan Cathersall", true, false), // First task is always unlocked
    Task("The Time Traveler's Quest", false, true),
    Task("Shadows of the Past", false, true),
    Task("The Enchanted Forest", false, true),
    Task("The Lost Treasure of Avalon", false, true),
    Task("The Whispering Winds", false, true),
    Task("Journey to the Unknown", false, true),
    Task("The Magic of the Old Oak Tree", false, true),
    Task("The Mystery of the Hidden Cave", false, true),
    Task("A Night at the Haunted Mansion", false, true),
  ];

  int get completedTasksCount => tasks.where((task) => task.isCompleted).length;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TemplateScaffold(
        // backgroundColor: primary_color,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [.00, .4],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff0D5D50),
                    Color(0xff1AA08B),
                  ])),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 12),
                Stack(
                  children: [
                    Row(
                      children: [
                        HamburgerIcon(),
                        SizedBox(width: 5),
                        Text(
                          "Writing",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 10),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 150,
                            // height: 40,
                            padding: EdgeInsets.symmetric(
                                vertical: 7, horizontal: 7),
                            decoration: BoxDecoration(
                                color: Color(0xffF6F6F6).withOpacity(.6),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(40),
                                    bottomRight: Radius.circular(40))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                NectText(
                                  text: "Completed",
                                  color: Colors.white,
                                  size: 14,
                                  fontWeight: FontWeight.w600,
                                ).expand(),
                                SizedBox(width: 8),
                                Container(
                                  height: 35,
                                  width: 35,
                                  child: SimpleCircularProgressBar(
                                    size: 100,
                                    maxValue: 100,
                                    valueNotifier:
                                        ValueNotifier(double.parse("77.0")),
                                    progressStrokeWidth: 5,
                                    backStrokeWidth: 5,
                                    mergeMode: true,
                                    onGetText: (value) {
                                      return Text(
                                        '${value.toInt()}%',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: primary_color,
                                          fontSize: 11,
                                        ),
                                      );
                                    },
                                    progressColors: [Colors.orangeAccent],
                                    backColor: Colors.white,
                                  ),
                                )
                              ],
                            )),
                        10.widthBox,
                        Expanded(
                          child: Container(
                            height: 100,
                            child: Image.asset(
                              'assets/images/Vector.png',
                              // fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        // SizedBox(height: 10),
                        Expanded(
                          child: Container(
                            height: 100,
                            child: Image.asset(
                              'assets/images/writing_header.png',

                              // fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ).marginOnly(top: 25),
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Task",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primary_color),
                        ),
                      ),
                      // SizedBox(height: 5),
                      for (int index = 0; index < tasks.length; index++)
                        TaskItem(
                          task: tasks[index],
                          index: index,
                          isNextTask: index == completedTasksCount,
                          onTap: () {
                            if (!tasks[index].isLocked) {
                              setState(() {
                                tasks[index].isCompleted =
                                    !tasks[index].isCompleted;
                                if (tasks[index].isCompleted &&
                                    index + 1 < tasks.length) {
                                  tasks[index + 1].isLocked = false;
                                }
                              });
                            }

                            Get.to(() => Writting_page());
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Task {
  String title;
  bool isCompleted;
  bool isLocked;

  Task(this.title, this.isCompleted, this.isLocked);
}

class TaskItem extends StatelessWidget {
  final Task task;
  final int index;
  final bool isNextTask;
  final VoidCallback onTap;

  const TaskItem({
    Key? key,
    required this.task,
    required this.index,
    required this.isNextTask,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: primary_color, width: 1.5),
      ),
      elevation: 1,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.only(right: 10, left: 2),
        onTap: task.isLocked ? null : onTap,
        leading: Container(
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: task.isCompleted
                ? Colors.green.shade200
                : (isNextTask ? Colors.blue.shade300 : Colors.blue.shade600),
            borderRadius: BorderRadius.circular(8),
          ),
          width: 50,
          height: 50,
          child: Center(
            child: task.isCompleted
                ? Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )
                : Icon(
                    task.isLocked ? Icons.lock : Icons.lock_open,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
        ),
        // titleAlignment: ListTileTitleAlignment.top,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: NectText(
                textAlign: TextAlign.start,
                text: task.title,
                fontWeight: FontWeight.w600,
                size: 14,
                color: task.isCompleted
                    ? Colors.black
                    : (isNextTask ? Colors.black : Colors.grey),
              ),
            ),
          ],
        ),
        trailing: Icon(
          task.isCompleted
              ? Icons.edit_square
              : (isNextTask ? Icons.edit_square : Icons.edit_square),
          color: task.isCompleted
              ? Colors.teal
              : (isNextTask ? Colors.teal : Colors.grey),
        ),
      ),
    );
  }
}
