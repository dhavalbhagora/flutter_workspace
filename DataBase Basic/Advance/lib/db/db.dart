import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class MyDbHelper {
  static final dbname = "flutter.db";
  static final dbversion = 1;

  static final tablename = "category";
  static final catid = "id";
  static final catname = "c_name";
  static final tableContact = 'contact';

  //contact table fields
  final columnId1 = '_id';
  final columnName = 'name';
  final columnLName = 'lname';
  final columnMobile = 'mobile';
  final columnEmail = 'email';
  final columnCategory = 'cat';
  final columnProfile = 'profile';

  Database? database1;

  MyDbHelper._a();

  static final MyDbHelper instance = MyDbHelper._a();

  Future<Database> get database async => database1 ??= await _initDatabase();

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbname);
    return await openDatabase(path, version: dbversion, onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tablename 
          (
            $catid INTEGER PRIMARY KEY,
            $catname TEXT NOT NULL 
          )
          ''');
    await db.execute('''
          CREATE TABLE $tableContact (
            $columnId1 INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL, 
            $columnLName TEXT NOT NULL, 
            $columnMobile TEXT NOT NULL, 
            $columnEmail TEXT NOT NULL, 
            $columnCategory TEXT NOT NULL, 
            $columnProfile TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db.insert(tablename, row);
  }

  Future<int> insertContact(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db.insert(tableContact, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(tablename); //select * from category
  }

  Future<List<Map<String, dynamic>>> queryAllRowscontact() async {
    Database db = await instance.database;
    return await db.query(tableContact); //select * from contact
  }

  //delete contact
  Future<int> deleteContact(int id) async {
    Database db = await instance.database;
    return await db
        .delete(tableContact, where: '$columnId1 = ?', whereArgs: [id]);
  }

  //delete category
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db
        .delete(tableContact, where: '$columnId1 = ?', whereArgs: [id]);
  }
}
