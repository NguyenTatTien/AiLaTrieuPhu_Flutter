import 'package:flutter/material.dart';

import '../NguoiChoi.dart';
import '../NguoiChoiDAO.dart';

class FirstView extends StatefulWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  _FirstViewState createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<NguoiChoi> Players = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    LoadPlayers();
  }

  void LoadPlayers() async {
    Players = await NguoiChoiDAO.ListNC();
 
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
        appBar: AppBar(
          title: Center(
            child: Text("User"),
          ),
          leading: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/AddUser');
            },
          ),
        ),
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
                          "${Players[index].TenNC}",textAlign: TextAlign.center,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize:16,
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
                        arguments: NguoiChoi(
                            MaNC: Players[index].MaNC,
                            TenNC: Players[index].TenNC));
                  }),
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              padding: EdgeInsets.all(5),

              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
            );
          },
          itemCount: Players.length,
        ));
  }
}
