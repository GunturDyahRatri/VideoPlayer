import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerBothWidget extends StatefulWidget {
  final VideoPlayerController controller;
  const VideoPlayerBothWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  State<VideoPlayerBothWidget> createState() => _VideoPlayerBothWidgetState();
}

class _VideoPlayerBothWidgetState extends State<VideoPlayerBothWidget> {
  @override
  Widget build(BuildContext context) =>
      widget.controller != null && widget.controller.value.initialized
          ? Container(
              alignment: Alignment.topCenter,
              child: buildVideo(),
            )
          : Center(
              child: CircularProgressIndicator(),
            );

  Widget buildVideo() => OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;
          return Stack(
            fit: isPortrait ? StackFit.loose : StackFit.expand,
            children: <Widget>[
              buildVideoPlayer(),
            ],
          );
        },
      );

  Widget buildVideoPlayer() {
    final video = AspectRatio(
      aspectRatio: widget.controller.value.aspectRatio,
      child: VideoPlayer(widget.controller),
    );

    return buildFullScreen(child: video);
  }

  Widget buildFullScreen({
    @required Widget child,
  }) {
    final size = widget.controller.value.size;
    final width = size?.width ?? 0;
    final height = size?.height ?? 0;

    return FittedBox(
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
