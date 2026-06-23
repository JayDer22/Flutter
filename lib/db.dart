import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Mydb {
  late Database db;

  Future<void> open() async {
    var dbpath = await getDatabasesPath();
    String path = join(dbpath, "jay.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS students(
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            phone TEXT NOT NULL
          );
        ''');
      },
    );
  }
}