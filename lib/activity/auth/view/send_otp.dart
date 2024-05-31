import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ielts_frontend/generated/assets.dart';
import 'package:ielts_frontend/widgets/nect_widgets/nect_text/nect_text.dart';
import 'package:velocity_x/velocity_x.dart';

class SendOtp extends StatelessWidget {
  const SendOtp({super.key});

  @override
  Widget build(BuildContext context) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 75,
              ),
              NectText(
                text: "Login|Register",
                fontWeight: FontWeight.bold,
                size: 19,
              ),
              SizedBox(
                height: 30,
              ),
              NectText(
                text:
                    "Please confirm your country code and enter your phone number.",
                color: Colors.black.withOpacity(.7),
                size: 14,
                maxLines: 4,
                textAlign: TextAlign.start,
              ),
              NectText(
                text: "Enter mobile no:",
                size: 15,
              ).marginOnly(top: 25, bottom: 15),
              Container(
                height: 54,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      alignment: Alignment.center,
                      child: Text(
                        "+33",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                    VerticalDivider(
                      width: 1,
                      color: Colors.grey,
                      thickness: 1,
                    ).h(26),
                    Expanded(
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        // textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: " ",
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ).color(Colors.transparent),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (val) {}),
                  Expanded(
                    child: NectText(
                      text:
                          "By creating an account you have to agree with our them & condication",
                      color: Color(0xff7C7C7C),
                      fontWeight: FontWeight.w400,
                      size: 12,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ).paddingAll(24)
        ],
      ),
    );
  }
}
