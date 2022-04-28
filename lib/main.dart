import 'package:app/feature/flick_video.dart';
import 'package:flutter/material.dart';

final urlLandscapeVideo = 'https://media.w3.org/2010/05/sintel/trailer.mp4';
final urlPortraitVideo = 'https://media.w3.org/2010/05/sintel/trailer.mp4';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlickVideoPlayer(),
    );
  }
}
