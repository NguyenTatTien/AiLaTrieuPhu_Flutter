class MucDo {
  int? MaMD;
  String? TenMD;
  MucDo({this.MaMD, this.TenMD});
  
  Map<String, dynamic> toMap() {
    return {'MaMD':MaMD,'TenMD': TenMD};
  }

  @override
  String toString() {
    return 'MucDo{MaMD:$MaMD,TenMD:$TenMD}';
  }
}
