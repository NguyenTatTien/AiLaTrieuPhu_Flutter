class KetQua {
  int? MaKQ;
  String? TenKQ;
  int? NguoiChoi;
  int? Diem;
  String? ThoiGian;

  KetQua({this.MaKQ, required this.TenKQ,required this.NguoiChoi,required this.Diem,required this.ThoiGian});

  Map<String, dynamic> toMap() {
    return {'MaKQ': MaKQ, 'TenKQ': TenKQ,'NguoiChoi':NguoiChoi,'Diem':Diem, 'ThoiGian':ThoiGian};
  }

  @override
  String toString() {
    return 'DapAn{MaKQ:$MaKQ,TenKQ:$TenKQ,NguoiChoi:$NguoiChoi,Diem:$Diem,ThoiGian:$ThoiGian}';
  }
}
