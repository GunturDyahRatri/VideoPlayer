import 'package:app/feature/video_fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FlickVideoPlayer extends StatefulWidget {
  const FlickVideoPlayer({Key key}) : super(key: key);

  @override
  State<FlickVideoPlayer> createState() => _FlickVideoPlayerState();
}

class _FlickVideoPlayerState extends State<FlickVideoPlayer> {
  VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.network(
        'https://media.w3.org/2010/05/sintel/trailer.mp4');
    videoPlayerController.addListener(() => setState(() {}));
    videoPlayerController.setLooping(true);
    videoPlayerController
        .initialize()
        .then((_) => videoPlayerController.play());
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      VideoPlayerFullscreenWidget(controller: videoPlayerController);
}
