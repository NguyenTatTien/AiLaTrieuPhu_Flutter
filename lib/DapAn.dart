class DapAn {
  int? MaDA;
  String? TenDA;
  DapAn({this.MaDA, this.TenDA});
  
  Map<String, dynamic> toMap() {
    return {'MaDA':MaDA,'TenDA': TenDA};
  }

  @override
  String toString() {
    return 'DapAn{MaDA:$MaDA,TenDA:$TenDA}';
  }
}