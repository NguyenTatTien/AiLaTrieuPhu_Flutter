import 'package:flutter/material.dart';

import '../KetQua.dart';
import '../KetQuaDAO.dart';
import '../NguoiChoi.dart';

class ScoreView extends StatefulWidget {
  NguoiChoi? player;
  ScoreView({Key? key, this.player}) : super(key: key);

  @override
  _ScoreViewState createState() => _ScoreViewState(player);
}

class _ScoreViewState extends State<ScoreView>
    with SingleTickerProviderStateMixin {
  NguoiChoi? player;
  late AnimationController _controller;
  _ScoreViewState(this.player);
  List<KetQua> kq = [];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    LoadDT();
  }

  void LoadDT() async {
    kq = await KetQuaDAO.ListKQ(player!.MaNC!);
    setState(() {
      kq;
    });
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
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          // "${Players[index].TenNC
                          "${kq[index].Diem} đ - ${kq[index].ThoiGian}",textAlign:TextAlign.center,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white, fontSize:16),
                        ),
                        flex: 7,
                      ),
                    
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context, "/Menu",
                      // arguments: NguoiChoi(
                      //     MaNC: Players[index].MaNC,
                      //     TenNC: Players[index].TenNC)
                    );
                  }),
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              padding: EdgeInsets.all(20),

              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
            );
          },
          itemCount: kq.length,
        ));
  }
}
