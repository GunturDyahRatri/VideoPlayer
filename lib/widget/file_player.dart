import 'dart:io';

import 'package:app/main.dart';
import 'package:app/widget/video_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FlayerPlayerWidget extends StatefulWidget {
  const FlayerPlayerWidget({Key key}) : super(key: key);

  @override
  State<FlayerPlayerWidget> createState() => _FlayerPlayerWidgetState();
}

class _FlayerPlayerWidgetState extends State<FlayerPlayerWidget> {
  VideoPlayerController controller;
  final File file = File('');

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(file)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => controller.play());
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            VideoPlayerWidget(
              controller: controller,
            ),
            buildAddButton(),
          ],
        ),
      );

  Future<File> pickVideoFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result == null) return null;

    return File(result.files.single.path);
  }

  Widget buildAddButton() => Container(
        padding: EdgeInsets.all(32),
        child: FloatingActionButton(
          onPressed: () async {
            final file = await pickVideoFile();
            if (file == null) return;

            controller = VideoPlayerController.file(file)
              ..addListener(() => setState(() {}))
              ..setLooping(true)
              ..initialize().then((_) {
                controller.play();
                setState(() {});
              });
          },
        ),
      );
}
