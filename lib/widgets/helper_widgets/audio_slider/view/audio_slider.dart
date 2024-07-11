import 'package:ielts_frontend/export.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ielts_frontend/utils/utils.dart';

class AudioSlider extends StatelessWidget {
  AudioSlider({super.key});

  bool isPlaying = false;
  AudioPlayer player = AudioPlayer();
  AssetSource path = AssetSource("assets/audio/test_audio.mp3");
  Duration _duration = Duration();
  Duration _position = Duration();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // width: width / 1.2,
        // height: height / 14,
        decoration: BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: playPause,
              child: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.black,
                size: 30,
              ),
            ),
            Text(_position.format().toString() +
                "/" +
                _duration.format().toString()),
            Container(
              width: 160,
              child: Slider(
                value: _position.inSeconds.toDouble(),
                onChanged: (value) async {
                  print(value);
                  await player.seek(Duration(seconds: value.toInt()));
                  // setState(() {});
                },
                min: 0,
                max: _duration.inSeconds.toDouble(),
                inactiveColor: Colors.grey,
                activeColor: Colors.black,
                label: "2:00",
              ),
            ),
            Icon(
              Icons.volume_up_rounded,
            ),
          ],
        ),
      ),
    );
  }

  void playPause() async {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      player.play(UrlSource(
          "https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Kangaroo_MusiQue_-_The_Neverwritten_Role_Playing_Game.mp3"));
      isPlaying = true;
    }
  }
}
