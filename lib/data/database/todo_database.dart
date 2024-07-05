import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todos_app/domain/entities/todo.dart';

class TodoDatabase {
  static final TodoDatabase instance = TodoDatabase._init();

  static Database? _database;

  TodoDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('todo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    await db.execute('''
CREATE TABLE $tableTodo ( 
  ${TodoField.id} $idType, 
  ${TodoField.isDone} $boolType,
  ${TodoField.title} $textType
  )
''');
  }

  Future create(Todo todo) async {
    final db = await instance.database;

    final id = await db.insert(
      tableTodo,
      todo.toMap(),
    );
    return todo.copyWith(id: id);
  }

  Future<List<Todo>> getTodo() async {
    final db = await instance.database;

    final result = await db.query(
      tableTodo,
    );
    return result.map((json) => Todo.fromMap(json)).toList();
  }

  Future<Todo> update(Todo todo) async {
    final db = await instance.database;

    db.update(
      tableTodo,
      todo.toMap(),
      where: '${TodoField.id} = ?',
      whereArgs: [todo.id],
    );
    return todo;
  }

  Future<bool> delete(int id) async {
    final db = await instance.database;

    await db.delete(
      tableTodo,
      where: '${TodoField.id} = ?',
      whereArgs: [id],
    );
    return true;
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
