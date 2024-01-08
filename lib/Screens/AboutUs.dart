import 'package:flutter/material.dart';
import 'package:slimodoro/Screens/MainMenu.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 31, 107),
      
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            

            //ABOUTUS 
            Text(
              'ABOUT US',
              style: TextStyle(fontFamily: 'Barlow_bold', color: Colors.white, fontSize: 32.0),
              textAlign: TextAlign.center,
            ),
            Container(
              child: const Image(
                image: AssetImage('assets/tool.png'),
                height:275,
                width: 275,
                fit: BoxFit.fitWidth,
              ),
            ),
           Padding(
            padding: EdgeInsets.only(left:20.0 , right: 20.0),
            child: Text(
              'Welcome to our Slimodoro App! We are a team of developers who passionately promotes Pomodoro technique for the power of productivity for the tasks to efficiently be completed on time. \n\nWe are committed to provide users the ultimate user experience in terms of increasing productivty and tracking the user progress into manageable tasks. The programmers who created this program are Reanne Buccat, Jacques Oneil Gonzalez, Xyron Nucum, Paul James Perez, and Miguel Antonio Villaruel.',
              style: TextStyle(fontFamily: 'Lovelo', color: Colors.white, fontSize: 16.0),
              textAlign: TextAlign.justify,
              ),
              ),

            const SizedBox(height: 20),//NADAGDAG space between text and main menu button

            //BACK TO MAIN MENU
            Container(
              width: 200,
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
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
                child: const Text('MAIN MENU',
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