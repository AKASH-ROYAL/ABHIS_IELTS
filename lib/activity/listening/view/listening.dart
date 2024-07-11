import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:ielts_frontend/export.dart';
import 'package:ielts_frontend/widgets/helper_widgets/audio_slider/view/audio_slider.dart';

class Listening extends StatelessWidget {
  const Listening({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: NectText(
            text: "A solar computing",
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Column(
          children: [
            NectText(
              text: "Play Audio : "
                  "",
              fontWeight: FontWeight.w500,
              size: 16,
            ),
            AudioSlider()
          ],
        ),
      ),
    ));
  }
}
