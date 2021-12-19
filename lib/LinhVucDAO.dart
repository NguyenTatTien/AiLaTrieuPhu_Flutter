import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'LinhVuc.dart';
import 'dbhelper.dart';

class LinhVucDAO {
  static Future<void> insertLV(LinhVuc LV) async {
    final db = await AppDB.connectToDb();
    await db.insert("LinhVuc", LV.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("${LV.TenLV} was inserted to db dapan");
  }

  static Future<List<LinhVuc>> ListLV() async {
    final db = await AppDB.connectToDb();
    List<LinhVuc> lvs = [];
    final List<Map<String, dynamic>> maps = await db.query('LinhVuc');
    List.generate(maps.length, (i) {
      lvs.add(new LinhVuc(MaLV: maps[i]['MaLV'], TenLV: maps[i]['TenLV']));
    });
    return lvs;
  }

  static Future<int> Count() async {
    final db = await AppDB.connectToDb();

    final List<Map<String, dynamic>> maps = await db.query('LinhVuc');
    return maps.length;
  }
}
