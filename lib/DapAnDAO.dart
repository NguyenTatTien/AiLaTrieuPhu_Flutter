import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'DapAn.dart';
import 'dbhelper.dart';
class DapAnDao{
    static Future<void> insertOwner(DapAn DA) async {
    final db = await AppDB.connectToDb();
    await db.insert("DapAn",DA.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("${DA.TenDA} was inserted to db dapan");
  }
}