import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:ielts_frontend/activity/dashboard/view/dashboard.dart';
import 'package:ielts_frontend/generated/assets.dart';
import 'package:ielts_frontend/global.dart';
import 'package:ielts_frontend/widgets/nect_widgets/nect_text/nect_text.dart';

import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';

class VerifyOtp extends StatelessWidget {
  const VerifyOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 53,
      height: 54,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffD8DADC)),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: primary_color),
      // border: Border.all(color: Color(0xff000000)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    Assets.imagesLoginTopRight,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                    // color: Colors.red,
                  ).marginOnly(right: 10, top: 10),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Image.asset(Assets.imagesLoginBottomLeft)
                      .marginOnly(bottom: 10, left: 10),
                ],
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                NectText(
                  text: "Verify your phone number",
                  fontWeight: FontWeight.bold,
                  size: 24,
                ),
                SizedBox(
                  height: 30,
                ),
                NectText(
                  text:
                      "We’ve sent an SMS with an activation code to your phone +33 2 94 27 84 11",
                  color: Colors.black.withOpacity(.7),
                  size: 14,
                  maxLines: 4,
                  textAlign: TextAlign.start,
                ),
                30.heightBox,
                TimerCountdown(
                    enableDescriptions: false,
                    format: CountDownTimerFormat.minutesSeconds,
                    spacerWidth: 0,
                    colonsTextStyle: TextStyle(
                        color: Color(0xffFFA000),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    timeTextStyle: TextStyle(
                        color: Color(0xffFFA000),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    endTime: DateTime.now().add(Duration(minutes: 2))),
                30.heightBox,
                Pinput(
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  length: 5,
                  // followingPinTheme: ,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (s) {
                    return s == '2222' ? null : 'Pin is incorrect';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
                30.heightBox,
                HStack([
                  NectText(
                    text: "I didn't receive a code",
                    maxLines: 2,
                    size: 14,
                    color: Color(0xff000000).withOpacity(.7),
                    minFontSize: 14,
                  ),
                  5.widthBox,
                  NectText(
                    maxLines: 2,
                    text: "Resend",
                    size: 14,
                    fontWeight: FontWeight.w600,
                    minFontSize: 14,
                    color: Color(0xff0D5D50),
                  ),
                ]),
                35.heightBox,
                VStack(
                  [
                    Container(
                      width: 400,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff1AA08B),
                                Color(0xff0D5D50),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      alignment: Alignment.center,
                      child: NectText(
                        text: "Continue",
                        color: Colors.white,
                        size: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ).onTap(() {
                      Get.to(() => Dashboard());
                    }),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ).w(double.infinity)
              ],
            ).paddingAll(24),
          )
        ],
      ),
    );
  }
}
