import 'package:flutter/material.dart';

import 'MainMenu.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  String? _selectedItem;
  String _description = '';

  void onChangedHandler(String? value) {
    setState(() {
      _selectedItem = value;
    });

    switch (_selectedItem) {
      case 'TIMER':
        _description = 'The timer is a clock where it will monitor the time users have dedicated doing a particular task. This will be in a form of pomodoro technique where it will have a 25 minute work and 5 minute rest in between of those works.';
        break;
      case 'MY TASK':
        _description = 'My Tasks is a page where a user can add tasks by clicking add new tasks button. The tasks will be displayed on the top of the screen where users can create an unlimited ammount of tasks and once finished they can easily remove that task as they have already accomplished it already. ';
        break;
      case 'SETTINGS':
        _description = 'Settings is a page where the user will try to modify the number of long break that they will acquire which is every after 4 times of work of a user.';
        break;
      case 'ABOUT US':
        _description = 'About Us is a page where it will display the logo of the application. Below it shows the name of the programmers who created the program which also includes the vision and missions of the programmers for the application. ';
        break;
      default:
        _description = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 31, 107),   

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HELP',
              style: TextStyle(fontFamily: 'Barlow_bold', color: Colors.white, fontSize: 32.0),
              textAlign: TextAlign.center,
            ),
          DropdownButton<String>(
  value: _selectedItem,
  hint: Text(
    'SELECT AN OPTION',
    style: TextStyle(
      fontFamily: 'Barlow_bold',
      color: Color.fromARGB(255, 30, 57, 125),
    ),
    textAlign: TextAlign.center,
  ),
  items: <String>['TIMER', 'MY TASK', 'SETTINGS', 'ABOUT US']
      .map((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style: TextStyle(
          fontFamily: 'Barlow_bold',
          color: Color.fromARGB(255, 30, 57, 125),
        ),
      ),
    );
  }).toList(),
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,  
  ),
  
  onChanged: (String? newValue) {
    onChangedHandler(newValue);
  },
),


            SizedBox(height: 40),


          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _description,
                style: TextStyle(fontFamily: 'Lovelo',color: Colors.white, fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
              
            ),  

            SizedBox(height: 40),
                          // BACK TO MAIN MENU
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
