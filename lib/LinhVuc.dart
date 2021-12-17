class LinhVuc {
  int? MaLV;
  String? TenLV;
  LinhVuc({this.MaLV, this.TenLV});

  Map<String, dynamic> toMap() {
    return {'MaLV': MaLV, 'TenLV': TenLV};
  }

  @override
  String toString() {
    return 'LinhVuc{MaLV:$MaLV,TenLV:$TenLV}';
  }
}
