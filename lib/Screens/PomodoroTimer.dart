import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'MyTasks.dart';
import 'Settings.dart';
import 'MainMenu.dart';
import 'ChallengeMe.dart';

class PomodoroTimer extends StatefulWidget {

  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer>
    with TickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final int _workTime = 25;
  int _breakTime = 5;
  int _longBreakTime = 15; // set the longer break time
  int _completedWorkTimers = 0; // counter for completed work timers

  late AnimationController _controller;
  late Timer _timer = Timer(Duration.zero, () {});
  int _time = 0;
  
  bool _isRunning = false;
  bool _isWorking = true;

  int get _minutes => _time ~/ 60;
  int get _seconds => _time % 60;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _isWorking ? _workTime * 60 : _breakTime * 60),
    );
        _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
  }       

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }
  
  void _startTimer() {
    setState(() {
      _isRunning = true;
      _time = _isWorking ? _workTime * 60: _breakTime * 60;
      _controller.duration = Duration(seconds: _time + 1);
      _timer = Timer.periodic(Duration(seconds: 1), _tick);
      _controller.forward(from: 0.0);
    });
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
      _timer.cancel();
    });
    _controller.stop();
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _isWorking = true;
      _time = 0;
    });

    _timer.cancel();
    _controller.reset();
  }

  void _timerEnded() async {
    _audioPlayer.stop();
    await _audioPlayer.setAsset('assets/timeralarm.mp3');
    await _audioPlayer.play();
  }

    void _tick(Timer timer) {
      setState(() {
        if (_time > 0) {
          _time--;
        } else {
          _isWorking = !_isWorking;
          if (_isWorking) {
            // Play a sound when the work period starts
            _timerEnded();
            _time = _workTime * 60;
          } else {
            // Play a sound when the break period starts
            _timerEnded();
            _completedWorkTimers++;
              if (_completedWorkTimers % 4 == 0) {
                // Switch to long break
                _breakTime = _longBreakTime;
              } else {
                // Switch to short break
                _breakTime = 5;
              }
            _time = _breakTime * 60;
          }
          _controller.duration = Duration(seconds: _time + 1);
          _controller.forward(from:0.0);
        }
        
        if (_isRunning) {
          
        } else {
          _controller.stop();
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 25, 31, 107),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 40),
            Text(
              'SLIMODORO TIMER',
              style: TextStyle(fontFamily: 'Barlow_bold',color: Colors.white, fontSize: 32.0),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            Text(
                      _isWorking ? 'Work' : 'Break',
                      style: const TextStyle(fontFamily: 'Lovelo', color: Color.fromARGB(255, 255, 255, 255),fontSize: 32.0),
                    ),
            
            const SizedBox(height: 20),

            AnimatedBuilder(
              animation: _controller, 
              builder: (BuildContext context, Widget? child){
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 250.0,
                      width: 250.0,
                      child: CircularProgressIndicator(
                        value: 1.0 - _controller.value,
                        strokeWidth: 10.0,
                        backgroundColor: Color.fromARGB(215, 238, 238, 238),
                        valueColor: AlwaysStoppedAnimation<Color>(_isWorking ? Colors.red : Colors.green,),
                      )
                    ),
                    Text(
                      '$_minutes:${_seconds.toString().padLeft(2, '0')}',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 32.0),
                    ),
                  ],
                );
              }
              ),

              const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(                 
                  onPressed: _isRunning ? _stopTimer : _startTimer,
                  style : ElevatedButton.styleFrom(
                     backgroundColor: Color.fromARGB(255, 30, 57, 125)
                  ),
                  child: Text(_isRunning ? 'Stop' : 'Start',
                  style: (const TextStyle(fontFamily: 'Lovelo', fontSize: 12.0)),
                  ),
                ),
                ElevatedButton(
                  onPressed: _resetTimer,
                  style : ElevatedButton.styleFrom(
                     backgroundColor: Color.fromARGB(255, 30, 57, 125)
                  ),
                  child: const Text('Reset',
                  style: const TextStyle(fontFamily: 'Lovelo', fontSize: 12.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            

    Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          height: 80,
          width: 200,
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
            child: const Text(
              'MY TASKS',
              style: TextStyle(
                fontFamily: 'Lovelo',
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    ),
    const SizedBox(height: 20),
    Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          height: 80,
          width: 200,
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
                MaterialPageRoute(
                  builder: (context) =>
                      Challenge(completedWorkTimers: _completedWorkTimers),
                ),
              );
            },
            child: const Text(
              'Challenge me',
              style: TextStyle(
                fontFamily: 'Lovelo',
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    ),
const SizedBox(height: 5),
 
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              FloatingActionButton(
                  heroTag: 'fab1',
                  backgroundColor: Color.fromARGB(255, 30, 57, 125),
                  onPressed: () async{
                  final result = await
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                  setState(() {
                    _longBreakTime = result;
                  });
                  },
                  child: Icon(Icons.settings),
                ), 
                FloatingActionButton(
                  heroTag: 'fab2',
                  backgroundColor: Color.fromARGB(255, 30, 57, 125),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenu()),
                    );
                  },
                  child: Icon(Icons.home),
                ), 
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
} 
