import 'package:ielts_frontend/export.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TemplateScaffold(
        appBar: AppBar(
          title:
              Text('Terms of service', style: TextStyle(color: Colors.black)),
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
                buildSectionTitle('About the Application'),
                buildParagraph(
                    'Welcome to IELTS App (the \'Application\'). The Application provides online tutoring services (the \'Services\').'),
                buildParagraph(
                    'The Application is operated by ENGLISH DAILY PTY. LTD. (ACN 641 406 822). Access to and use of the Application, or any of its associated Products or Services, is provided by ENGLISH DAILY. Please read these terms and conditions (the \'Terms\') carefully. By using, browsing, and/or reading the Application, this signifies that you have read, understood, and agree to be bound by the Terms. If you do not agree with the Terms, you must cease usage of the Application, or any of its Services, immediately.'),
                buildParagraph(
                    'ENGLISH DAILY reserves the right to review and change any of the Terms by updating this page at its sole discretion. When ENGLISH DAILY updates the Terms, it will use reasonable endeavors to provide you with notice of updates to the Terms. Any changes to the Terms take immediate effect from the date of their publication. Before you continue, we recommend you keep a copy of the Terms for your records.'),
                SizedBox(height: 16.0),
                buildSectionTitle('Acceptance of the Terms'),
                buildParagraph(
                    'You accept the Terms by using or browsing the Application. You may also accept the Terms by clicking to accept or agree to the Terms where this option is made available to you by ENGLISH DAILY in the user interface.'),
                SizedBox(height: 16.0),
                buildSectionTitle('Registration to use the Services'),
                buildParagraph(
                    'In order to access the Services, you must first register for an account through the Application (the \'Account\').'),
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
