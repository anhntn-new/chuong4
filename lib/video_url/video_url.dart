import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoURL extends StatefulWidget {
  const VideoURL({Key? key}) : super(key: key);

  @override
  State<VideoURL> createState() => _VideoURLState();
}

class _VideoURLState extends State<VideoURL> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
              VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
