import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'CauHoi.dart';
import 'dbhelper.dart';
class CauHoiDAO{
    static Future<void> insertCH(CauHoi CH) async {
    final db = await AppDB.connectToDb();
    await db.insert("CauHoi",CH.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("${CH.TenCH} was inserted to db CauHoi");
  }
  static Future<List<CauHoi>> ListCH() async {
    final db = await AppDB.connectToDb();
    List<CauHoi> list = [];
    final List<Map<String, dynamic>> maps = await db.query('CauHoi');
    List.generate(maps.length, (i) {
      list.add(new CauHoi(
          MaCH: maps[i]['MaCH'], TenCH: maps[i]['TenCH'],CauTl1:maps[i]['CauTl1'],CauTl2:maps[i]['CauTL2'],CauTl3:maps[i]['CauTL3'],CauTl4: maps[i]['CauTl4'],DapAn:maps[i]['DapAn'], linhVuc: maps[i]['linhVuc'],mucDo: maps[i]['mucDo']));
    });
    return list;
  }
}