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
                child: Text("Hello, "+player!.TenNC!,style:TextStyle(fontSize: 22,color:Colors.white)),
                padding: EdgeInsets.all(10),
              ),
              flex: 1,
            ),
            // Flexible(
            //     child: ConstrainedBox(
            //   constraints: BoxConstraints(),
            //   child: Container(
            //       child: DecoratedBox(child: ElevatedButton(
            //           onPressed: () {
            //             Navigator.pushNamed(context, "/Game",
            //                 arguments: NguoiChoi(
            //                     MaNC: player!.MaNC, TenNC: player!.TenNC));
            //           },
            //           child: Text("Chơi game",style: TextStyle(fontSize:20),),style: ElevatedButton.styleFrom(
            //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side:BorderSide(color:Colors.white)),
            //           primary: Colors.transparent,

            //           )),decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.indigoAccent.shade700,Colors.purple.shade800,Colors.indigoAccent.shade700]),borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.white)),),
            //       padding: EdgeInsets.all(10),
            //      width: double.infinity,
            //      height: 70,

            //       ),

            // ),flex: 1,),
            Flexible(
              child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/Game",arguments: player);
                    },
                    child: Text("Chơi game", style: TextStyle(fontSize: 20)),
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
                      
                    },
                    child: Text("Điểm số", style: TextStyle(fontSize: 20)),
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
                    onPressed: () {},
                    child: Text("Người chơi", style: TextStyle(fontSize: 20)),
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
