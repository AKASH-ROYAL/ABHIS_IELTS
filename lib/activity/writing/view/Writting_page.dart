import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'Error_page.dart'; // Ensure this import points to the correct path



class Writting_page extends StatefulWidget {
  @override
  _Writting_pageState createState() => _Writting_pageState();
}

class _Writting_pageState extends State<Writting_page> {
  final TextEditingController _controller = TextEditingController();
  String _checkedContent = 'This is the checked content.';
  String _errors = 'Error: Something went wrong.';

  int _wordCount = 0;
  Timer? _timer;
  Duration _elapsedTime = Duration();
  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onTextChanged() {
    _updateWordCount();
    if (!_isTimerRunning) {
      _startTimer();
    }
  }

  void _updateWordCount() {
    setState(() {
      _wordCount = _controller.text.length;
    });
  }

  void _startTimer() {
    _isTimerRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime = Duration(seconds: _elapsedTime.inSeconds + 1);
      });
    });
  }

  void _stopTimer() {
    _isTimerRunning = false;
    _timer?.cancel();
  }

  Future<void> _checkGrammar() async {
    final text = _controller.text;
    _stopTimer();

    final url = Uri.parse('https://api.languagetool.org/v2/check');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'text': text,
        'language': 'en-US',
      },
    );

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

      // Navigate to another page with the corrected text and errors
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Error_page(
            checkedContent: _checkedContent,
            errors: _errors,
          ),
        ),
      );
    } else {
      setState(() {
        _checkedContent = 'Failed to check grammar. Please try again.';
        _errors = 'error. Please try again.';
      });
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.teal.shade500,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.menu,
                                  size: 30, color: Colors.white),
                              onPressed: () {
                              },
                            ),
                            SizedBox(
                                width: 10),
                            Text(
                              "Writing",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        Text(
                          'Floor-Plan Cathersall',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Task 01',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('assets/images/writing01.png',
                            width: 30, height: 60),
                        SizedBox(height: 10),
                        Image.asset('assets/images/writing_header.png',
                            width: 60, height: 60),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Word Count: $_wordCount',
                        style: TextStyle(color: Colors.white)),
                    Text('Time taken: ${_formatDuration(_elapsedTime)}',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Text(
              'EXERCISES',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade500,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.5),
              child: ListView(
                children: [
                  Container(
                    color: Colors.grey[200],
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'The diagrams show the results of the refurbishment of Ward 12 at Cathersall Home.\n'
                      'Summarise the information by selecting and reporting the main features, and make comparisons where relevant.',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  SizedBox(height: 5),
                  Image.asset('assets/images/writing02.jpeg'),
                  SizedBox(height: 5),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Write more than 150 words',
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: ElevatedButton(
                      onPressed: _checkGrammar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade400,
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
