import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import '../Models/muc_do.dart';
import '../dbhelper.dart';

class MucDoDAO {
  static Future<void> insertMD(MucDo MD) async {
    final db = await AppDB.connectToDb();
    await db.insert("MucDo", MD.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("${MD.TenMD} was inserted to db mucdo");
  }

  static Future<List<MucDo>> ListMD() async {
    final db = await AppDB.connectToDb();
    List<MucDo> list = [];
    final List<Map<String, dynamic>> maps = await db.query('MucDo');
    List.generate(maps.length, (i) {
      list.add(new MucDo(MaMD: maps[i]['MaMD'], TenMD: maps[i]['TenMD']));
    });
    return list;
  }

  static Future<int> Count() async {
    final db = await AppDB.connectToDb();

    final List<Map<String, dynamic>> maps = await db.query('MucDo');
    return maps.length;
  }
}
