import 'package:logger/logger.dart';
import 'package:nsdd/models/user.dart';
import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseProvider {
  DatabaseProvider._init();
  static final DatabaseProvider instance = DatabaseProvider._init();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;

    _db = await initDB('nsdd.db');
    return _db!;
  }

  initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    String path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
        'CREATE TABLE IF NOT EXISTS users(user_id TEXT PRIMARY KEY, short_name TEXT, message TEXT, token TEXT, token_expires_at TEXT, roles TEXT)',
      );
    });
  }

  Future close() async {
    final db = await instance.db;
    db.close();
  }

  Future<int> saveUser(User ui) async {
    int id = 0;
    try {
      final db = await instance.db;
      bool userExist = await userExists(db, ui.userId);
      if (userExist) {
        id = await updateUser(db, ui);
      } else {
        id = await db.insert('users', ui.toJson());
      }
    } catch (e) {
      Logger().e(e);
    }
    return id;
  }

  Future<List<User>> getUsersInfo() async {
    late List<User> infos;
    try {
      final db = await instance.db;
      List<Map<String, dynamic>> records = await db.query('users');
      infos = records.map((r) => User.fromJson(r)).toList();
    } catch (e) {
      Logger().e(e);
    }
    return infos;
  }

  Future<bool> userExists(final db, int userId) async {
    List<Map> list =
        await db.rawQuery("SELECT * FROM users WHERE user_id = ?", [userId]);
    return list.isNotEmpty;
  }

  Future<int> updateUser(final db, User ui) async {
    return db.update('users', ui.toJson(),
        where: 'user_id = ?', whereArgs: [ui.userId]);
  }

  Future<int> deleteUser(User ui) async {
    final db = await instance.db;
    return await db
        .delete('users', where: 'user_id = ?', whereArgs: [ui.userId]);
  }
}
