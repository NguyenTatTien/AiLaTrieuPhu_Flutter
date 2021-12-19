import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class AppDB {
  static Future<Database> connectToDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    final appdb = openDatabase(
      join(await getDatabasesPath(), "appdb.db"),
      onCreate: (db, version) => createDb(db),
      version: 1,
    );
    print('appdb.db was opened');
    return appdb;
  }

  static createDb(Database db) async {
    await db.execute(
      '''CREATE TABLE NguoiChoi(
        MaNC INTEGER PRIMARY KEY AUTOINCREMENT,
        TenNC TEXT
        )'''
    );
      await db.execute(
      '''CREATE TABLE KetQua(
        MaKQ INTEGER PRIMARY KEY AUTOINCREMENT,
        nguoiChoi INTEGER, 
        Diem INTEGER,
        ThoiGian TEXT,
        FOREIGN KEY (nguoiChoi) REFERENCES NguoiChoi(MaNC) ON DELETE CASCADE
        )'''
    );
    // await db.execute('''CREATE TABLE DapAn(
    //      MaDA INTEGER PRIMARY KEY AUTOINCREMENT,
    //      TenDA Text
    //   )''');
       await db.execute('''CREATE TABLE LinhVuc(
         MaLV INTEGER PRIMARY KEY AUTOINCREMENT,
         TenLV Text
      )''');
          await db.execute('''CREATE TABLE MucDo(
         MaMD INTEGER PRIMARY KEY AUTOINCREMENT,
         TenMD Text
      )''');
    await db.execute(
      '''CREATE TABLE CauHoi(
        MaCH INTEGER PRIMARY KEY AUTOINCREMENT,
        cauHoi TEXT,
        CauTl1 Text,
        CauTl2 Text,
        CauTl3 Text,
        CauTl4 Text,
        DapAn Text,
        linhVuc INTEGER,
        mucDo INTEGER,
        FOREIGN KEY (linhVuc) REFERENCES LinhVuc(MaLV) ON DELETE CASCADE,
        FOREIGN KEY (mucDo) REFERENCES MucDo(MaMD) ON DELETE CASCADE
        )'''
    );

    print('create table');
  }
}
