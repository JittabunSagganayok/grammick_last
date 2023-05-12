import 'package:flutter/material.dart';
import 'package:we_link/marketplace/data/data.dart';
import 'package:we_link/marketplace/fonts/utils.dart';
import 'package:video_player/video_player.dart';

class Hotdeals extends StatelessWidget {
  const Hotdeals({
    super.key,
    required this.ffem,
    required this.fem,
  });

  final double ffem;
  final double fem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Hots Deal',
                  style: SafeGoogleFont(
                    'Kanit',
                    fontSize: 14 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 2 * ffem / fem,
                    letterSpacing: -0.3000000119 * fem,
                    color: const Color(0xff000000),
                  ),
                ),
              ],
            ),
            //Container(height: 1000, child: vdothumbnail()),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 162, child: VideoApp()),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dream for you',
                  style: SafeGoogleFont(
                    'Kanit',
                    fontSize: 13 * ffem,
                    fontWeight: FontWeight.w500,
                    height: 2.1538461538 * ffem / fem,
                    letterSpacing: -0.3000000119 * fem,
                    color: const Color(0xff545454),
                  ),
                ),
                Image.asset(
                  'assets/marketplace/images/group-34013.png',
                  width: 20 * fem,
                  height: 20 * fem,
                ),
              ],
            ),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem',
              style: SafeGoogleFont(
                'Kanit',
                fontSize: 11 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.495 * ffem / fem,
                letterSpacing: -0.3000000119 * fem,
                color: const Color(0xff9fa7c5),
              ),
            ),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  final vdopath = vdo;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(vdo[0]['vdo_path'])
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                            height: 162 * fem,
                            width: 333 * fem,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: VideoPlayer(_controller))),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Column(
            children: [
              const SizedBox(
                height: 55,
              ),
              SizedBox(
                  width: double.infinity,
                  child: _controller.value.isPlaying
                      ? SizedBox(
                          // width: _controller.value.isPlaying ? 0 : 44,
                          // height: _controller.value.isPlaying ? 0 : 44,
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/marketplace/images/pnginvi.png',
                            width: 100,
                            height: 100,
                          ),
                        )
                      : SizedBox(
                          width: 44,
                          height: 44,
                          child: Image.asset(
                            'assets/marketplace/images/group-34006.png',
                            width: 44,
                            height: 44,
                          ),
                        )),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
