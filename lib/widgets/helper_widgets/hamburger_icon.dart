import 'package:ielts_frontend/export.dart';

class HamburgerIcon extends StatelessWidget {
  const HamburgerIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return VStack([
        for (int i = 0; i < 3; i++)
          Container(
            height: 4.64,
            width: 22.63,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28), color: Colors.white),
          ).marginOnly(bottom: 2.23)
      ]).marginAll(13);
    }).color(Colors.transparent).onTap(() {
      print("Drawer tapped");
      Scaffold.of(context).openDrawer();
    });
  }
}
