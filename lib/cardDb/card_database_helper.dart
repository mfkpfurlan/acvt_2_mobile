import "dart:io";
import 'package:actv2_form/cardDb/card.dart';
import "package:sqflite/sqflite.dart";
import "package:path_provider/path_provider.dart";


class DatabaseHelper {
  //instance
  DatabaseHelper._createInstance();
  static DatabaseHelper helper = DatabaseHelper._createInstance();
  static Database _database;

  //table name and columns
  String cardTable = "card_table";
  String colId = "id";
  String colName = "name";
  String colNumber = "number";
  String colExpireOn = "expireOn";
  String colCcv = "ccv";

  //load/get db
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  //initialize
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "cards.db";

    var cardsDatabase = await openDatabase(path, version: 1, onCreate: _createDb);

    return cardsDatabase;
  }

  //create table
  _createDb(Database db, int newVersion) async {
    await db.execute(
      "CREATE TABLE $cardTable ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName text, $colNumber INTEGER, $colExpireOn text, $colCcv INTEGER)"
      );
  }

  //insert obj
  insertCard(Card card) async {
    Database db = await this.database;
    // var result = await db.rawInsert("INSERT ...");
    var result = await db.insert(cardTable, card.toMap());
    return result;
  }

  //select all
  getCardMapList() async {
    Database db = await this.database;
    var result = await db.rawQuery(
      "SELECT * FROM $cardTable ORDER BY $colName ASC"
    );
    return result;
  }

  //get all
  getCardList() async {
    var cardMapList = await getCardMapList();
    int count = cardMapList.length;
    List<Card> cardList = List<Card>();

    for (int i = 0; i < count; i++) {
      cardList.add(Card.fromMap(cardMapList[i]));
    }
    return cardList;
  }

  //update set on
  updateCard(Card card) async {
    Database db = await this.database;
    // var result = await db.rawUpdate("...");
    var result = await db.update(
      cardTable, card.toMap(), 
      where: "$colId = ?", 
      whereArgs: [card.id]
    );
    return result;
  }

  //delete from where
  deleteCard(int id) async {
    Database db = await this.database;
    int result = await db.rawDelete(
      "DELETE FROM $cardTable WHERE $colId = $id"
    );
    // var result = await db.delete(...);
    return result;
  }

  //count
  getCount() async {
    Database db = await this.database;
    var count = await db.rawQuery("SELECT COUNT(*) FROM $cardTable");
    int result = Sqflite.firstIntValue(count);
    return result;
  }
}