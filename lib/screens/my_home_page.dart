import 'package:flutter/material.dart';
import 'package:eos_clock/widget/clock_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('EOS 시계 앱'),
        centerTitle: false, //ios는 가운데 설정이 기본. false로 만들어줘야 왼쪽으로 제목이 뜸.
        leading: Icon(Icons.access_time_filled),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex: 2,),
            Image.asset('assets/images/eos_logo.png', height: 280,),
            Spacer(),
            ClockWidget(),
            Spacer(flex: 7,),
          ],
        ),
      ),
      /*body: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red,),
        width: 150, height: 200,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Text('hihihihihihihi',),
        /*child: TextFormField(decoration:InputDecoration(
        prefixIcon: Icon(Icons.~),
        )),*/
      ),
      bottomNavigationBar: BottomAppBar(child: Text('hi')),*/
    );
  }
}