import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slimodoro/Screens/MainMenu.dart';
import 'package:slimodoro/models/TaskProvider.dart';

class MyTasks extends StatefulWidget {
  @override
  _MyTasksState createState() => _MyTasksState();
}

class _MyTasksState extends State<MyTasks> {
  late TextEditingController _newChallengeController;

  @override
  void initState() {
    super.initState();
    _newChallengeController = TextEditingController();
  }

  @override
  void dispose() {
    _newChallengeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 31, 107),
      appBar: AppBar(
        title: Text(
          'MY TASKS',
          style: TextStyle(
            fontFamily: 'Barlow_bold',
            color: Colors.white,
            fontSize: 36.0,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color.fromARGB(255, 25, 31, 107),
      ),
      body: Consumer<TaskData>(
        builder: (context, taskList, child) => Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              SizedBox(height: 50), // increased height of SizedBox
              Expanded(
                child: ListView.builder(
                  itemCount: taskList.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskList.tasks[index];
                    return ListTile(
                      title: Text(
                        task.name,
                        style: TextStyle(
                          fontFamily: 'Lovelo',
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          taskList.removeTask(task);
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30), // increased height of SizedBox
              Container(
                alignment: Alignment.center,
                width: 200,
                height: 150, // increased height of container
                child: Column(
                  children: [
                    TextFormField(
                      controller: _newChallengeController,
                      decoration: InputDecoration(
                        hintText: 'Enter a new challenge',
                        hintStyle: TextStyle(
                          fontFamily: 'Lovelo',
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: 'Lovelo',
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 30, 57, 125),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        if (_newChallengeController.text.isNotEmpty) {
                          taskList.addTask(_newChallengeController.text);
                          _newChallengeController.clear();
                        }
                      },
                      child: Padding( // added padding to make button taller
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          'ADD NEW TASK',
                          style: TextStyle(
                            fontFamily: 'Barlow_bold', color: Colors.white,fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 30, 57, 125),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainMenu()),
          );
        },
        child: Icon(Icons.home),
      ),
    );
  }
}
                           
