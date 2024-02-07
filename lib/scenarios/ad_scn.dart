import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoAppad extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoAppad> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset('assets/normal.mp4'); // Change this line
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoPlay: true,
      looping: false,
      showControls: false, // Hide video controls
      // Other customization options can be added here
    );

    _videoController.initialize().then((_) {
      setState(() {});
      _videoController.play();
      Future.delayed(Duration(seconds: 2), () {
        _videoController.pause();
        _showQuestionPopup(context);
      });
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: _videoController.value.isInitialized
            ? Chewie(
          controller: _chewieController,
        )
            : CircularProgressIndicator(),
      ),
    );
  }

  void _showQuestionPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('What is the correct answer?'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Option A'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Option B'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
