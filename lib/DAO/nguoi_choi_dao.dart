import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import '../Models/nguoi_choi.dart';
import '../dbhelper.dart';

class NguoiChoiDAO {
  static Future<void> insertNC(NguoiChoi NC) async {
    final db = await AppDB.connectToDb();
    await db.insert("NguoiChoi", NC.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("$NC.TenNC} was inserted to db NguoiChoi");
  }

  static Future<List<NguoiChoi>> ListNC() async {
    final db = await AppDB.connectToDb();
    List<NguoiChoi> list = [];
    final List<Map<String, dynamic>> maps = await db.query('NguoiChoi');
    List.generate(maps.length, (i) {
      list.add(new NguoiChoi(MaNC: maps[i]['MaNC'], TenNC: maps[i]['TenNC']));
    });
    return list;
  }
  static Future<void> deleteNC(int id) async {
    final db = await AppDB.connectToDb();
    await db.delete(
      'NguoiChoi',
      where: 'MaNC=?',
      whereArgs: [id],
    );
    print("Delete $id");
  }
}
