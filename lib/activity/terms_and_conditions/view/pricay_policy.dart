import 'package:flutter/material.dart';
import 'package:ielts_frontend/export.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TemplateScaffold(
        appBar: AppBar(
          title: Text('Privacy Policy', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.teal.shade800),
            onPressed: () {
              Get.back();
              // Handle back button press
            },
          ),
          elevation: 2.0, // Box shadow effect
        ),
        body: Container(
          color: Colors.grey[200], // Light gray background color
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'English Daily PTY LTD (trading as IELTS App)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                buildSectionTitle('1. We respect your privacy'),
                buildParagraph(
                    '(a) English Daily PTY LTD respects your right to privacy and is committed to safeguarding the privacy of our customers and software application users. We adhere to the National Privacy Principles established by the Australian Privacy Act 1988 (Cth). This policy sets out how we collect and treat your personal information.'),
                buildParagraph(
                    '(b) "Personal information" is information we hold which is identifiable as being about you.'),
                SizedBox(height: 16.0),
                buildSectionTitle('2. Collection of personal information'),
                buildParagraph(
                    '(a) English Daily PTY LTD will, from time to time, receive and store personal information you enter onto our software application IELTS App, provide to us directly or give to us in other forms.'),
                buildParagraph(
                    '(b) You may provide basic information such as your name, phone number, address, and email address to enable us to send information, provide updates, and process your product or service order. We may collect additional information at other times, including but not limited to, when you provide feedback, when you provide information about your personal or business affairs, change your content or email preference, respond to surveys and/or promotions, provide financial or credit card information, or communicate with our customer support.'),
                buildParagraph(
                    '(c) Additionally, we may also collect any other information you provide while interacting with us.'),
                SizedBox(height: 16.0),
                buildSectionTitle(
                    '3. How we collect your personal information'),
                buildParagraph(
                    '(a) English Daily PTY LTD collects personal information from you in a variety of ways, including when you interact with us electronically or in person, when you access our application, and when we provide our services to you.'),
                // Add more sections as needed...
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    );
  }

  Widget buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }
}
