import '../../../export.dart';

class WordDefinitionCard extends StatelessWidget {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: Text(
                'Definitions and Examples',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'For Every Word',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 500,
                    height: 1,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(Icons.volume_up, color: Colors.green),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Catch some rays',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'In informal English, if you catch some rays, catch a few rays, soak up a few rays, etc., you sit or lie in the sun.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            Text(
              '• I’m going to the bench to catch some rays.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: Container(
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [primary_color, Colors.white],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'READ MORE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
