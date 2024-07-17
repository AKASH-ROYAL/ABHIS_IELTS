import 'package:flutter/material.dart';
import 'package:ielts_frontend/activity/writing/view/Writting_page.dart';
import 'package:ielts_frontend/export.dart';


class writing_task extends StatefulWidget {
  @override
  _writing_taskState createState() => _writing_taskState();
}

class _writing_taskState extends State<writing_task> {
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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.teal.shade500,
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.menu, size: 30, color: Colors.white),
                              onPressed: () {},
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Writing",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                                ),
                                Text(
                                  "${(completedTasksCount / tasks.length * 100).toInt()}%",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Vector.png',
                          width: 100,
                          height: 70,
                        ),
                        SizedBox(height: 10),
                        Image.asset(
                          'assets/images/writing_header.png',
                          width: 50,
                          height: 70,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              "Task",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(
                  task: tasks[index],
                  index: index,
                  isNextTask: index == completedTasksCount,
                  onTap: () {
                    if (!tasks[index].isLocked) {
                      setState(() {
                        tasks[index].isCompleted = !tasks[index].isCompleted;
                        if (tasks[index].isCompleted && index + 1 < tasks.length) {
                          tasks[index + 1].isLocked = false;
                        }
                      });
                    }

                    Get.to(()=>Writting_page());

                  },
                );
              },
            ),
          ),
        ],
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
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: Colors.black54, width: 2),
      ),
      elevation: 1,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: task.isLocked ? null : onTap,
        leading: Container(
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
        title: Text(
          task.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: task.isCompleted
                ? Colors.black
                : (isNextTask ? Colors.black : Colors.grey),
          ),
        ),
        trailing: Icon(
          task.isCompleted ? Icons.edit_square : (isNextTask ? Icons.edit_square : Icons.edit_square),
          color: task.isCompleted
              ? Colors.teal
              : (isNextTask ? Colors.teal : Colors.grey),
        ),
      ),
    );
  }
}
