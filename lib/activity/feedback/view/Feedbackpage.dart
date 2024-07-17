import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  double _currentSliderValue = 0;
  FeedbackRating _currentRating = FeedbackRating.worst;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button action here
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              'Name',
              _nameController,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              borderColor: Colors.green,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    'Email Address',
                    _emailController,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    borderColor: Colors.grey,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    'Contact Number',
                    _contactController,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    borderColor: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Share your experience in scaling',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            _buildEmojiRatingRow(),
            Slider(
              value: _currentSliderValue,
              min: 0,
              max: 4,
              divisions: 4,
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  _currentRating = FeedbackRating.values[value.toInt()];
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Add your comments...',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit button action here
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextStyle? style, Color borderColor = Colors.grey}) {
    return TextField(
      controller: controller,
      style: style,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: style,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2.0),
        ),
      ),
    );
  }

  Widget _buildEmojiRatingRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildEmojiRatingIcon(
            FeedbackRating.worst, Icons.sentiment_very_dissatisfied, 'Worst'),
        _buildEmojiRatingIcon(
            FeedbackRating.notGood, Icons.sentiment_dissatisfied, 'Not Good'),
        _buildEmojiRatingIcon(
            FeedbackRating.fine, Icons.sentiment_neutral, 'Fine'),
        _buildEmojiRatingIcon(
            FeedbackRating.good, Icons.sentiment_satisfied, 'Good'),
        _buildEmojiRatingIcon(FeedbackRating.veryGood,
            Icons.sentiment_very_satisfied, 'Very Good'),
      ],
    );
  }

  Widget _buildEmojiRatingIcon(
      FeedbackRating rating, IconData icon, String label) {
    bool isSelected = _currentRating == rating;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentRating = rating;
          _currentSliderValue = rating.index.toDouble();
        });
      },
      child: Column(
        children: [
          Icon(icon, color: isSelected ? Colors.green : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.green : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

enum FeedbackRating { worst, notGood, fine, good, veryGood }
