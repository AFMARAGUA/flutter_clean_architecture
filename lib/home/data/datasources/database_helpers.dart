import 'dart:io';
import 'package:path/path.dart';
import 'package:practice_flutter_maragua/home/domain/entities/user_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

final String tableUsers = 'users';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableUsers (
                id INTEGER PRIMARY KEY,
                email TEXT,
                firstName TEXT,
                lastName TEXT,
                avatar TEXT
              )
              ''');
  }

  Future<int> insert(User user) async {
    Database db = await database;
    int id = await db.insert(
      tableUsers,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  Future<User> queryUser(int id) async {
    Database db = await database;
    User user = User(avatar: '', email: '', firstName: '', lastName: '', id: 0);
    List<Map> maps =
        await db.query(tableUsers, where: 'id = ?', whereArgs: [id]);
    if (maps.length > 0) {
      user = User.fromJsonSqlite(maps.first);
    }
    return user;
  }
}
