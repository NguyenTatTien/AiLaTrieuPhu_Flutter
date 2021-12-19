import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import 'NguoiChoi.dart';
import 'dbhelper.dart';

class NguoiChoiDAO {
  static Future<void> insertCH(NguoiChoi NC) async {
    final db = await AppDB.connectToDb();
    await db.insert("NguoiChoi", NC.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("$NC.TenNC} was inserted to db NguoiChoi");
  }

  static Future<List<NguoiChoi>> ListCH() async {
    final db = await AppDB.connectToDb();
    List<NguoiChoi> list = [];
    final List<Map<String, dynamic>> maps = await db.query('NguoiChoi');
    List.generate(maps.length, (i) {
      list.add(new NguoiChoi(MaNC: maps[i]['MaNC'], TenNC: maps[i]['TenNC']));
    });
    return list;
  }
}
