import 'package:flutter/material.dart';

import '../NguoiChoi.dart';

class MenuView extends StatelessWidget {
  NguoiChoi? player;
  MenuView(this.player);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/Score", arguments: player);
                    },
                    child: Text("${player!.TenNC}",
                        style: TextStyle(fontSize: 17)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.white)),
                    )),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 70,
              ),
              flex: 1,
            ),
            Flexible(
                child: Container(
              child: Image.asset("assets/images/ALTP_LOGO.png",),
            
            ),flex:2),
            Flexible(
              child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/Game", arguments: player);
                    },
                    child: Text("Chơi game", style: TextStyle(fontSize: 17)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.white)),
                    )),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 70,
              ),
              flex: 1,
            ),
            Flexible(
              child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/Score", arguments: player);
                    },
                    child:
                        Text("Thống kê điểm", style: TextStyle(fontSize: 17)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.white)),
                    )),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 70,
              ),
              flex: 1,
            ),
             Flexible(
              child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/Instructions");
                    },
                    child:
                        Text("Hưởng dẫn", style: TextStyle(fontSize: 17)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.white)),
                    )),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 70,
              ),
              flex: 1,
            ),
            Flexible(
              child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Người chơi", style: TextStyle(fontSize: 17)),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.white)),
                    )),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 70,
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
