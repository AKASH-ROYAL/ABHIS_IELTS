import 'package:flutter/material.dart';



class SystemSettingsScreen extends StatefulWidget {
  const SystemSettingsScreen({super.key});

  @override
  _SystemSettingsScreenState createState() => _SystemSettingsScreenState();
}

class _SystemSettingsScreenState extends State<SystemSettingsScreen> {
  bool isLessonAutoPlayOn = true;
  bool isAlternativePlayerOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Add your onPressed code here!
          },
        ),
        title: Text(
          'System Settings',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: Text('Lesson Auto Play'),
                        value: isLessonAutoPlayOn,
                        activeColor: Colors.green,
                        onChanged: (bool value) {
                          setState(() {
                            isLessonAutoPlayOn = value;
                          });
                        },
                      ),
                      Divider(height: 1, color: Colors.grey),
                      SwitchListTile(
                        title: Text('Use Alternative Player (Not Recommended)'),
                        value: isAlternativePlayerOn,
                        activeColor: Colors.green,
                        onChanged: (bool value) {
                          setState(() {
                            isAlternativePlayerOn = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/g.png"),
                      SizedBox(width: 8),
                      // Text(
                      //   '© 2024 IELTS App 0.0.1',
                      //   style: TextStyle(
                      //     color: Colors.grey,
                      //     fontSize: 12,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 26,
            child: Image.asset(color: Colors.teal.shade800,
              'assets/right.png', // Replace with your image path
              width: 90,
              height: 90,
            ),
          ),
        ],
      ),
    );
  }
}
