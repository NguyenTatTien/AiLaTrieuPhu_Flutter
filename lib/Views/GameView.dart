import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../CauHoiDAO.dart';
import '../KetQua.dart';
import '../KetQuaDAO.dart';
import '../NguoiChoi.dart';
import '../NguoiChoiDAO.dart';

class GameView extends StatefulWidget {
  NguoiChoi? player;
  GameView({Key? key, this.player}) : super(key: key);

  @override
  _GameViewState createState() => _GameViewState(player);
}

class _GameViewState extends State<GameView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  NguoiChoi? player;
  List<Map<String, dynamic>> ListCH = [];

  List<Color> colors = List.filled(4, Colors.black);
  List<Color> cls = List.filled(3, Colors.black);
  Map<String, dynamic> cauHoi = new Map<String, dynamic>();
  var answer = List.filled(4, "");
  Timer? timer;
  Timer? timer2;
  int number = 1;
  int score = 0;
  var scores = [
    200,
    400,
    600,
    1000,
    2000,
    3000,
    6000,
    10000,
    14000,
    22000,
    30000,
    40000,
    60000,
    85000,
    150000
  ];
  Random rd = new Random();
  _GameViewState(this.player);
  @override
  void initState() {
    Load();
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  void Load() async {
    ListCH = List<Map<String, dynamic>>.from(await CauHoiDAO.ListCH("Dễ"));
    Next();
  }

  void Next() async {
    if (number == 6) {
      ListCH =
          List<Map<String, dynamic>>.from(await CauHoiDAO.ListCH("Trung bình"));
    } else if (number == 11) {
      ListCH = List<Map<String, dynamic>>.from(await CauHoiDAO.ListCH("Khó"));
    }
    answer = List.filled(4, "");
    Random rdcauHoi = new Random();
    int location = rdcauHoi.nextInt(ListCH.length);
    cauHoi = ListCH[location];
    var temp = [
      cauHoi["CauTl1"],
      cauHoi["CauTl2"],
      cauHoi["CauTl3"],
      cauHoi["CauTl4"]
    ];
    answer[0] = "A: ";
    answer[1] = "B: ";
    answer[2] = "C: ";
    answer[3] = "D: ";
    for (int i = 0; i < 4; i++) {
      int random = rd.nextInt(temp.length);
      answer[i] += temp[random];
      temp.removeAt(random);
    }

    setState(() {
      score = scores[number - 1];
      colors = List.filled(4, Colors.black);
      cauHoi;
      answer;
    });
    ListCH.removeAt(location);
  }

  void Finish() {
    DateTime time = DateTime.now();
    KetQua kp = new KetQua(
        NguoiChoi: player!.MaNC, Diem: score, ThoiGian: time.toString());
    KetQuaDao.insertKQ(kp);
    Navigator.pushNamed(context, "/Over", arguments: score);
  }

  // ignore: non_constant_identifier_names
  void Check(int index) {
    var time = 1;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        setState(() {
          colors[index] = Colors.yellow.shade800;
        });
        time--;
      } else {
        timer.cancel();
        if (answer[index].contains(cauHoi["DapAn"])) {
          var time2 = 1;
          timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
            if (time2 > 0) {
              setState(() {
                colors[index] = Colors.green.shade800;
                number++;
              });

              time2--;
            } else {
              timer2!.cancel();

              Next();
            }
          });
        } else {
          var temp = [];

          for (int i = 0; i < 4; i++) {
            if (answer[i].contains(cauHoi["DapAn"])) {
              var time2 = 1;
              timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
                if (time2 > 0) {
                  setState(() {
                    colors[index] = Colors.red.shade800;
                    colors[i] = Colors.green.shade800;
                  });
                  time2--;
                } else {
                  timer2!.cancel();
                  Finish();
                }
              });
            }
          }
        }
      }
    });
  }

  void half() {
    if (cls[0] == Colors.black) {
      int count = 0;
      for (int i = 0;; i++) {
        if (count < 2) {
          Random rd = new Random();
          int a = rd.nextInt(answer.length);
          if (!answer[i].contains(cauHoi["DapAn"]) && answer[i] != "") {
            answer[i] = "";
            count++;
          }
        } else {
          setState(() {
            cls[0] = Colors.white70;
          });
          break;
        }
      }
    }
  }

  void call() {
    if (cls[1] == Colors.black) {
      setState(() {
        cls[1] = Colors.white70;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Gọi điện"),
            content: Text("Tôi nghĩ đáp án: ${cauHoi["DapAn"]}"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void ask_audience() {
    if (cls[2] == Colors.black) {
      setState(() {
        cls[2] = Colors.white70;
      });
      int ptr = 100;
      var pt = List.filled(4, "");
      for (int i = 0; i < 4; i++) {
        if (answer[i].contains(cauHoi["DapAn"])) {
          int a = (40 + rd.nextInt(50));
          pt[i] = answer[i].substring(0, 2) + a.toString() + "%";
          ptr -= a;
        }
      }
      int count = 0;
      for (int i = 0; i < 4; i++) {
        if (!answer[i].contains(cauHoi["DapAn"])) {
          if (count < 2) {
            int a = rd.nextInt(ptr);
            pt[i] = answer[i].substring(0, 2) + a.toString() + "%";
            ptr -= a;
            count++;
          } else {
            pt[i] = answer[i].substring(0, 2) + ptr.toString() + "%";
          }
        }
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Gọi điện"),
            content: Text("${pt[0]},${pt[1]},${pt[2]},${pt[3]}"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
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
                    child: Text("$score đ\n$number/15",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center),
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.yellow.shade800,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.white)),
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    margin: EdgeInsets.only(top: 10, bottom: 10))),
            Flexible(
                child: Row(
              children: [
                Container(
                    child: ElevatedButton(
                        onPressed: () => half(),
                        child: Text("50:50", style: TextStyle(fontSize: 17)),
                        style: ElevatedButton.styleFrom(
                          primary: cls[0],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.white)),
                        )),
                    height: 40,
                    width: 70,
                    margin: EdgeInsets.fromLTRB(10, 5, 5, 5)),
                Container(
                    child: ElevatedButton(
                        onPressed: () => call(),
                        child: Text(""),
                        style: ElevatedButton.styleFrom(
                          primary: cls[1],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.white)),
                        )),
                    height: 40,
                    width: 70,
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5)),
                Container(
                    child: ElevatedButton(
                        onPressed: () => ask_audience(),
                        child: Text(""),
                        style: ElevatedButton.styleFrom(
                          primary: cls[2],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.white)),
                        )),
                    height: 40,
                    width: 70,
                    margin: EdgeInsets.fromLTRB(10, 5, 5, 5))
              ],
            )),
            Flexible(
                child: Container(
                    child: Text("${cauHoi["TenLV"]}",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                        textAlign: TextAlign.center),
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.white)),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    padding: EdgeInsets.only(top: 10, bottom: 10))),
            Flexible(
              child: Container(
                  child: Text("Câu hỏi: ${cauHoi["cauHoi"]}",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      textAlign: TextAlign.center),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.white)),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5)),
              flex: 2,
            ),
            Flexible(
              child: Container(
                child: ElevatedButton(
                    onPressed: () => Check(0),
                    child: Text("${answer[0]}", style: TextStyle(fontSize: 17)),
                    style: ElevatedButton.styleFrom(
                      primary: colors[0],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.white)),
                    )),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                width: double.infinity,
                height: 60,
              ),
              flex: 1,
            ),
            Flexible(
              child: Container(
                child: ElevatedButton(
                    onPressed: () => Check(1),
                    child: Text("${answer[1]}", style: TextStyle(fontSize: 17)),
                    style: ElevatedButton.styleFrom(
                      primary: colors[1],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.white)),
                    )),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                width: double.infinity,
                height: 60,
              ),
              flex: 1,
            ),
            Flexible(
              child: Container(
                child: ElevatedButton(
                    onPressed: () => Check(2),
                    child: Text("${answer[2]}", style: TextStyle(fontSize: 17)),
                    style: ElevatedButton.styleFrom(
                      primary: colors[2],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.white)),
                    )),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                width: double.infinity,
                height: 60,
              ),
              flex: 1,
            ),
            Flexible(
              child: Container(
                child: ElevatedButton(
                    onPressed: () => Check(3),
                    child: Text("${answer[3]}", style: TextStyle(fontSize: 17)),
                    style: ElevatedButton.styleFrom(
                      primary: colors[3],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.white)),
                    )),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                width: double.infinity,
                height: 60,
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
