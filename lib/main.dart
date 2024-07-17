import 'package:ielts_frontend/activity/auth/view/verify_otp.dart';
import 'package:ielts_frontend/activity/terms_and_conditions/view/systemsettings.dart';
import 'package:ielts_frontend/export.dart';

import 'activity/auth/view/send_otp.dart';
import 'activity/auth/view/splash_screen.dart';
import 'activity/feedback/view/Feedbackpage.dart';
import 'activity/feedback/view/Notificationpage.dart';
import 'activity/listening/view/listening_task_page.dart';
import 'activity/speaking/speaking.dart';
import 'activity/task_list/view/task_list.dart';
import 'activity/terms_and_conditions/view/pricay_policy.dart';
import 'activity/terms_and_conditions/view/terms_of_service.dart';
import 'activity/writing/view/WritingTaskPage.dart';
import 'activity/writing/view/writing_task.dart';

void main() {
  runApp(GetMaterialApp(
    home: SplashScreen(),
    // home: TaskList(
    //   headerImage: 'assets/images/Vector.png',
    //   taskList: writingTasks,
    //   trialIcon: Icon(Icons.edit_square),
    //   taskType: 'Speaking',
    //   taskIndex: 1,
    // ),

    theme: ThemeData(
      fontFamily: "Inter",
    ),
    defaultTransition: Transition.downToUp,
    debugShowCheckedModeBanner: false,
  ));
}
