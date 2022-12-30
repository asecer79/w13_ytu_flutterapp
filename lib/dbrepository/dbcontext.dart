import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:w13_ytu_flutterapp/dbrepository/student.dart';

class DbContext {
  static Database? _db;

  static Future<Database> _init() async {
    var dbPath = await getDatabasesPath();
    var fullPath = join(dbPath, "schooldb.db");
    var dbFile = File(fullPath);

    //comment this line in production
    // if (await databaseExists(fullPath)) {
    //   await deleteDatabase(fullPath); //will be removed
    // }

    var exists = await databaseExists(fullPath);
    if (!exists) {
      await Directory(dirname(fullPath)).create(recursive: true);
      ByteData byteData = await rootBundle.load(join("db", "schooldb.db"));
      var bytes = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      await dbFile.writeAsBytes(bytes, flush: true);
    }

    _db = await openDatabase(fullPath, readOnly: false);

    return _db!;
  }

  //CRUD

  static Future<List<Student>> getStudents() async {
    var db = await _init();
    var list = <Student>[];

    var jsonDataList = await db.query("students");

    for (var element in jsonDataList) {
      list.add(Student.fromJsonObject(element));
    }
    return list;
  }

  static Future<Student> getStudent(int id) async {
    var db = await _init();

    var jsonDataList =
        await db.query("students", where: "id=?", whereArgs: [id]);

    var jsonData = jsonDataList.toList().first;
    var std = Student.fromJsonObject(jsonData);
    return std;
  }

  static Future<void> insertStudent(Student student) async {
    var db = await _init();

    var jsonData = student.toJsonObject();
    await db.insert("students", jsonData);
  }

  static Future<void> updateStudent(Student student) async {
    var db = await _init();

    var jsonData = student.toJsonObject();
    await db
        .update("students", jsonData, where: "id=?", whereArgs: [student.id]);
  }

  static Future<void> deleteStudent(int id) async {
    var db = await _init();
    await db.delete("students", where: "id=?", whereArgs: [id]);
  }
}
