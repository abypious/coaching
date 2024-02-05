import 'package:flutter/material.dart';

void _showQuestionPopupab() {
  var context;
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
              // Your question and multiple-choice answers widgets here
              Text('What is the correct answer?'),
              ElevatedButton(
                onPressed: () {
                  // Handle the selected answer and close the pop-up
                  Navigator.of(context).pop();
                },
                child: Text('Option A'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle the selected answer and close the pop-up
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
