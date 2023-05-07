import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late Timer _timer; //late: 초기화 나중에
  late String formattedTime = '';
  late String formattedDate = '';

  //class 안에 있는 function(함수) == method
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration (seconds: 1), (timer) {
      setState(() {
        DateTime now = DateTime.now();
        formattedTime = DateFormat('h:mm:ss a').format(now);
        formattedDate = DateFormat('yyyy.MM.dd EEE').format(now);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(formattedTime,
            style: TextStyle(color: Colors.black, fontSize: 65, height: 1)),
        Text(formattedDate,
            style: TextStyle(color: Colors.grey, fontSize: 30, height: 1)),
      ],
    );
  }
}
