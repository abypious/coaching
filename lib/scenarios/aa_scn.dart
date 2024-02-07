import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../questions/RightAnswerPage.dart';
import '../questions/WrongAnswerPage.dart';

class aa_scn extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<aa_scn> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;
  int? selectedAnswerIndex; // Declare selectedAnswerIndex here

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
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
      Future.delayed(Duration(seconds: 4), () {
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
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
            ),


            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'A media person is approaching your polling booth and trying to enter inside to shoot visuals:',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.0),


                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Handle other options as needed
                    // For example, show different WrongAnswerPage with correct answers
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WrongAnswerPage(
                          correctAnswer: 'Let him shoot',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Stop that person',
                  ),
                ),
                SizedBox(height: 8.0),


                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Handle other options as needed
                    // For example, show different WrongAnswerPage with correct answers
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RightAnswerPage(
                          correctAnswer: 'Stop the person',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Stop that person',
                  ),
                ),
                SizedBox(height: 8.0),


                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Handle other options as needed
                    // For example, show different WrongAnswerPage with correct answers
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WrongAnswerPage(
                          correctAnswer: 'Stop the person',
                        ),
                        ),

                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Allow and make arrangements',
                  ),
                ),
                SizedBox(height: 8.0),


                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Handle other options as needed
                    // For example, show different WrongAnswerPage with correct answers
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WrongAnswerPage(
                          correctAnswer: 'Stop that person',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Call the police',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
