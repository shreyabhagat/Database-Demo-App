import 'package:Database/model/student.dart';
import 'package:Database/services/databaseHelper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:core';

class StudentOperation {
  StudentOperation._();

  static final StudentOperation instance = StudentOperation._();

  Future<int> addStudent(Student student) async {
    Database db = await DatabaseHelper.instance.database;
    return db.insert('students', student.toMap());
  }

  Future<int> deleteStudent(Student student) async {
    Database db = await DatabaseHelper.instance.database;
    return db.delete('students', where: 'id=?', whereArgs: [student.id]);
  }

  Future<int> editStudent(Student student) async {
    Database db = await DatabaseHelper.instance.database;
    return db.update('students', student.toMap(),
        where: 'id=?', whereArgs: [student.id]);
  }

  Future<List<Student>> getAllStudents() async {
    Database db = await DatabaseHelper.instance.database;

    List<Map<String, dynamic>> maps = await db.query('students');

    List<Student> students = [];

    for (int i = 0; i < maps.length; i++) {
      students.add(Student.fromMap(maps[i]));
    }
    return students;
  }
}
