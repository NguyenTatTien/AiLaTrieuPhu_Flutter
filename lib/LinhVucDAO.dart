import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'LinhVuc.dart';
import 'dbhelper.dart';
class LinhVucDao{
    static Future<void> insertOwner(LinhVuc LV) async {
    final db = await AppDB.connectToDb();
    await db.insert("LinhVuc",LV.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("${LV.TenLV} was inserted to db dapan");
  }
}