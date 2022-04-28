import 'package:app/feature/video_fullscreen.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class ProtraitPlayerWidget extends StatefulWidget {
  const ProtraitPlayerWidget({Key key}) : super(key: key);

  @override
  State<ProtraitPlayerWidget> createState() => _ProtraitPlayerWidgetState();
}

class _ProtraitPlayerWidgetState extends State<ProtraitPlayerWidget> {
  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(urlPortraitVideo);
    controller.addListener(() => setState(() {}));
    controller.setLooping(true);
    controller.initialize().then((_) => controller.play());

    // setLandscape();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // Future setLandscape() async {
  //   await SystemChrome.setPreferredOrientations(
  //       [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  // }

  @override
  Widget build(BuildContext context) =>
      VideoPlayerFullscreenWidget(controller: controller);
}
