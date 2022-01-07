import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../DAO/cau_hoi_dao.dart';
import '../Models/ket_qua.dart';
import '../DAO/ket_qua_dao.dart';
import '../Models/nguoi_choi.dart';
import '../DAO/nguoi_choi_dao.dart';

class GameView extends StatefulWidget {
  NguoiChoi? player;
  GameView({Key? key, this.player}) : super(key: key);

  @override
  _GameViewState createState() => _GameViewState(player);
}

class _GameViewState extends State<GameView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static BuildContext? _context;
  NguoiChoi? player;
  List<Map<String, dynamic>> ListCH = [];

  List<Color> colors = List.filled(4, Colors.black);
  List<String> imgName = ["5050.png", "call.png", "hoiKhanGia.png"];
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
  AudioCache _audio = new AudioCache();
  var height = List.filled(4, 0.0);
  bool used = false;
  _GameViewState(this.player);

  int count = 0;
  @override
  void initState() {
    _audio.play("audios/Nhac_nen_bat_dau.wav");
    MucDO();
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  void Start() {
    count = 30;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        setState(() {
          count--;
        });
      } else {
        timer.cancel();
        Finish();
      }
    });
  }

  void MucDO() async {
    if (number == 1) {
      ListCH = List<Map<String, dynamic>>.from(await CauHoiDAO.ListCH("Dễ"));
    } else if (number == 6) {
      ListCH =
          List<Map<String, dynamic>>.from(await CauHoiDAO.ListCH("Trung bình"));
    } else if (number == 11) {
      ListCH = List<Map<String, dynamic>>.from(await CauHoiDAO.ListCH("Khó"));
    }
    Next();
  }

  void Next() async {
    used=false;
    timer?.cancel();
    height = List.filled(4, 0.0);
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
    Start();
  }

  void Finish() {
    DateTime time = DateTime.now();
    KetQua kp = new KetQua(
        NguoiChoi: player!.MaNC, Diem: score, ThoiGian: time.toString());
    KetQuaDAO.insertKQ(kp);
    _audio.play("audios/Tieng-vo-tay.mp3");
    Navigator.pushNamed(context, "/Over", arguments: score);
  }

  // ignore: non_constant_identifier_names
  void Check(int index) {
    if (answer[index] != "") {
      _audio.play("audios/answer.mp3");
      setState(() {
        colors[index] = Colors.yellow.shade800;
      });
      var time = 1;
      timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
        if (time > 0) {
          time--;
        } else {
          timer2?.cancel();
          if (answer[index].contains(cauHoi["DapAn"])) {
            var time2 = 1;
            _audio.play("audios/am_thanh_tra_loi_dung.mp3");
            setState(() {
              colors[index] = Colors.green.shade800;
              number++;
            });
            timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
              if (time2 > 0) {
                time2--;
              } else {
                timer2!.cancel();

                MucDO();
              }
            });
          } else {
            for (int i = 0; i < 4; i++) {
              if (answer[i].contains(cauHoi["DapAn"])) {
                var time2 = 1;
                _audio.play("audios/Am-thanh-tra-loi-sai.mp3");
                setState(() {
                  colors[index] = Colors.red.shade800;
                  colors[i] = Colors.green.shade800;
                });
                timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
                  if (time2 > 0) {
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
  }

  void half() {
    if (imgName[0] == "5050.png") {
      int count = 0;
      for (int i = 0;; i++) {
        if (count < 2) {
          Random rd = new Random();
          int a = rd.nextInt(answer.length);
          if (!answer[a].contains(cauHoi["DapAn"]) && answer[a] != "") {
            answer[a] = "";
            count++;
          }
        } else {
          setState(() {
            imgName[0] = "50_50used.png";
          });
          break;
        }
      }
    }
  }

  void call() {
    if (imgName[1] == "call.png") {
      setState(() {
        imgName[1] = "call_used.png";
      });
      String feedback = "";
      for (int i = 0; i < 4; i++) {
        if (answer[i].contains(cauHoi["DapAn"])) {
          feedback = answer[i];
          break;
        }
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Gọi điện"),
            content: Text("Tôi nghĩ đáp án: $feedback"),
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

  void ask_audience() async {
    if (imgName[2] == "hoiKhanGia.png") {
      setState(() {
        imgName[2] = "hoiKhanGia_used.png";
      });

      int ptr = 100;
      var pt = List.filled(4, 0.0);
      for (int i = 0; i < 4; i++) {
        if (answer[i].contains(cauHoi["DapAn"])) {
          int a = (40 + rd.nextInt(60));

          height[i] = a.toDouble();
          ptr -= a;
        }
      }
      int count = 0;
      for (int i = 0; i < 4; i++) {
        if (!answer[i].contains(cauHoi["DapAn"])) {
          if (count < 2) {
            int a = rd.nextInt(ptr);

            height[i] = a.toDouble();
            ptr -= a;
            count++;
          } else {
            height[i] = ptr.toDouble();
          }
        }
      }
      used = true;
      setState(() {
        height;
      });
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
                    margin: EdgeInsets.only(top: 5, bottom: 5))),
            Flexible(
                child: Row(
              children: [
                Container(
                    child: ElevatedButton(
                        onPressed: () => half(),
                        child: Image.asset("assets/images/${imgName[0]}"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
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
                        child: Image.asset("assets/images/${imgName[1]}"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
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
                        child: Image.asset("assets/images/${imgName[2]}"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: Colors.white)),
                        )),
                    height: 40,
                    width: 70,
                    margin: EdgeInsets.fromLTRB(10, 5, 5, 5)),
                Container(
                  child: Text("Time:$count",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                )
              ],
            )),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      color: Colors.yellow,
                      width: 30,
                      height: height[0]*4/5,
                      curve: Curves.ease,
                    ),
                    margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  ),
                  Container(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      color: Colors.yellow,
                      width: 30,
                      height: height[1]*4/5,
                      curve: Curves.ease,
                    ),
                    margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  ),
                  Container(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      color: Colors.yellow,
                      width: 30,
                      height: height[2]*4/5,
                      curve: Curves.ease,
                    ),
                    margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  ),
                  Container(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      color: Colors.yellow,
                      width: 30,
                      height: height[3]*4/5,
                      curve: Curves.ease,
                    ),
                    margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  child: Text(used == false ? "" : "A: ${height[0].toInt()}%",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
                ),
                Container(
                    child: Text(
                        used == false ? "" : "B: ${height[1].toInt()}%",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    margin: EdgeInsets.fromLTRB(6, 0, 6, 0)),
                Container(
                    child: Text(
                        used == false ? "" : "C: ${height[2].toInt()}%",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    margin: EdgeInsets.fromLTRB(6, 0, 6, 0)),
                Container(
                    child: Text(
                        used == false ? "" : "D: ${height[3].toInt()}%",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    margin: EdgeInsets.fromLTRB(6, 0, 6, 0)),
              ])
            ]),
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
