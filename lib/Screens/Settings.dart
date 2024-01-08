import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _longBreakTimevalue = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 31, 107),
      appBar: AppBar(
        title: Text('Long Break',
        style: TextStyle(
            fontFamily: 'Barlow_bold',
            color: Colors.white,
            fontSize: 30.0,),
        textAlign: TextAlign.left,
        ),
        backgroundColor: Color.fromARGB(255, 25, 31, 107),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Long Break Time Duration: ${_longBreakTimevalue} minutes',
              style: TextStyle(
              fontFamily: 'Barlow_bold',
              color: Colors.white,
              fontSize: 40.0,
              ),
            ),
            Slider(
              value: _longBreakTimevalue.toDouble(),
              min: 15,
              max: 30,
              divisions: 3,
              onChanged: (value) {
                setState(() {
                  _longBreakTimevalue = value.toInt();
                });
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 30, 57, 125), // background
                  foregroundColor: Colors.white, // foreground
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
              ),
              onPressed: () {
                Navigator.pop(context,_longBreakTimevalue);
              },
              child: Text('Save',
                style: TextStyle(
                fontFamily: 'Barlow_bold',
                color: Colors.white,
                fontSize: 15.0,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


