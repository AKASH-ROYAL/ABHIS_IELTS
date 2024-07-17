import 'package:ielts_frontend/export.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final int index;
  final bool isNextTask;
  final VoidCallback onTap;
  final Widget trialIcon;

  const TaskItem({
    Key? key,
    required this.task,
    required this.index,
    required this.isNextTask,
    required this.onTap,
    required this.trialIcon,
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
          onTap: task.isLocked ? onTap : onTap,
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
          trailing: trialIcon),
    );
  }
}
