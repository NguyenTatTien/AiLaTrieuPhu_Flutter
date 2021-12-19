class NguoiChoi {
  int? MaNC;
  String? TenNC;
  NguoiChoi({this.MaNC,required this.TenNC});
   Map<String, dynamic> toMap() {
    return {
      'MaNC': MaNC,
      'TenNC': TenNC,
     
    };
  }

  @override
  String toString() {
    return 'CauHoi{MaNC:$MaNC,TenNC:$TenNC}';
  }
}
