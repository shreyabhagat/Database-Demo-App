import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  Database _db;

  Future <Database> get database async {
    if(_db!=null)
      return _db;
    else
     _db = await initDatabase();
     return _db;
  }
  Future<Database> initDatabase ()async{
    String databasePath = await getDatabasesPath();
    String path =join(databasePath,'student.db');
    return await openDatabase(path,version:1,onCreate: _onCreate);
  }
   Future<void>_onCreate(Database db ,int version)async{
      await db.execute('create table students(id integer primary key autoincrement,name text,branch text)');
   }
}
