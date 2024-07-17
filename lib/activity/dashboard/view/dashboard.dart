import 'package:flutter/cupertino.dart';
import 'package:ielts_frontend/activity/dashboard/helper_widgets/exam_scedular_card.dart';
import 'package:ielts_frontend/activity/dashboard/helper_widgets/word_definition_card.dart';
import 'package:ielts_frontend/export.dart';
import 'package:ielts_frontend/widgets/helper_widgets/hamburger_icon.dart';
import 'package:ielts_frontend/widgets/helper_widgets/template_drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TemplateScaffold(
        backgroundColor: primary_color,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // icon
          Stack(
            children: [
              VStack(
                [
                  HamburgerIcon(),
                  HStack([
                    Container(
                      height: 71,
                      width: 71,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                          image: DecorationImage(
                              image: AssetImage(
                                Assets.imagesProfile,
                              ),
                              fit: BoxFit.fitHeight)),
                    ),
                    12.widthBox,
                    NectText(
                      text: "Hi,\nJhonson",
                      maxLines: 2,
                      size: 17,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                      color: Colors.white,
                    )
                  ]).marginOnly(left: 26, top: 20, bottom: 8),
                ],
              ),
              Positioned(
                  right: 13,
                  top: 13,
                  child: Image.asset(Assets.imagesDashboardTriangle))
            ],
          ).w(double.infinity),

          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NectText(
                      text: "Overall Progress",
                      fontWeight: FontWeight.w600,
                      size: 15,
                    ),
                    10.heightBox,
                    Container(
                      height: 46,
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff000000).withOpacity(.2),
                              // Shadow color
                              offset: Offset(3, 3),
                              // Shadow position
                              blurRadius: 5,
                              // Blur radius
                              spreadRadius: 0, // Spread radius
                            ),
                          ]),
                      child: HStack(
                        [
                          Expanded(
                            child: WaveLinearProgressIndicator(
                              waveBackgroundColor: primary_color,
                              waveColor: primary_color,
                              labelDecoration: BoxDecoration(
                                  color: primary_color,
                                  borderRadius: BorderRadius.circular(6)),
                              color: primary_color,
                              value: .3,
                              waveStep: 0,
                              enableBounceAnimation: false,
                            ),
                          ),
                          Container(
                            height: 46,
                            width: 33,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                  Color(0xff1AA08B),
                                  Color(0xff0D5D50),
                                ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Image.asset(Assets.imagesTrophy),
                          )
                        ],
                      ),
                    ),
                    17.heightBox,
                    NectText(
                      text: "Your IELTS sections",
                      // fontFamily: "asd",
                      fontWeight: FontWeight.w600,
                      size: 15,
                    ),
                    17.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            // width: 0,
                            height: 70,

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: primary_color)),
                            child: HStack(
                              [
                                Image.asset(
                                  Assets.imagesSpeaking,
                                  width: 40,
                                  height: 40,
                                ),
                                NectText(
                                  text: "Speaking",
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                  color: primary_color,
                                )
                              ],
                              alignment: MainAxisAlignment.center,
                            ),
                          ).onTap(() {
                            taskController.taskListNavigation(taskIndex: 1);
                          }),
                        ),
                        34.widthBox,
                        Expanded(
                          child: Container(
                            // width: 0,
                            height: 70,

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: primary_color)),
                            child: HStack(
                              [
                                Image.asset(
                                  Assets.imagesReading,
                                  width: 40,
                                  height: 40,
                                ),
                                NectText(
                                  text: "Reading",
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                  color: primary_color,
                                )
                              ],
                              alignment: MainAxisAlignment.center,
                            ),
                          ).onTap(() {
                            taskController.taskListNavigation(taskIndex: 2);
                          }),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 16),
                    17.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            // width: 0,
                            height: 70,

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: primary_color)),
                            child: HStack(
                              [
                                Image.asset(
                                  Assets.imagesWriting,
                                  width: 40,
                                  height: 40,
                                ),
                                NectText(
                                  text: "Writing",
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                  color: primary_color,
                                )
                              ],
                              alignment: MainAxisAlignment.center,
                            ),
                          ).onTap(() {
                            taskController.taskListNavigation(taskIndex: 3);
                          }),
                        ),
                        34.widthBox,
                        Expanded(
                          child: Container(
                            // width: 0,
                            height: 70,

                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: primary_color)),
                            child: HStack(
                              [
                                Image.asset(
                                  Assets.imagesListening,
                                  width: 40,
                                  height: 40,
                                ),
                                NectText(
                                  text: "Listening",
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                  color: primary_color,
                                )
                              ],
                              alignment: MainAxisAlignment.center,
                            ),
                          ).onTap(() {
                            taskController.taskListNavigation(taskIndex: 4);
                          }),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 16),
                    15.heightBox,
                    ExamScheduleCard(),
                    SizedBox(height: 20),
                    WordDefinitionCard(),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Image.asset(
                            Assets.imagesAbhisCopyright,
                            height: 40,
                          ),
                          Text(
                            '© 2024 IELTS App 0.0.1',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
