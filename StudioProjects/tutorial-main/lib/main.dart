import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(BallPage());
}

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
              child: Text('Ask Me Everything',
                  style: TextStyle(
                      fontFamily: 'PermanentMarker',
                      fontSize: 40,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.wavy))),
          // leading: IconButton(
          //   onPressed: (){},
          //   icon:Icon(Icons.menu)
          // ),
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/app_icon.jpg'),
            radius: 25,
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(child: Ball()),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}



class _BallState extends State<Ball> {
  int ballNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    randomize();
                  });
                  print(ballNumber);
                },
                child: Image.asset('images/ball$ballNumber.png')),
          )),
        ],
      ),
    );
  }

  void randomize() {
    ballNumber = Random().nextInt(5)+1;
  }
}
