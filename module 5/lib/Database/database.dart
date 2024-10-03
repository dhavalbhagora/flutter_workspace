import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final dbname = "flutter.db";
  static final dbversion = 1;

  final tablename_id = "Task_list";
  final columnId = 'Task_id';
  final columnName = 'Task_Name';
  final columnDescription = 'Task_Description';
  final columnTime = 'Task_Time';
  final columnDate = 'Task_date';
  final columnPriority = 'Task_Priority';
  Database? database1;
  DatabaseHelper._a();
  static final DatabaseHelper instance = DatabaseHelper._a();

  Future<Database> get database async => database1 ??= await _initDatabase();

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbname);
    return await openDatabase(path, version: dbversion, onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    //user table
    await db.execute('''
          CREATE TABLE IF NOT EXISTS $tablename_id (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL, 
            $columnDescription TEXT NOT NULL, 
            $columnTime TEXT NOT NULL, 
            $columnDate TEXT NOT NULL,
            $columnPriority TEXT NOT NULL
            )
          ''');
  }

  Future<int> insertTask(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db.insert(tablename_id, row);
  }

  Future<List<Map<String, dynamic>>> queryAllTask() async {
    Database db = await instance.database;
    return await db.query(tablename_id); //select * from category
  }

  Future<int> deleteTask(int id) async {
    Database db = await instance.database;
    return await db.delete('Task_list', where: 'Task_id = ?', whereArgs: [id]);
  }

  Future<int> updateTask(Map<String, dynamic> row) async {
    final db = await database;
    int id = row['Task_id']; // Use the id to update the specific product
    return await db.update(
      tablename_id, // Table name
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
