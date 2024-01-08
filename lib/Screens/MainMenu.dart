import 'package:flutter/material.dart';
import 'package:slimodoro/Screens/Help.dart';
import 'package:slimodoro/Screens/PomodoroTimer.dart';
import 'package:slimodoro/Screens/AboutUs.dart';
import 'package:slimodoro/Screens/MyTasks.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/home.png', // Replace with your own image path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            //SLIMODORO
            Text(
              'SLIMODORO',
              style: TextStyle(fontFamily: 'Barlow_bold', color: Colors.white, fontSize: 64.0),
              textAlign: TextAlign.center,
            ),
            //ABOUTUS 
            Text(
              'MAIN MENU',
              style: TextStyle(fontFamily: 'Barlow_bold', color: Colors.white, fontSize: 32.0),
              textAlign: TextAlign.center,
            ),
            //1st button
            Container(
              width: 240,
              height: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 30, 57, 125), // background
                  foregroundColor: Colors.white, // foreground
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PomodoroTimer()),
                  );
                },
                  child: const Text('TIMER',
                  style: TextStyle(fontFamily: 'Lovelo',color: Colors.white, fontSize: 25.0),
                  ),
              ),
            ),

            const SizedBox(height: 20),//NADAGDAG space between button 1 and 2

            //2nd button
            Container(
              width: 240,
              height: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: Color.fromARGB(255, 30, 57, 125), // background
                  foregroundColor: Colors.white, // foreground
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyTasks()),
                  );
                },
                  child: const Text('MY TASKS',
                  style: TextStyle(fontFamily: 'Lovelo',color: Colors.white, fontSize: 25.0),
                  ),
              ),
            ),

            const SizedBox(height: 20),//NADAGDAG space between button 2 and 3


            //3rd button
            Container(
              width: 240,
              height: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 30, 57, 125), // background
                  foregroundColor: Colors.white, // foreground
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUs()),
                  );
                },
                  child: const Text('ABOUT US',
                  style: TextStyle(fontFamily: 'Lovelo',color: Colors.white, fontSize: 25.0),
                  ),
              ),
            ),

            const SizedBox(height: 20),//NADAGDAG space between button 1 and 2

            //4th button
            Container(
              width: 240,
              height: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 30, 57, 125), // background
                  foregroundColor: Colors.white, // foreground
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Help()),
                  );
                },
                  child: const Text('HELP',
                  style: TextStyle(fontFamily: 'Lovelo',color: Colors.white, fontSize: 25.0),
                  ),
              ),
            ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}