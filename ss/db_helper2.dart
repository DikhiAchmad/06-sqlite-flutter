// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// import '../models/item.dart';

// class DBHelper {
//   static Database _database;

//   Future<Database> get database async {
//     if (database == null) {
//       database = await initDb();
//     }
//     return database;
//   }

//   Future<Database> initDb() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = directory.path + 'cake.db';

//     var itemDatabase = openDatabase(path, version: 1, onCreate: _createDb);
//     return itemDatabase;
//   }

//   void _createDb(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE item (
//       id INTEGER PRIMARY KEY AUTOINCREMENT,
//       name TEXT,
//       price INTEGER
//       )
//     ''');
//   }

//   Future<List<Map<String, dynamic>>> select() async {
//     Database db = await initDb();
//     var mapList = await db.query('item', orderBy: 'name');
//     return mapList;
//   }

//   Future<int> insert(Item item) async {
//     Database db = await initDb();
//     int id = await db.insert('item', item.toMap());
//     return id;
//   }

//   Future<int> update(Item item) async {
//     Database db = await initDb();
//     int id = await db
//         .update('item', item.toMap(), where: 'id=?', whereArgs: [item.id]);
//     return id;
//   }

//   Future<int> delete(int id) async {
//     Database db = await this.initDb();
//     int idItem = await db.delete('item', where: 'id=?', whereArgs: [id]);
//     return idItem;
//   }

//   Future<List<Item>> getItemList() async {
//     var itemMapList = await select();
//     int count = itemMapList.length;
//     List<Item> itemList = [];
//     for (int i = 0; i < count; i++) {
//       itemList.add(Item.fromMap(itemMapList[i]));
//     }
//     return itemList;
//   }
// }
