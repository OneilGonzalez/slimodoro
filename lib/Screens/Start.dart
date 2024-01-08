import 'package:flutter/material.dart';
import 'package:slimodoro/Screens/MainMenu.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 31, 107),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: const Image(
                image: AssetImage('assets/slimologo.png'),
                height: 300,
                width: 300,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: 100,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 30, 57, 125), // background
                  foregroundColor: Colors.white, // foreground
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainMenu()));
                },
                child: const Text('BEGIN',
                style: TextStyle(fontFamily: 'Lovelo',color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}