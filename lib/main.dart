import 'package:flutter/material.dart';

import 'activity/auth/view/send_otp.dart';
import 'activity/auth/view/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    home: SendOtp(),
    // home: SplashScreen(),
    theme: ThemeData(fontFamily: "Inter"),
    debugShowCheckedModeBanner: false,
  ));
}
