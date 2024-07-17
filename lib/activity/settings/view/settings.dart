import 'package:google_fonts/google_fonts.dart';
import 'package:ielts_frontend/export.dart';
import 'package:ielts_frontend/widgets/helper_widgets/hamburger_icon.dart';

import 'edit_profile.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TemplateScaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(children: [
              Container(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, top: 10),
                            height: 120,
                            decoration: BoxDecoration(
                              color: primary_color,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    HamburgerIcon(),
                                    SizedBox(width: 5),
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
                                Container(
                                    margin: EdgeInsets.only(right: 5),
                                    child: Image.asset(
                                        Assets.imagesDashboardTriangle,
                                        height: 100)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 90,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15, right: 10),
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Email ID',
                                              style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  height: 1.3,
                                                  color: Colors.black45),
                                            ),
                                            Text(
                                              'vijay5@gmail.com',
                                              style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.3,
                                                  color: Colors.black),
                                            ),
                                          ]),
                                      Row(
                                        children: [
                                          Icon(Icons.verified,
                                              color: primary_color),
                                          Text("Verifed",
                                              style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.3,
                                                  color: primary_color)),
                                        ],
                                      )
                                    ]),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mobile Number',
                                          style: GoogleFonts.getFont('Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              height: 1.3,
                                              color: Colors.black45),
                                        ),
                                        Text(
                                          '9234567891',
                                          style: GoogleFonts.getFont('Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.3,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.verified,
                                            color: primary_color),
                                        Text("Verifed",
                                            style: GoogleFonts.getFont('Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.3,
                                                color: primary_color)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ButtonBar(
                            alignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Editprofile(),
                                      ));
                                },
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: primary_color,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Share Profile',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: primary_color,
                                ),
                              ),
                            ],
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.info,
                              color: primary_color,
                            ),
                            title: Text(
                              'About Us',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.3,
                              ),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.feedback,
                              color: primary_color,
                            ),
                            title: Text(
                              'Share Feedback',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.3,
                              ),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.notifications,
                              color: primary_color,
                            ),
                            title: Text(
                              'Notification',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.3,
                              ),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.help,
                              color: primary_color,
                            ),
                            title: Text(
                              'FAQ',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.3,
                              ),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.settings,
                              color: primary_color,
                            ),
                            title: Text(
                              'System Settings',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.3,
                              ),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.privacy_tip,
                              color: primary_color,
                            ),
                            title: Text(
                              'Privacy Policy',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.3,
                              ),
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.description,
                              color: primary_color,
                            ),
                            title: Text(
                              'Terms of Service',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.3,
                              ),
                            ),
                            onTap: () {},
                          ),
                          Container(
                              child: SizedBox(
                                  width: 307,
                                  child: Row(children: [
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 3.9, 13),
                                      child: SizedBox(
                                          width: 83.1,
                                          height: 74,
                                          child: Image.asset(
                                              Assets.imagesSettingsFooter)),
                                    ),
                                    Column(children: [
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Log out',
                                          style:
                                              TextStyle(color: primary_color),
                                        ),
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(primary_color),
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: primary_color),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ))),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 80,
                                        height: 50,
                                        child: Image.asset(
                                            Assets.imagesAbhisCopyright),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '© 2024 IELTS App 0.0.1',
                                        style: TextStyle(color: Colors.black54),
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
                      child: Row(
                        children: [
                          Container(
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
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Vijay',
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    height: 1.3,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    'USER ID: 000000',
                                    style: GoogleFonts.getFont('Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        height: 1.3,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'DATE OF JOINING: 30-Jun-2024',
                                    style: GoogleFonts.getFont('Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        height: 1.3,
                                        color: Colors.black45),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
