import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> createItem(Note note) async {
   // int result = 0;
    final Database db = await initializeDB();
    final id = await db.insert('Notes', note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

//  Future<List<Note>> getItems() async {
//     final db = await SqliteService.initizateDb();
//     final List<Map<String, Object?>> queryResult =
//       await db.query('Notes', orderBy: Note.createdAt);
//     return queryResult.map((e) => Note.fromMap(e)).toList();
//   }
}

class Note {
  final int id;
  final String description;

  Note({required this.id, required this.description});

  Note.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        description = item["description"];

  Map<String, Object> toMap() {
    return {'id': id, 'description': description};
  }
}
