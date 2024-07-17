import 'package:http/http.dart';
import 'package:ielts_frontend/activity/listening/view/listening_task_page.dart';
import 'package:ielts_frontend/activity/reading/view/reading_task_page.dart';
import 'package:ielts_frontend/activity/speaking/speaking.dart';
import 'package:ielts_frontend/activity/task_list/view/task_list.dart';
import 'package:ielts_frontend/activity/writing/view/WritingTaskPage.dart';
import 'package:ielts_frontend/export.dart';

class TaskController {
  void taskListNavigation({required int taskIndex}) {
    switch (taskIndex) {
      case 1:
        Get.to(() => TaskList(
            headerImage: Assets.imagesSpeakingHeader,
            taskList: speakingTasks,
            trialIcon: Image.asset(Assets.imagesSpeakingTrial),
            taskType: "Speaking",
            taskIndex: 1));
        break;
      case 2:
        Get.to(() => TaskList(
            headerImage: Assets.imagesReadingHeader,
            taskList: readingTasks,
            trialIcon: Image.asset(Assets.imagesReadingTrial),
            taskType: "Reading",
            taskIndex: 2));
        break;
      case 3:
        Get.to(() => TaskList(
            headerImage: Assets.imagesWritingHeaderList,
            taskList: writingTasks,
            trialIcon: Image.asset(Assets.imagesWritingTrail),
            taskType: "Writing",
            taskIndex: 3));
        break;
      case 4:
        Get.to(() => TaskList(
            headerImage: Assets.imagesListeningHeaderList,
            taskList: listeningTask,
            trialIcon: Image.asset(Assets.imagesListeningTrial),
            taskType: "Listening",
            taskIndex: 4));
        break;
    }
  }

  void taskPageNavigation({required int taskIndex}) {
    print("Task Navigation triggred");
    switch (taskIndex) {
      case 1:
        Get.to(() => SpeakingTaskPage());
        break;
      case 2:
        Get.to(() => ReadingTaskPage());
        break;
      case 3:
        Get.to(() => WritingTaskPage());
        break;
      case 4:
        Get.to(() => ListeningTaskPage());
        break;
    }
  }
}
