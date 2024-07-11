import 'package:flutter/material.dart';

class CourseSelectionScreen extends StatefulWidget {
  @override
  _CourseSelectionScreenState createState() => _CourseSelectionScreenState();
}

class _CourseSelectionScreenState extends State<CourseSelectionScreen> {
  late String _selectedCourse = '';

  final List<String> _courses = [
    'Course 1',
    'Course 2',
    'Course 3',
    'Course 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedCourse.isEmpty ? null : _selectedCourse,
              items: _courses.map((String course) {
                return DropdownMenuItem<String>(
                  value: course,
                  child: Text(course),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select a course',
                border: OutlineInputBorder(),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCourse = newValue ?? '';
                });
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Selected Course',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: _selectedCourse),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CourseSelectionScreen(),
  ));
}
