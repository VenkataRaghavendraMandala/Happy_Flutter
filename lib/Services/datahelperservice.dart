// ignore: unused_import
import 'dart:io';

// ignore: unused_import
import 'package:path_provider/path_provider.dart';
// ignore: unused_import
import 'package:sqflite/sqflite.dart';
// ignore: unused_import
import 'package:sqflite/sqlite_api.dart';

class DataHelperService {
  String tablename = "datadetailstable";
  String id = "id";
  String title = "title";
  String description = "description";
  String status = "status";
  String date = "date";

  DataHelperService._createInstance();
  static final DataHelperService _dataHelperService =
      DataHelperService._createInstance();

  getDatabaseHelper() {
    return _dataHelperService;
  }

  //Database database;

  // createPath() {
  //   Future<String> directory = getDatabasesPath();
  //   String path = "${directory}datadetailsdatabase.db";
  //   openDatabase(path);
  // }

  // createDataBase(Database database, int version) async {
  //   return await database.execute(
  //       "CREATE TABLE $tablename ($id INTEGER PRIMARY KEY AUTOINCREMENT , $title TEXT, $description TEXT, $status TEXT, $date TEXT) ");
  // }
}
