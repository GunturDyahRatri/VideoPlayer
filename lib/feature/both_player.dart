import 'package:app/feature/video_fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerBothWidget extends StatefulWidget {
  const VideoPlayerBothWidget({Key key, VideoPlayerController controller})
      : super(key: key);

  @override
  State<VideoPlayerBothWidget> createState() => _VideoPlayerBothWidgetState();
}

class _VideoPlayerBothWidgetState extends State<VideoPlayerBothWidget> {
  VideoPlayerController controller;
  @override
  Widget build(BuildContext context) =>
      VideoPlayerFullscreenWidget(controller: controller);
}
