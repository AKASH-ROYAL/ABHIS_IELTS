import 'package:ielts_frontend/activity/listening/model/task_model.dart';
import 'package:ielts_frontend/activity/listening/view/quiz.dart';
import 'package:ielts_frontend/export.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final int index;
  final VoidCallback onCompleteTask;

  TaskWidget({
    required this.task,
    required this.index,
    required this.onCompleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: task.unlocked ? Colors.green : Colors.blueAccent,
          child: Text(
            '$index',
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(task.title),
        trailing: Icon(
          task.unlocked ? Icons.play_arrow : Icons.lock,
          color: task.unlocked ? Colors.green : Colors.blueAccent,
        ),
        onTap: task.unlocked
            ? () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizPage(
                taskTitle: task.title,
                onComplete: onCompleteTask,
              ),
            ),
          );
        }
            : null,
      ),
    );
  }
}
