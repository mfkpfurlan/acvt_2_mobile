// import 'dart:io';

// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// import 'note.dart';

// class DatabaseHelper {
//   static DatabaseHelper helper = DatabaseHelper._createInstance();
//   static Database _database;

//   String noteTable = "note_table";
//   String colId = "id";
//   String colTitle = "title";
//   String colDescription = "description";
//   String colPriority = "priority";

//   DatabaseHelper._createInstance();

//   Future<Database> get database async {
//     if (_database == null) {
//       _database = await initializeDatabase();
//     }
//     return _database;
//   }

//   /* Criando o arquivo no sistema de arquivos */
//   Future<Database> initializeDatabase() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = directory.path + "notes.db";

//     var notesDatabase =
//         await openDatabase(path, version: 1, onCreate: _createDb);

//     return notesDatabase;
//   }

//   _createDb(Database db, int newVersion) async {
//     await db.execute(
//         "CREATE TABLE $noteTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle text, $colDescription text, $colPriority INTEGER)");
//   }

//   insertNote(Note note) async {
//     Database db = await this.database;
//     //var result = await db.rawInsert("INSERT ...");
//     var result = await db.insert(noteTable, note.toMap());
//     return result;
//   }

//   getNoteMapList() async {
//     Database db = await this.database;
//     var result =
//         await db.rawQuery("SELECT * FROM $noteTable ORDER BY $colPriority ASC");
//     return result;
//   }

//   getNoteList() async {
//     var noteMapList = await getNoteMapList();
//     int count = noteMapList.length;
//     List<Note> noteList = List<Note>();

//     for (int i = 0; i < count; i++) {
//       noteList.add(Note.fromMap(noteMapList[i]));
//     }
//     return noteList;
//   }

//   updateNote(Note note) async {
//     Database db = await this.database;
//     var result = await db.update(noteTable, note.toMap(),
//         where: "$colId = ?", whereArgs: [note.id]);
//     // var result = await db.rawUpdate("...");
//     return result;
//   }

//   deleteNote(int id) async {
//     Database db = await this.database;
//     int result =
//         await db.rawDelete("DELETE FROM $noteTable WHERE $colId = $id");
//     // var result = await db.delete(...);
//     return result;
//   }

//   getCount() async {
//     Database db = await this.database;
//     var x = await db.rawQuery("SELECT COUNT(*) FROM $noteTable");
//     int result = Sqflite.firstIntValue(x);
//     return result;
//   }
// }
