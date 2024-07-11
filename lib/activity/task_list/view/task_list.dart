import 'package:ielts_frontend/export.dart';

class TaskList extends StatelessWidget {
  TaskList({super.key});

  var readingList = [
    "The Art of Typography",
    "Understanding Modern Fonts",
    "The Evolution of Typeface",
    "Cultural Influences on Font Design",
    "Psychology of Fonts: How They Affect Reading",
    "The Role of Fonts in Branding",
    "Historic Milestones in Typeface Development",
    "Digital vs. Print Fonts: A Comparative Study",
    "How Fonts Impact User Experience",
    "Innovations in Font Technology",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: NectText(
          text: "Reading tasks",
          fontWeight: FontWeight.w600,
          size: 17,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: primary_color,
      ),
      body: ListView.builder(
          itemCount: readingList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: primary_color, // Border color
                  width: 1.0, // Border width
                ),
                borderRadius: BorderRadius.circular(5.0), // Corner radius
              ),
              // leading: NectText(text: "1."),
              leading: Container(
                height: 75,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff0D5D50),
                      Color(0xff167F71),
                    ]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomRight: Radius.circular(35))),
                child: NectText(
                  text: "${index + 1}.",
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  size: 18,
                ),
              ),
              title: NectText(text: readingList[index]),
              contentPadding: EdgeInsets.zero,
              trailing: Container(
                height: 75,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff167F71),
                      Color(0xff0D5D50),
                    ]),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomLeft: Radius.circular(35))),
                child: Icon(
                  Icons.arrow_right_alt_outlined,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ).marginOnly(bottom: 10);
          }).paddingAll(10),
    );
  }
}
