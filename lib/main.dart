import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts_frontend/activity/auth/view/verify_otp.dart';
import 'package:ielts_frontend/activity/reading/view/Reading.dart';
import 'package:ielts_frontend/activity/terms_and_conditions/view/systemsettings.dart';

import 'activity/auth/view/send_otp.dart';
import 'activity/auth/view/splash_screen.dart';
import 'activity/dashboard/view/dashboard.dart';
import 'activity/feedback/view/Feedbackpage.dart';
import 'activity/feedback/view/Notificationpage.dart';
import 'activity/listening/view/listening_task_list.dart';
import 'activity/profile/view/profile.dart';
import 'activity/speaking/speaking.dart';
import 'activity/terms_and_conditions/view/termsandcondition.dart';
import 'activity/terms_and_conditions/view/termsandcondition2.dart';
import 'activity/writing/view/writing_task.dart';

void main() {
  runApp(GetMaterialApp(
    home: NotificationPage(),
    
    theme: ThemeData(
      fontFamily: "Inter",
    ),
    defaultTransition: Transition.downToUp,
    debugShowCheckedModeBanner: false,
  ));
}
