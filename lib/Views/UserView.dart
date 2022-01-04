import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../NguoiChoi.dart';
import '../NguoiChoiDAO.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView>
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
    setState(() {
      Players;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void delete(int MaNC) async {
    await NguoiChoiDAO.deleteNC(MaNC);
    LoadPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo.shade900,
        appBar: AppBar(
          title: Text("User"),
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
                          "${Players[index].TenNC}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        flex: 7,
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () => delete(Players[index].MaNC!),
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
                  color: Colors.yellow.shade800,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
            );
          },
          itemCount: Players.length,
        ));
  }
}
