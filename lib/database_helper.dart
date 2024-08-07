import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dataentry.dart';

class DatabaseHelper {
  static final _databaseName = "DataEntry.db";
  static final _databaseVersion = 1;

  static final table = 'entries';

  static final columnId = 'id';
  static final columnType = 'type';
  static final columnLiters = 'liters';
  static final columnDateTime = 'dateTime';
  static final columnRemarks = 'remarks';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnType TEXT NOT NULL,
        $columnLiters REAL NOT NULL,
        $columnDateTime TEXT NOT NULL,
        $columnRemarks TEXT
      )
    ''');
  }

  Future<int> insertDataEntry(DataEntry entry) async {
    Database db = await database;
    return await db.insert(table, entry.toMap());
  }

  Future<List<DataEntry>> getDataEntries() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) {
      return DataEntry(
        id: maps[i][columnId],
        type: maps[i][columnType],
        liters: maps[i][columnLiters],
        dateTime: maps[i][columnDateTime],
        remarks: maps[i][columnRemarks],
      );
    });
  }
}
