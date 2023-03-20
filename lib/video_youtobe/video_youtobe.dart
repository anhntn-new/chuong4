import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoYouTobe extends StatefulWidget {
  const VideoYouTobe({Key? key}) : super(key: key);

  @override
  State<VideoYouTobe> createState() => _VideoYouTobeState();
}

class _VideoYouTobeState extends State<VideoYouTobe> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    _controller.addListener(() {
      setState(() {});
    });
    // _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              YoutubePlayer(
                actionsPadding: const EdgeInsets.all(4),
                controller: _controller,
                showVideoProgressIndicator: true,
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(isExpanded: true),
                ],
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
