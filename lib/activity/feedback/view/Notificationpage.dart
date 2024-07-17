
import 'package:flutter/cupertino.dart';
import 'package:ielts_frontend/export.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationItem> notifications = [
    NotificationItem(color: Colors.orange, title: 'Action required: Verify your email address to save your progress'),
    NotificationItem(color: Colors.blue, title: 'Check in Write: IELTS exam for summer Admission'),
    NotificationItem(color: Colors.purple, title: 'Reminder: Turn in final coursework'),
  ];

  void removeNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green, size: 40),
          onPressed: () {
            // Implement back button functionality here
          },
        ),
        title: Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      removeNotification(index);
                    },
                    background: Container(color: Colors.white),
                    child: NotificationTile(
                      color: notifications[index].color,
                      title: notifications[index].title,
                      onClose: () => removeNotification(index),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Image.asset(
              'assets/Group 36803.png',
              height: 100, // Adjust the height as needed
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onClose;

  NotificationTile({required this.color, required this.title, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: Icon(CupertinoIcons.clear_circled_solid, color: Colors.black),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}

class NotificationItem {
  final Color color;
  final String title;

  NotificationItem({required this.color, required this.title});
}