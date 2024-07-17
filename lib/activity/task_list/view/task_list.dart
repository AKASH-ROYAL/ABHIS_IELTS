import 'package:ielts_frontend/activity/task_list/controller/task_controller.dart';
import 'package:ielts_frontend/activity/task_list/helper_widgets/task_item.dart';
import 'package:ielts_frontend/activity/writing/view/WritingTaskPage.dart';
import 'package:ielts_frontend/export.dart';
import 'package:ielts_frontend/widgets/helper_widgets/hamburger_icon.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class TaskList extends StatefulWidget {
  final String headerImage;
  final List<Task> taskList;
  final Widget trialIcon;
  final String taskType;
  final int taskIndex;

  const TaskList(
      {super.key,
      required this.headerImage,
      required this.taskList,
      required this.trialIcon,
      required this.taskType,
      required this.taskIndex});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  // int get completedTasksCount => widget.taskList.where((task) => task.isCompleted).length;

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
                        Icon(
                          size: 30,
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ).onTap(() {
                          Get.back();
                        }).marginOnly(left: 5, right: 5),
                        SizedBox(width: 5),
                        Text(
                          widget.taskType.toString(),
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
                              widget.headerImage,
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
                      for (int index = 0;
                          index < widget.taskList.length;
                          index++)
                        TaskItem(
                          task: widget.taskList[index],
                          index: index,
                          isNextTask: index == 1,
                          onTap: () {
                            // if (!widget.taskList[index].isLocked) {
                            //   setState(() {
                            //     widget.taskList[index].isCompleted =
                            //         !widget.taskList[index].isCompleted;
                            //     if (widget.taskList[index].isCompleted &&
                            //         index + 1 < widget.taskList.length) {
                            //       widget.taskList[index + 1].isLocked = false;
                            //     }
                            //   });
                            // }
                            print("TaskItemTapped ");
                            print("taskIndex : ${widget.taskIndex}");

                            TaskController().taskPageNavigation(
                                taskIndex: widget.taskIndex);
                          },
                          trialIcon: widget.trialIcon,
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
