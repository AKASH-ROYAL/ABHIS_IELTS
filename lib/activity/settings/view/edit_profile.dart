import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts_frontend/export.dart';
import 'package:ielts_frontend/global.dart';

class Editprofile extends StatelessWidget {
  const Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0, -1),
                end: Alignment(0, 0.933),
                colors: <Color>[Color(0xFF0D5D50), Color(0xFF1AA08B)],
                stops: <double>[0.092, 0.454],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 8.7,
                  top: -6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: SizedBox(
                        width: 83.3,
                        height: 112,
                        child: Image.asset(Assets.imagesDashboardTriangle)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(14, 0, 14, 102),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Container(
                                      //   // margin: EdgeInsets.fromLTRB(0, 13, 19, 6),
                                      //   child: Container(
                                      //     decoration: BoxDecoration(
                                      //       color: Color(0xFFFFFFFF),
                                      //     ),
                                      //     child: Container(
                                      //       width: 13,
                                      //       height: 0,
                                      //     ),
                                      //   ),
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(
                                                Icons.arrow_back,
                                                color: Colors.white,
                                              )),
                                          Text(
                                            'Profile',
                                            style: GoogleFonts.getFont(
                                              'Poppins',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17,
                                              height: 1.3,
                                              letterSpacing: -0.2,
                                              color: Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF000000)),
                                  color: Color(0xFFF6F6F6),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 69, 13, 6),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(13, 0, 1, 6),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 6),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: ' Name ',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.3,
                                                      color: Color(0xB2000000),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '*',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          height: 1.3,
                                                          color:
                                                              Color(0xFFEC1C24),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Enter The Name',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 6),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: ' Email Id ',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.3,
                                                      color: Color(0xB2000000),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '*',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          height: 1.3,
                                                          color:
                                                              Color(0xFFEC1C24),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Enter The Email',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Switch(
                                                  value: false,
                                                  onChanged: (bool value) {},
                                                  activeColor: primary_color,
                                                ),
                                                Text(
                                                  'Visible in Public',
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 6),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: ' Mobile Number ',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.3,
                                                      color: Color(0xB2000000),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '*',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          height: 1.3,
                                                          color:
                                                              Color(0xFFEC1C24),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Enter The Mobile Number',
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType: TextInputType.phone,
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Switch(
                                                  value: false,
                                                  onChanged: (bool value) {},
                                                  activeColor: primary_color,
                                                ),
                                                Text(
                                                  'Visible in Public',
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 6),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: 'Gender ',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.3,
                                                      color: Color(0xB2000000),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '*',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          height: 1.3,
                                                          color:
                                                              Color(0xFFEC1C24),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DropdownButtonFormField<String>(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              items: ['Male', 'Female', 'Other']
                                                  .map((gender) =>
                                                      DropdownMenuItem(
                                                        value: gender,
                                                        child: Text(gender),
                                                      ))
                                                  .toList(),
                                              onChanged: (value) {},
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 6),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: ' Country ',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.3,
                                                      color: Color(0xB2000000),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '*',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          height: 1.3,
                                                          color:
                                                              Color(0xFFEC1C24),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DropdownButtonFormField<String>(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              items: ['India', 'Other']
                                                  .map((country) =>
                                                      DropdownMenuItem(
                                                        value: country,
                                                        child: Text(country),
                                                      ))
                                                  .toList(),
                                              onChanged: (value) {},
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 6),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: ' State ',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.3,
                                                      color: Color(0xB2000000),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '*',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          height: 1.3,
                                                          color:
                                                              Color(0xFFEC1C24),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DropdownButtonFormField<String>(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              items: ['Tamil Nadu', 'Other']
                                                  .map((state) =>
                                                      DropdownMenuItem(
                                                        value: state,
                                                        child: Text(state),
                                                      ))
                                                  .toList(),
                                              onChanged: (value) {},
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 6),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: ' City ',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.3,
                                                      color: Color(0xB2000000),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: '*',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          height: 1.3,
                                                          color:
                                                              Color(0xFFEC1C24),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DropdownButtonFormField<String>(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              items: ['Chennai', 'Other']
                                                  .map((city) =>
                                                      DropdownMenuItem(
                                                        value: city,
                                                        child: Text(city),
                                                      ))
                                                  .toList(),
                                              onChanged: (value) {},
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: Text('Save',
                                                    style: TextStyle(
                                                        fontSize: 15)),
                                                style: ButtonStyle(
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                Colors.white),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                                primary_color),
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ))),
                                              ),
                                            ),
                                            Container(
                                              width: 90,
                                              height: 30,
                                              child: Image.asset(
                                                Assets.imagesAbhisCopyright,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  2, 0, 0, 0),
                                              child: Text(
                                                '© 2024 IELTS App 0.0.1',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10,
                                                  height: 1.3,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ).hide(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Positioned(
                        right: 120,
                        top: 67,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(65),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://thumb.ac-illust.com/62/629d50b21bd25e27dcc1b84823c18404_w.jpeg',
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x40000000),
                                offset: Offset(0, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Container(
                            width: 130,
                            height: 130,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 120,
                        top: 157,
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: SvgPicture.asset(
                            'assets/image/CameraIcon.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
