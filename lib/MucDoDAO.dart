import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'MucDo.dart';
import 'dbhelper.dart';
class MucDoDao{
    static Future<void> insertOwner(MucDo MD) async {
    final db = await AppDB.connectToDb();
    await db.insert("MucDo",MD.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("${MD.TenMD} was inserted to db mucdo");
  }
}