import 'package:coaching/scenarios/aa_scn.dart';
import 'package:coaching/scenarios/ab_scn.dart';
import 'package:coaching/scenarios/ac_scn.dart';
import 'package:coaching/scenarios/ad_scn.dart';
import 'package:coaching/scenarios/ae_scn.dart';
import 'package:coaching/scenarios/af_scn.dart';
import 'package:coaching/scenarios/ag_scn.dart';
import 'package:coaching/scenarios/ah_scn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(home());
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SELECT SCENARIO'),
        ),
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledButton('Button 1', aa_scn()),
                const SizedBox(height: 8),
                StyledButton('Button 2', ab_scn()),
                const SizedBox(height: 8),
                StyledButton('Button 3', ac_scn()),
                const SizedBox(height: 8),
                StyledButton('Button 4', ad_scn()),
                const SizedBox(height: 8),
                StyledButton('Button 5', ae_scn()),
                const SizedBox(height: 8),
                StyledButton('Button 6', af_scn()),
                const SizedBox(height: 8),
                StyledButton('Button 7', ag_scn()),
                const SizedBox(height: 8),
                StyledButton('Button 8', ah_scn()),
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}

class StyledButton extends StatelessWidget {
  final String buttonText;
  final Widget navigateTo;

  StyledButton(this.buttonText, this.navigateTo);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigateTo),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // Set your button background color
        foregroundColor: Colors.black, // Set your button text color
        padding: const EdgeInsets.all(50), // Set padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Set border radius
        ),
        minimumSize: Size(double.infinity, 20),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
