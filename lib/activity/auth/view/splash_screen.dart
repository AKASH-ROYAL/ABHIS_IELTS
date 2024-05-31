import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ielts_frontend/generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> _images = [
    "assets/images/pre_auth_01.png",
    "assets/images/pre_auth_02.png",
    "assets/images/pre_auth_03.png",
  ];

  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startImageTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startImageTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 900),
            child: Container(
              key: ValueKey<int>(_currentIndex),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(_images[_currentIndex]),
                      fit: BoxFit.fill)),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.7),
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .05,
                      horizontal: MediaQuery.of(context).size.width * .1),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(Assets.imagesSplashTopRight),
                        ],
                      ),
                      Spacer(),
                      Image.asset(Assets.imagesAbhisLogo),
                      Text(
                        "IELTS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        "Your Language Leap",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      // Text(
                      //   "Your Language Leap",
                      //   style: TextStyle(
                      //       fontFamily: "Inter",
                      //       fontWeight: FontWeight.w400,
                      //       fontSize: 16),
                      // ),
                      Spacer(
                        flex: 2,
                      ),
                      Row(
                        children: [
                          Image.asset(Assets.imagesSplashBottomLeft),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
