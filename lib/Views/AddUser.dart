import 'package:flutter/material.dart';
import '../NguoiChoi.dart';
import '../NguoiChoiDAO.dart';

class AddUser extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:Colors.indigo.shade900,
     
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),),borderSide: BorderSide(color: Colors.yellow)),
                    label: Text("Nhập tên người chơi",style: TextStyle(color: Colors.white)),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),),
                    style:TextStyle(color:Colors.white)
              ),
              padding: EdgeInsets.all(10)),
          Container(
              child: ElevatedButton(
                  onPressed: () {
                    if (_controller.text != null && _controller.text != "") {
                      NguoiChoiDAO.insertNC(
                          new NguoiChoi(TenNC: _controller.text));
                      Navigator.pop(context);
                       Navigator.pop(context);
                      Navigator.pushNamed(context, "/User");
                    }
                  },
                  child: Text("Thêm người chơi")))
        ],
      )),
    );
  }
}
