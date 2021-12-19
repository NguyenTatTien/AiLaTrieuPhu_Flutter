import 'package:ailatrieuphu_flutter/LinhVucDAO.dart';
import 'package:ailatrieuphu_flutter/MucDo.dart';
import 'package:flutter/material.dart';

import 'CauHoi.dart';
import 'LinhVuc.dart';
import 'MucDoDAO.dart';
import 'dbhelper.dart';

void main() async {
  var linhvuc = [
    "Lịch sử",
    "Toán học",
    "Văn học",
    "Ca dao, tục ngữ",
    "Địa lý",
    "Thể thao",
    "Văn hóa",
    "Truyện tranh"
  ];
  var mucdo = ["Dễ", "Trung bình", "Khó"];
  List<CauHoi> listCauHoi = [
    new CauHoi(TenCH: "Điền vào câu tục ngữ sau:\"Đàu voi đuôi...\"?",CauTl1: "Kiến",CauTl2:"Khỉ",CauTl3: "Lợn",CauTl4: "Chuột",DapAn: "Chuột",linhVuc: 4,mucDo: 1),
    new CauHoi(TenCH: "Những chú sư tử là tên gọi chỉ đội bóng nào sau đây?",CauTl1: "Tây Ban Nha",CauTl2:"Anh",CauTl3: "Mỹ",CauTl4: "Pháp",DapAn: "Anh",linhVuc: 6,mucDo: 1),
    new CauHoi(TenCH: "Tập thơ nhật ký trong tù được Hồ Chí Minh viết bằng tiếng gì?",CauTl1: "Tiếng Nôm",CauTl2:"Tiếng Hán",CauTl3: "Tiếng Anh",CauTl4: "Tiếng Việt",DapAn: "Tiếng Hán",linhVuc: 3,mucDo: 1),
    new CauHoi(TenCH: "Điền vào chỗ trống:\"Một con ngữa đau, cả...không ăn cỏ\"?",CauTl1: "Đàn",CauTl2:"Dòng",CauTl3: "Bầy",CauTl4: "Tàu",DapAn: "Tàu",linhVuc: 4,mucDo: 1),
    new CauHoi(TenCH: "Điền vào câu tục ngữ sau:\"Cha mẹ sinh con,trời sinh...\"?",CauTl1: "Nết",CauTl2:"Cỏ",CauTl3: "Cây",CauTl4: "Tính",DapAn: "Tính",linhVuc: 4,mucDo: 1),
    new CauHoi(TenCH: "Điền vào chỗ trống: An...thủ thường?",CauTl1: "Phận",CauTl2:"Cư",CauTl3: "Bài",CauTl4: "Số",DapAn: "Phận",linhVuc: 4,mucDo: 2),
    new CauHoi(TenCH: "Trong các nhân vật sau đây, nhân vật nào là người máy?",CauTl1: "Chaien",CauTl2:"Đêkhi",CauTl3: "Xuka",CauTl4: "Doraemon",DapAn: "Doraemon",linhVuc: 9,mucDo: 1),
    new CauHoi(TenCH: "Vienna là thủ đo nước nào?",CauTl1: "Angola",CauTl2:"Azebaijan",CauTl3: "Úc",CauTl4: "Áo",DapAn: "Áo",linhVuc: 5,mucDo: 3),
    new CauHoi(TenCH: "Người tối cổ còn được gọi là?",CauTl1: "Người khéo léo",CauTl2:"Người tinh khôn",CauTl3: "Người đứng thẳng",CauTl4: "Vượn người",DapAn: "",linhVuc: 1,mucDo: 2),
    new CauHoi(TenCH: "Đanh từ nào chỉ một vật dùng chống bụi?",CauTl1: "Khẩu huyết",CauTl2:"Khẩu phục",CauTl3: "Khẩu khí",CauTl4: "Khẩu trang",DapAn: "Khẩu trang",linhVuc: 3,mucDo: 2),
    new CauHoi(TenCH: "Etna - ngọn núi lữa cao nhất và hoạt động manh nhất châu Âu, nằm ở quốc gia nào?",CauTl1: "Thủy Sĩ",CauTl2:"Pháp",CauTl3: "Ý",CauTl4: "Áo",DapAn: "Ý",linhVuc: 5,mucDo: 3),
    new CauHoi(TenCH: "Con gái của Thục Phán An Dương Vương là ai?",CauTl1: "Ngọc Hoa",CauTl2:"Hoàn Châu",CauTl3: "Tiên Dung",CauTl4: "Mỵ Châu",DapAn: "Mỵ Châu",linhVuc: 1,mucDo: 2),
    new CauHoi(TenCH: "Wayne Rooney là cầu thủ bống đá người nước nào?",CauTl1: "Pháp",CauTl2:"Anh",CauTl3: "Chi Lê",CauTl4: "Colombia",DapAn: "Anh",linhVuc: 6,mucDo: 3),
    new CauHoi(TenCH: "Ngày nào sau đây là ngày \"Ngày Việt Nam nhận thức chứng tự kỷ\"?",CauTl1: "1/4",CauTl2:"2/4",CauTl3: "3/4",CauTl4: "4/4",DapAn: "2/4",linhVuc: 7,mucDo: 3),
    new CauHoi(TenCH: "Vịnh Vĩnh Hy nằm ở tỉnh nào nước ta?",CauTl1: "Bình Thuận",CauTl2:"Phú Yên",CauTl3: "Ninh Thuận",CauTl4: "Quãng Ninh",DapAn: "Ninh Thuận",linhVuc: 5,mucDo: 3),
    new CauHoi(TenCH: "Câu lạc bộ nào vô địch giải ngoại hàng Anh 2015/2016?",CauTl1: "Tottenham",CauTl2:"Chelsea",CauTl3: "Leicester City",CauTl4: "Manchester City",DapAn: "Leicester",linhVuc: 6,mucDo: 2),
  ];
  AppDB.connectToDb();

  if (LinhVucDAO.ListLV() == null) {
    for (int i = 0; i < linhvuc.length; i++) {
      LinhVuc lv = new LinhVuc(TenLV: linhvuc[i]);
      LinhVucDAO.insertLV(lv);
    }
  }
  if (MucDoDAO.ListMD() == null) {
    for (int i = 0; i < mucdo.length; i++) {
      MucDo md = new MucDo(TenMD: mucdo[i]);
      MucDoDAO.insertMD(md);
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Center(),
    );
  }
}
