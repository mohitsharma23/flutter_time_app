import 'package:flutter/material.dart';
import 'package:flutter_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime inst = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await inst.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': inst.location,
      'time': inst.time,
      'flag': inst.flag,
      'isDayTime': inst.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
