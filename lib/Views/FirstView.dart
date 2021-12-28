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
void LoadPlayers() async{
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
        appBar: AppBar(
          title: Center(
            child: Text("User"),
          ),
          leading: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addowner');
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
                        child: Text("${Players[index].TenNC}",
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
                  onTap: () {}),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              color: Colors.teal,
              // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
            );
          },
          itemCount: Players.length,
        ));
  }


}
