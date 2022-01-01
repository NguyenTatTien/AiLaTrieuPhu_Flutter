import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'CauHoi.dart';
import 'dbhelper.dart';

class CauHoiDAO {
  static Future<void> insertCH(CauHoi CH) async {
    final db = await AppDB.connectToDb();
    await db.insert("CauHoi", CH.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("${CH.cauHoi} was inserted to db CauHoi");
  }

  static Future<List<Map<String, dynamic>>> ListCH(String mucDo) async {
    final db = await AppDB.connectToDb();

    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "Select MACH,cauHoi,CauTl1,CauTl2,CauTl3,CauTl4,DapAn,LinhVuc.TenLV From CauHoi,LinhVuc,MucDo Where CauHoi.linhVuc=LinhVuc.MaLV and CauHoi.mucDo=MucDo.MaMD and MucDo.TenMD='$mucDo'");

    return maps;
  }

//  static Future<List<CauHoi>> ListCH() async {
//     final db = await AppDB.connectToDb();
//     List<CauHoi> list = [];
//     final List<Map<String, dynamic>> maps = await db.query('CauHoi');
//     List.generate(maps.length, (i) {
//       list.add(new CauHoi(
//           MaCH: maps[i]['MaCH'],
//           cauHoi: maps[i]['cauHoi'],
//           CauTl1: maps[i]['CauTl1'],
//           CauTl2: maps[i]['CauTl2'],
//           CauTl3: maps[i]['CauTl3'],
//           CauTl4: maps[i]['CauTl4'],
//           DapAn: maps[i]['DapAn'],
//           linhVuc: maps[i]['linhVuc'],
//           mucDo: maps[i]['mucDo']));
//     });
//     return list;
//   }
  static Future<int> Count() async {
    final db = await AppDB.connectToDb();

    final List<Map<String, dynamic>> maps = await db.query('CauHoi');
    return maps.length;
  }
}
