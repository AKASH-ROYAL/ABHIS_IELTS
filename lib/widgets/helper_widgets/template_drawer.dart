import 'package:flutter/cupertino.dart';
import 'package:ielts_frontend/activity/auth/view/send_otp.dart';
import 'package:ielts_frontend/activity/settings/view/settings.dart';
import 'package:ielts_frontend/activity/terms_and_conditions/view/pricay_policy.dart';
import 'package:ielts_frontend/activity/terms_and_conditions/view/terms_of_service.dart';
import 'package:ielts_frontend/export.dart';

class TemplateDrawer extends StatelessWidget {
  const TemplateDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var linearGradient = LinearGradient(colors: [
      Color(0xff167F71),
      Color(0xff0D5D50),
    ]);
    return Container(
      width: 225,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), bottomRight: Radius.circular(15))),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HStack([
                  Image.asset(Assets.imagesDrawerTriangle),
                  Spacer(),
                  Container(
                    height: 75,
                    width: 68,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: linearGradient,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(35),
                        )),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 25,
                      color: Colors.white,
                    ),
                  ).onTap(() {
                    Get.back();
                  })
                ]),
                VStack([
                  buildDrawerCard(
                      image: Assets.imagesSpeaking,
                      title: "Speaking",
                      onTap: () {
                        Get.back();
                        taskController.taskListNavigation(taskIndex: 1);
                      }),
                  buildDrawerCard(
                      image: Assets.imagesReading,
                      title: "Reading",
                      onTap: () {
                        Get.back();

                        taskController.taskListNavigation(taskIndex: 2);
                      }),
                  buildDrawerCard(
                      image: Assets.imagesWriting,
                      title: "Writing",
                      onTap: () {
                        Get.back();

                        taskController.taskListNavigation(taskIndex: 3);
                      }),
                  buildDrawerCard(
                      image: Assets.imagesListening,
                      title: "Listening",
                      onTap: () {
                        Get.back();

                        taskController.taskListNavigation(taskIndex: 4);
                      }),
                  buildDrawerCard(
                      image: Assets.imagesSettings,
                      title: "Settings",
                      onTap: () {
                        Get.back();

                        Get.to(() => Settings());
                      }),
                  buildDrawerCard(
                      image: Assets.imagesReading,
                      title: "Logout",
                      onTap: () {
                        Get.offAll(() => SendOtp());
                      }),
                  // Spacer(),
                ]).marginOnly(left: 33, top: 40),
                80.heightBox,
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 74,
              decoration: BoxDecoration(
                  gradient: linearGradient,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              child: Center(
                child: VStack(
                  [
                    NectText(
                      text: "Privacy Policy",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ).onTap(() {
                      Get.back();
                      Get.to(() => PrivacyPolicyScreen());
                    }),
                    NectText(
                      text: "Terms and Conditions",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ).onTap(() {
                      Get.back();

                      Get.to(() => TermsOfServiceScreen());
                    }),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  buildDrawerCard(
      {required String image,
      required String title,
      required Function() onTap}) {
    return HStack([
      Image.asset(
        image,
        width: 25,
        height: 26,
      ),
      11.widthBox,
      NectText(
        text: title,
        color: primary_color,
        fontWeight: FontWeight.w500,
      )
    ])
        .onInkTap(onTap
            // Get.back();
            )
        .w(double.infinity)
        .marginOnly(bottom: 21);
  }
}
