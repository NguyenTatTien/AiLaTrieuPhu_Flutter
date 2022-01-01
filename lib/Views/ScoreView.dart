import 'package:flutter/material.dart';

class ScoreView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.indigo.shade900,
       
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
                          "tiennguyen",
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white),
                        ),
                        flex: 7,
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/Menu",
                        // arguments: NguoiChoi(
                        //     MaNC: Players[index].MaNC,
                        //     TenNC: Players[index].TenNC)
                            );
                  }),
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
            );
          },
          itemCount: 3,
        ));
  }
}