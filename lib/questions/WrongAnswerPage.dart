import 'package:flutter/material.dart';

class WrongAnswerPage extends StatelessWidget {
  final String correctAnswer;

  WrongAnswerPage({required this.correctAnswer});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable the back button and always go back to the home page
        Navigator.of(context).popUntil((route) => route.isFirst);
        return false;
      },
      child: Scaffold(
        body: Container(
          color: Colors.redAccent, // Set background color to redAccent
          padding: EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Oops! The answer was wrong',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.0),
                Text(
                  'The right answer is : $correctAnswer',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.0),
                Text(
                  '👎', // Thumbs down emoji
                  style: TextStyle(
                    fontSize: 50.0,
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  'Ensuring Electoral Integrity',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Set text color
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.0),
                Text(
                  'Election officers must strictly adhere to Indian electoral laws by denying unauthorized entry '
                      'to media persons in polling booths. Upholding this protocol is crucial for maintaining a '
                      'fair and impartial voting environment, preserving the integrity of the electoral process, '
                      'and ensuring that voters can exercise their rights without interference or compromise.',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white, // Set text color
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey, // Set button background color
                    onPrimary: Colors.redAccent, // Set button text color to redAccent
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'Go Back Home',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
