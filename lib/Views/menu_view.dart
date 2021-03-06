import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../Models/nguoi_choi.dart';

class MenuView extends StatefulWidget {
  NguoiChoi? player;
  MenuView({Key? key, this.player}) : super(key: key);

  @override
  _MenuViewState createState() => _MenuViewState(player);
}

class _MenuViewState extends State<MenuView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  NguoiChoi? player;
  AudioCache _audio = new AudioCache();
  AudioPlayer audioplayers = new AudioPlayer();
  _MenuViewState(this.player);
  @override
  void initState() {
    play();
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  void play() async {
    audioplayers = await _audio.loop("audios/Nhac-nen.mp3");
  }

  @override
  void dispose() {
    audioplayers.dispose();
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset(
                    "assets/images/ALTP_LOGO.png",
                  ),
                ),
                flex: 2),
            Flexible(
              child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      audioplayers.stop();
                      Navigator.pushNamed(context, "/Game", arguments: player);
                    },
                    child: Text("Ch??i game", style: TextStyle(fontSize: 17)),
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
                        Text("Th???ng k?? ??i???m", style: TextStyle(fontSize: 17)),
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
                    child: Text("H?????ng d???n", style: TextStyle(fontSize: 17)),
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
                    child: Text("Ng?????i ch??i", style: TextStyle(fontSize: 17)),
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
