import 'package:ielts_frontend/export.dart';

class ExamScheduleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Your IELTS Exam is scheduled on',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              '12 Jan 2024',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimeIndicator(
                  timeValue: '14',
                  timeUnit: 'Days',
                ),
                TimeIndicator(
                  timeValue: '11',
                  timeUnit: 'Hrs',
                ),
                TimeIndicator(
                  timeValue: '14',
                  timeUnit: 'Mins',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TimeIndicator extends StatelessWidget {
  final String timeValue;
  final String timeUnit;

  TimeIndicator({required this.timeValue, required this.timeUnit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: 1.0,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              backgroundColor: Colors.grey[200],
            ),
            Text(
              timeValue,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(timeUnit),
      ],
    );
  }
}
