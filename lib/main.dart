import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts_frontend/activity/auth/view/verify_otp.dart';
import 'package:ielts_frontend/activity/task_list/view/task_list.dart';
import 'package:ielts_frontend/rough/karthi_formtask.dart';

import 'activity/auth/view/send_otp.dart';
import 'activity/auth/view/splash_screen.dart';
import 'activity/dashboard/view/dashboard.dart';
import 'activity/listening/view/listening.dart';

void main() {
  runApp(GetMaterialApp(
    home: SplashScreen(),
    theme: ThemeData(
      fontFamily: "Inter",
    ),
    defaultTransition: Transition.downToUp,
    debugShowCheckedModeBanner: false,
  ));
}
