import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import '../Models/ket_qua.dart';
import '../dbhelper.dart';
class KetQuaDAO{
    static Future<void> insertKQ(KetQua KQ) async {
    final db = await AppDB.connectToDb();
    await db.insert("KetQua",KQ.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("${KQ.Diem} was inserted to db ketqua");
  }
   static Future<List<KetQua>> ListKQ(int MaNC) async {
    final db = await AppDB.connectToDb();
    List<KetQua> list = [];
    final List<Map<String, dynamic>> maps = await db.rawQuery("Select * from KetQua Where nguoiChoi=$MaNC Order By ThoiGian Desc");
    List.generate(maps.length, (i) {
      list.add(new KetQua(
          MaKQ: maps[i]['MaKQ'],NguoiChoi:maps[i]['NguoiChoi'],Diem: maps[i]['Diem'],ThoiGian: maps[i]['ThoiGian'],));
    });
    return list;
  }
}