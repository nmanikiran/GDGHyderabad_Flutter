import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo/db/todo_modal.dart';

class TodoDBHelper {
  static final TodoDBHelper _dbHelperInstance = new TodoDBHelper.internal();
  factory TodoDBHelper() => _dbHelperInstance;
  final String todosTable = 'todos';
  static Database _todoDatabase;

  Future<Database> get db async {
    if (_todoDatabase != null) return _todoDatabase;
    _todoDatabase = await initDB();
    return _todoDatabase;
  }

  TodoDBHelper.internal();

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'todo_db');
    var db = openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int dbVersion) async {
    var sql =
        "CREATE TABLE $todosTable (id INTEGER PRIMARY KEY AUTOINCREMENT, TITLE STRING)";
    await db.execute(sql);
  }

  Future<void> addTodo(Todo todo) async {
    final Database dbClient = await db;

    await dbClient.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Todo>> getTodos() async {
    final Database dbClient = await db;

    final List<Map<String, dynamic>> maps =
        await dbClient.query(todosTable, orderBy: 'id desc');
    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['TITLE'],
      );
    });
  }

  Future<void> updateTodo(Todo todo) async {
    final dbClient = await db;

    await dbClient.update(
      'todos',
      todo.toMap(),
      where: "id = ?",
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteTodo(int id) async {
    final dbClient = await db;

    await dbClient.delete(
      'todos',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
