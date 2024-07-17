import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ielts_frontend/activity/profile/view/edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
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
                    child: SvgPicture.asset("assets/image/Icon1.svg")),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(13, 0, 13, 76),
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Settings',
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
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(105.1, 0, 0, 7),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Vijay',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                height: 1.3,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'USER ID: 65478892',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'DATE OF JOINING: 29-Mar-2024',
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        ListTile(
                          title: Text('Email ID'),
                          subtitle: Text('johnny2024@gmail.com'),
                          trailing: Icon(Icons.verified, color: Colors.green),
                        ),
                        ListTile(
                          title: Text('Mobile Number'),
                          subtitle: Text('8900089000'),
                          trailing: Icon(Icons.verified, color: Colors.green),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {Navigator.push(context,
                                                  MaterialPageRoute(
                                                    builder:(context) => EditProfile(),));},
                              child: Text('Edit Profile',style:TextStyle(color: Colors.teal),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Share Profile',style: TextStyle(color: Colors.teal),),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.info,
                            color: Colors.teal,
                          ),
                          title: Text('About Us'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.feedback, color: Colors.teal,),
                          title: Text('Share Feedback'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.notifications,color: Colors.teal,),
                          title: Text('Notification'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.help,color: Colors.teal,),
                          title: Text('FAQ'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.settings, color: Colors.teal,),
                          title: Text('System Settings'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.privacy_tip, color: Colors.teal,),
                          title: Text('Privacy Policy'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.description, color: Colors.teal,),
                          title: Text('Terms of Service'),
                          onTap: () {},
                        ),
                        Container(
                            child: SizedBox(
                                width: 307,
                                child: Row(children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 3.9, 13),
                                    child: SizedBox(
                                      width: 83.1,
                                      height: 74,
                                      child: SvgPicture.asset(
                                        'assets/image/Icon.svg',
                                      ),
                                    ),
                                  ),
                                  Column(children: [
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Log out',
                                        style: TextStyle(color: Colors.teal),
                                      ),
                                      style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.teal),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ))),
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                      width: 80,
                                      height: 50,
                                      child: Image.asset("assets/image/abhis Logo.png"),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '© 2024 IELTS App 0.0.1',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ]),
                                  SizedBox(height: 20),
                                ])))
                      ],
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 66,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(62.5),
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
                        width: 125,
                        height: 125,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
