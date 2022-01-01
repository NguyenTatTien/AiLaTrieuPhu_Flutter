import 'package:flutter/material.dart';

import '../NguoiChoi.dart';

class OverView extends StatelessWidget {
  int? score;
  OverView({this.score});
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.indigo.shade900,
      body:Center(
        child: Text("Xin chúc mừng\n$score đ",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.white)),
      )
    );
  }
}
