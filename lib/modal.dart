// import 'dart:io';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

List<Map<String, String>> data = [
  {'title': 'tt init', 'subtitle': 'st'}
];

// class DBProvider {
//   DBProvider._();
//   static final DBProvider db = DBProvider._();

//   static Database _database;
//   Future<Database> get database async {
//     if (_database != null) return _database;
//     // if _database is null we instantiate it
//     _database = await initDB();
//     return _database;
//   }

//   initDB() async {
//     print('aaaa');
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     print(documentsDirectory);
//     String path = join(documentsDirectory.path, "TestDB.db");
//     print(path);
//   //   return await openDatabase(path, version: 1, onOpen: (db) {},
//   //       onCreate: (Database db, int version) async {
//   //     await db.execute("CREATE TABLE Startup ("
//   //         "id INTEGER PRIMARY KEY,"
//   //         "name TEXT,"
//   //         "description TEXT"
//   //         ")");
//   //     newStartup('Sling Hub', 'A maior!');
//   //   });
//   // }

//   newStartup(String name, String description) async {
//     final db = await database;
//     var res =
//         await db.insert("Startup", {name: name, description: description});
//     return res;
//   }

//   getStartups() async {
//     final db = await database;
//     // var res = await db.query("Startup");
//     // return res.toList();
//   }
// }
