import 'package:flutter/material.dart';
import 'package:slimodoro/Screens/PomodoroTimer.dart';

class Challenge extends StatefulWidget {
  final int completedWorkTimers;

  Challenge({required this.completedWorkTimers});

  @override
  _ChallengeState createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 31, 107),
      appBar: AppBar(
        title: Text(
          'Challenge Progress',
          style: TextStyle(
            fontFamily: 'Barlow_bold',
            fontSize: 32,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Challenge 1: Complete 4 Work intervals or 1 Pomodoro',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: widget.completedWorkTimers / 4,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  '${widget.completedWorkTimers} / 4',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Text(
              'Challenge 2: Complete 8 Work intervals or 2 Pomodoros',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: widget.completedWorkTimers / 8,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  '${widget.completedWorkTimers} / 8',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
    const SizedBox(height: 325),


  
          ],
        ),
      ),
    );
  }
}
