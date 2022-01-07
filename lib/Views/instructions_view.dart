import 'package:flutter/material.dart';

class InstructionsView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.indigo.shade900,
    body: Center(child:ListView(children: [
        Flexible(child:Container(child: Text("Hướng dẫn cách chơi",textAlign: TextAlign.center,style:TextStyle(fontSize:22, color:Colors.yellow.shade800)),margin: EdgeInsets.all(10),)),
      Flexible(child: Container(child: Text("Người chơi sẽ vượt qua 15 câu hỏi của chương trình từ dễ đến khó tương ứng với 3 mốc rất quan trọng là 5, 10, 15. Có 3 quyền trợ giúp cho bạn và chỉ sử dụng 1 lần trong quá trình chơi.",style:TextStyle(fontSize:17, color:Colors.white)),margin: EdgeInsets.all(10),)),
      Flexible(child: Row(
        children: [
           Flexible(child:Container(child: Image.asset("assets/images/5050.png"),width: 50,height: 50,margin: EdgeInsets.fromLTRB(10,5,10, 5),)),
          Flexible(child:Container(child:Text("Máy tính sẽ loại bỏ 2 phương án sai cho bạn.",style:TextStyle(fontSize:17, color:Colors.white)))),
        ],
      ),),
      Flexible(child: Row(
        children: [
          Flexible(child:Container(child: Image.asset("assets/images/call.png"),width: 50,height:50,margin: EdgeInsets.fromLTRB(10,5,10, 5),)),
          Flexible(child:Container(child:Text("Nhờ chuyên gia tư vấn.",style:TextStyle(fontSize:17, color:Colors.white))))
        ],
      ),),
      Flexible(child: Row(
        children: [
          Flexible(child:Container(child: Image.asset("assets/images/hoiKhanGia.png"),width: 50,height: 50,margin: EdgeInsets.fromLTRB(10,5,10, 5),)),
          Flexible(child:Container(child:Text("Hỏi ý kiến khán giả.",style:TextStyle(fontSize:17, color:Colors.white))))
        ],
      ),),
      Flexible(child: Container(child: Text("Người chơi có 30s trả lời mỗi câu hỏi nếu hết 30s mà vẫn không đưa ra đáp án thì sẽ tính thua.",style:TextStyle(fontSize:17, color:Colors.white)),margin: EdgeInsets.all(10),)),
       Flexible(child: Container(child: Text("Số tiền thưởng tương ứng quá 15 câu hỏi:",style:TextStyle(fontSize:17, color:Colors.white)),margin: EdgeInsets.all(10),)),
      Flexible(child:Container(child: Image.asset("assets/images/money.PNG"),width: 250,height: 400,margin: EdgeInsets.fromLTRB(10,5,10, 5),)),
    ],),),
    );
  }
}
