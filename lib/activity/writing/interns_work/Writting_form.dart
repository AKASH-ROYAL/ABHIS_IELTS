 import 'package:http/http.dart' as http;
import 'package:ielts_frontend/export.dart';
import 'dart:convert';
import 'Writting_submit.dart';

class Level3 extends StatefulWidget {
  @override
  _Level3State createState() => _Level3State();
}

class _Level3State extends State<Level3> {
  final TextEditingController _controller = TextEditingController();
  String _checkedContent = '';
  String _errors = '';

  Future<void> _checkGrammar() async {

    print("_checkGrammar triggered");
    final text = _controller.text;


    final url = Uri.parse('https://api.languagetool.org/v2/check');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'text': text,
        'language': 'en-US',
      },
    );
print(response.body);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final matches = result['matches'] as List;

      String errors = '';
      String correctedText = text;

      for (var match in matches) {
        final message = match['message'];
        final replacements = match['replacements'] as List;
        final offset = match['offset'];
        final length = match['length'];

        errors += '$message\n';

        if (replacements.isNotEmpty) {
          final replacement = replacements.first['value'];
          correctedText =
              correctedText.replaceRange(offset, offset + length, replacement);
        }
      }

      setState(() {
        _checkedContent = correctedText;
        _errors = errors;
      });
      Get.to(()=>  Page5(
        checkedContent: _checkedContent,
        errors: _errors,
      ));
    } else {
      setState(() {
        _checkedContent = 'Failed to check grammar. Please try again.';
        _errors = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text(
                'Writing: ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                '(Expert) Level-3',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'SOCIOLOGY',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Describe the above image...',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green),
                  ),
                  child: TextField(
                    controller: _controller,
                    maxLines: null,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _checkGrammar,
                  child: Text('SUBMIT'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension StringExtensions on String {
  String replaceRange(int start, int end, String replacement) {
    return this.substring(0, start) + replacement + this.substring(end);
  }
}
