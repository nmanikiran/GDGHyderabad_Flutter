import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:deal_cart/db/item_model.dart';

class DealCartDBHelper {
  static final DealCartDBHelper _dbHelperInstance =
      new DealCartDBHelper.internal();
  factory DealCartDBHelper() => _dbHelperInstance;

  static Database _dealCartDatabase;
  final String productsTable = 'Products';
  final String favoriteTable = 'Favorites';

  Future<Database> get db async {
    if (_dealCartDatabase != null) return _dealCartDatabase;
    _dealCartDatabase = await initDB();
    return _dealCartDatabase;
  }

  DealCartDBHelper.internal();

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'dealCart.db');
    var db = openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int dbVersion) async {
    // await deleteTables(db);
    await db.execute(
        "CREATE TABLE $productsTable(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, category TEXT, price TEXT, image TEXT, description TEXT, colors TEXT)");
    await db.execute(
        "CREATE TABLE $favoriteTable(id INTEGER PRIMARY KEY AUTOINCREMENT, itemId INTEGER, category TEXT)");
  }

  Future<void> addBag(Item bag) async {
    final Database dbClient = await db;

    await dbClient.insert(
      "$productsTable",
      bag.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Item>> getBags() async {
    final Database dbClient = await db;

    final List<Map<String, dynamic>> maps = await dbClient.rawQuery(
        'SELECT * FROM $productsTable WHERE category="bags" ORDER BY id desc');
    return List.generate(maps.length, (i) {
      return Item.fromJson(maps[i]);
    });
  }

  Future<void> addJacket(Item bag) async {
    final Database dbClient = await db;

    await dbClient.insert(
      "$productsTable",
      bag.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Item>> getJackets() async {
    final Database dbClient = await db;

    final List<Map<String, dynamic>> maps = await dbClient.rawQuery(
      'SELECT * FROM $productsTable WHERE category="jackets"  ORDER BY id desc',
    );
    return List.generate(maps.length, (i) {
      return Item.fromJson(maps[i]);
    });
  }

  Future<void> addShoe(Item bag) async {
    final Database dbClient = await db;

    await dbClient.insert(
      "$productsTable",
      bag.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Item>> getShoes() async {
    final Database dbClient = await db;

    final List<Map<String, dynamic>> maps = await dbClient.rawQuery(
        'SELECT * FROM $productsTable WHERE category="shoes" ORDER BY id desc');
    return List.generate(maps.length, (i) {
      return Item.fromJson(maps[i]);
    });
  }

  Future<List<Item>> getFavorites() async {
    final Database dbClient = await db;

    final List<Map<String, dynamic>> maps = await dbClient.rawQuery(
      'SELECT p.* FROM $productsTable p INNER JOIN $favoriteTable f ON f.itemId = p.id ',
    );
    return List.generate(maps.length, (i) {
      return Item.fromJson(maps[i]);
    });
  }

  Future<void> addToFavorite(Item product) async {
    final Database dbClient = await db;
    Map<String, dynamic> favorite = {};
    favorite['itemId'] = product.id;
    favorite['category'] = product.category;
    await dbClient.insert(
      "$favoriteTable",
      favorite,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> removeFavorite(Item favorites) async {
    var dbClient = await db;
    int res = await dbClient.rawDelete(
        'DELETE FROM $favoriteTable WHERE itemId = ? AND category = ?',
        [favorites.id, favorites.category]);
    return res;
  }

  Future<List<Item>> isFavoriteItem(Item item) async {
    final Database dbClient = await db;

    final List<Map<String, dynamic>> maps = await dbClient.query(favoriteTable,
        where: 'itemId = ?', whereArgs: <int>[item.id], limit: 1);
    return List.generate(maps.length, (i) {
      return Item.fromJson(maps[i]);
    });
  }

  deleteTables(db) async {
    final Database dbClient = db;
    await dbClient.execute('DROP TABLE $productsTable');
  }
}
