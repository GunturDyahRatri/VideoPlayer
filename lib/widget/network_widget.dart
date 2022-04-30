import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NetworkPlayerWidget extends StatefulWidget {
  const NetworkPlayerWidget({Key key}) : super(key: key);

  @override
  State<NetworkPlayerWidget> createState() => _NetworkPlayerWidgetState();
}

class _NetworkPlayerWidgetState extends State<NetworkPlayerWidget> {
  final textController = TextEditingController(text: urlLandscapeVideo);
  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(textController.text)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textController,
              ),
            ),
            const SizedBox(width: 12),
            FloatingActionButton(onPressed: () {
              if (textController.text.trim().isEmpty) return;

              controller = VideoPlayerController.network(textController.text)
                ..addListener(() => setState(() {}))
                ..setLooping(true)
                ..initialize().then((_) => controller.play());
            })
          ],
        ),
      );
}
