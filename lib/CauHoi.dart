class CauHoi {
  int? MaCH;
  String? TenCH;
  String? CauTl1;
  String? CauTl2;
  String? CauTl3;
  String? CauTl4;
  String? DapAn;
  int? linhVuc;
  int? mucDo;
  CauHoi(
      {this.MaCH,
      required this.TenCH,
      required this.CauTl1,
      required this.CauTl2,
      required this.CauTl3,
      required this.CauTl4,
      required this.DapAn,
      required this.linhVuc,
      required this.mucDo});
  Map<String, dynamic> toMap() {
    return {
      'MaCH': MaCH,
      'TenCH': TenCH,
      'CauTl1': CauTl1,
      'CauTl1': CauTl1,
      'CauTl2': CauTl2,
      'CauTl3': CauTl3,
      'CauTl4': CauTl4,
      'DapAn': DapAn,
      'linhVuc': linhVuc,
      'mucDo': mucDo
    };
  }

  @override
  String toString() {
    return 'CauHoi{MaCH:$MaCH,TenCH:$TenCH,CauTl1:$CauTl1,CauTl2:$CauTl2,CauTl3:$CauTl3,CauTl4:$CauTl4,DapAn:$DapAn,linhVuc:$linhVuc,mucDo:$mucDo}';
  }
}
