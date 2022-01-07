import 'Models/cau_hoi.dart';
import 'DAO/cau_hoi_dao.dart';
import 'Models/linh_vuc.dart';
import 'DAO/linh_vuc_dao.dart';
import 'Models/muc_do.dart';
import 'DAO/muc_do_dao.dart';
import 'dbhelper.dart';

class Data{
 static var linhvuc = [
    "Lịch sử",
    "Toán học",
    "Văn học",
    "Ca dao, tục ngữ",
    "Địa lý",
    "Thể thao",
    "Văn hóa",
    "Truyện tranh"
  ];
  static var mucdo = ["Dễ", "Trung bình", "Khó"];
  static List<CauHoi> listCauHoi = [
    new CauHoi(
        cauHoi: "Điền vào câu tục ngữ sau:\"Đầu voi đuôi...\"?",
        CauTl1: "Kiến",
        CauTl2: "Khỉ",
        CauTl3: "Lợn",
        CauTl4: "Chuột",
        DapAn: "Chuột",
        linhVuc: 4,
        mucDo: 1),
    new CauHoi(
        cauHoi: "Điền từ còn thiếu vào câu tục ngữ sau:\"Đầu năm mua muối, cuối năm mua...\"?",
        CauTl1: "Biệt thự",
        CauTl2: "Ô tô",
        CauTl3: "Máy tính bảng",
        CauTl4: "Vôi",
        DapAn: "Vôi",
        linhVuc: 4,
        mucDo: 1),
    new CauHoi(
        cauHoi: "Những chú sư tử là tên gọi chỉ đội bóng nào sau đây?",
        CauTl1: "Tây Ban Nha",
        CauTl2: "Anh",
        CauTl3: "Mỹ",
        CauTl4: "Pháp",
        DapAn: "Anh",
        linhVuc: 6,
        mucDo: 1),
    new CauHoi(
        cauHoi: "Tập thơ nhật ký trong tù được Hồ Chí Minh viết bằng tiếng gì?",
        CauTl1: "Tiếng Nôm",
        CauTl2: "Tiếng Hán",
        CauTl3: "Tiếng Anh",
        CauTl4: "Tiếng Việt",
        DapAn: "Tiếng Hán",
        linhVuc: 3,
        mucDo: 1),
         new CauHoi(
        cauHoi: "Trong các nhân vật sau đây, nhân vật nào là người máy?",
        CauTl1: "Chaien",
        CauTl2: "Đêkhi",
        CauTl3: "Xuka",
        CauTl4: "Doraemon",
        DapAn: "Doraemon",
        linhVuc: 9,
        mucDo: 1),
    new CauHoi(
        cauHoi: "Điền vào chỗ trống:\"Một con ngữa đau, cả...không ăn cỏ\"?",
        CauTl1: "Đàn",
        CauTl2: "Dòng",
        CauTl3: "Bầy",
        CauTl4: "Tàu",
        DapAn: "Tàu",
        linhVuc: 4,
        mucDo: 1),
    new CauHoi(
        cauHoi: "Điền vào câu tục ngữ sau:\"Cha mẹ sinh con,trời sinh...\"?",
        CauTl1: "Nết",
        CauTl2: "Cỏ",
        CauTl3: "Cây",
        CauTl4: "Tính",
        DapAn: "Tính",
        linhVuc: 4,
        mucDo: 1),
    new CauHoi(
        cauHoi: "Điền vào chỗ trống: An...thủ thường?",
        CauTl1: "Phận",
        CauTl2: "Cư",
        CauTl3: "Bài",
        CauTl4: "Số",
        DapAn: "Phận",
        linhVuc: 4,
        mucDo: 2),
     new CauHoi(
        cauHoi: "Người tối cổ còn được gọi là?",
        CauTl1: "Người khéo léo",
        CauTl2: "Người tinh khôn",
        CauTl3: "Người đứng thẳng",
        CauTl4: "Vượn người",
        DapAn: "Vượn người",
        linhVuc: 1,
        mucDo: 2),
        new CauHoi(
        cauHoi: "Con gái của Thục Phán An Dương Vương là ai?",
        CauTl1: "Ngọc Hoa",
        CauTl2: "Hoàn Châu",
        CauTl3: "Tiên Dung",
        CauTl4: "Mỵ Châu",
        DapAn: "Mỵ Châu",
        linhVuc: 1,
        mucDo: 2),
         new CauHoi(
        cauHoi: "Đanh từ nào chỉ một vật dùng chống bụi?",
        CauTl1: "Khẩu huyết",
        CauTl2: "Khẩu phục",
        CauTl3: "Khẩu khí",
        CauTl4: "Khẩu trang",
        DapAn: "Khẩu trang",
        linhVuc: 3,
        mucDo: 2),
         new CauHoi(
        cauHoi: "27-2 là ngày kỉ niệm nào sau đây?",
        CauTl1: "Ngày Thầy thuốc Việt Nam",
        CauTl2: "Ngày Quốc tế Thiếu nhi",
        CauTl3: "Ngày Quốc tế Phụ nữ",
        CauTl4: "Ngày giải phóng Thủ đô",
        DapAn: "Ngày Thầy thuốc Việt Nam",
        linhVuc: 7,
        mucDo: 2),
    new CauHoi(
        cauHoi: "Ngọn hải đăng Hòn Dấu nằm ở tỉnh thành nào của nước ta?",
        CauTl1: "Quảng Ninh",
        CauTl2: "Phú Yên",
        CauTl3: "Hải Phòng",
        CauTl4: "Bình Thuận",
        DapAn: "Hải Phòng",
        linhVuc: 5,
        mucDo: 2),
    new CauHoi(
        cauHoi: "Vienna là thủ đo nước nào?",
        CauTl1: "Angola",
        CauTl2: "Azebaijan",
        CauTl3: "Úc",
        CauTl4: "Áo",
        DapAn: "Áo",
        linhVuc: 5,
        mucDo: 3),
  
   
    new CauHoi(
        cauHoi:
            "Etna - ngọn núi lữa cao nhất và hoạt động manh nhất châu Âu, nằm ở quốc gia nào?",
        CauTl1: "Thủy Sĩ",
        CauTl2: "Pháp",
        CauTl3: "Ý",
        CauTl4: "Áo",
        DapAn: "Ý",
        linhVuc: 5,
        mucDo: 3),
    
    new CauHoi(
        cauHoi: "Wayne Rooney là cầu thủ bống đá người nước nào?",
        CauTl1: "Pháp",
        CauTl2: "Anh",
        CauTl3: "Chi Lê",
        CauTl4: "Colombia",
        DapAn: "Anh",
        linhVuc: 6,
        mucDo: 3),
    new CauHoi(
        cauHoi:
            "Ngày nào sau đây là ngày \"Ngày Việt Nam nhận thức chứng tự kỷ\"?",
        CauTl1: "1/4",
        CauTl2: "2/4",
        CauTl3: "3/4",
        CauTl4: "4/4",
        DapAn: "2/4",
        linhVuc: 7,
        mucDo: 3),
    new CauHoi(
        cauHoi: "Vịnh Vĩnh Hy nằm ở tỉnh nào nước ta?",
        CauTl1: "Bình Thuận",
        CauTl2: "Phú Yên",
        CauTl3: "Ninh Thuận",
        CauTl4: "Quãng Ninh",
        DapAn: "Ninh Thuận",
        linhVuc: 5,
        mucDo: 3),
    new CauHoi(
        cauHoi: "Câu lạc bộ nào vô địch giải ngoại hàng Anh 2015/2016?",
        CauTl1: "Tottenham",
        CauTl2: "Chelsea",
        CauTl3: "Leicester City",
        CauTl4: "Manchester City",
        DapAn: "Leicester City",
        linhVuc: 6,
        mucDo: 3),
        new CauHoi(
        cauHoi: "\"Đội quân màu thiên thanh\" là biệt danh của đội bóng nước nào?",
        CauTl1: "Hà Lan",
        CauTl2: "Ý",
        CauTl3: "Đức",
        CauTl4: "Na Uy",
        DapAn: "Ý",
        linhVuc: 6,
        mucDo: 3),
         new CauHoi(
        cauHoi: "Quốc gia châu Phi nào lần đầu tiên được đăng cai tổ chức World Cup?",
        CauTl1: "Algeria",
        CauTl2: "Nam Phi",
        CauTl3: "Ghana",
        CauTl4: "Kenya",
        DapAn: "Nam Phi",
        linhVuc: 6,
        mucDo: 3),
  ];
  static void DataGmae() async{
     AppDB.connectToDb();
  if (await LinhVucDAO.Count() == 0) {
    for (int i = 0; i < linhvuc.length; i++) {
      LinhVuc lv = new LinhVuc(TenLV: linhvuc[i]);
      LinhVucDAO.insertLV(lv);
    }
  }
  if (await MucDoDAO.Count() == 0) {
    for (int i = 0; i < mucdo.length; i++) {
      MucDo md = new MucDo(TenMD: mucdo[i]);
      MucDoDAO.insertMD(md);
    }
  }
  if (await CauHoiDAO.Count() == 0) {
    for (int i = 0; i < listCauHoi.length; i++) {
      CauHoiDAO.insertCH(listCauHoi[i]);
    }
  }
  }
}