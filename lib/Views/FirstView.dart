import 'dart:async';

import 'package:flutter/material.dart';

class FirstView extends StatefulWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  Timer? _timer;
  void initState() {
    int count = 5;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        count--;
      } else {
        _timer?.cancel();
        Navigator.pushNamed(context, "/User");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo.shade900,
        body: Center(
          child: Flexible(
            child: Image.asset("assets/images/ALTP_LOGO.png",width: 200,height:200),
          ),
        ));
  }
}
