import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'KetQua.dart';
import 'dbhelper.dart';
class KetQuaDao{
    static Future<void> insertKQ(KetQua KQ) async {
    final db = await AppDB.connectToDb();
    await db.insert("KetQua",KQ.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("${KQ.TenKQ} was inserted to db ketqua");
  }
   static Future<List<KetQua>> ListMD() async {
    final db = await AppDB.connectToDb();
    List<KetQua> list = [];
    final List<Map<String, dynamic>> maps = await db.query('KetQua');
    List.generate(maps.length, (i) {
      list.add(new KetQua(
          MaKQ: maps[i]['MaKQ'], TenKQ: maps[i]['TenKQ'],NguoiChoi:maps[i]['NguoiChoi'],Diem: maps[i]['Diem'],ThoiGian: maps[i]['ThoiGian'],));
    });
    return list;
  }
}