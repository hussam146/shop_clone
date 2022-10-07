
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/cart_model.dart';
import '../../shared/components/const.dart';

class DataBaseHelper {
  DataBaseHelper._();
  static final DataBaseHelper db = DataBaseHelper._();
  static Database? _database;

  Future<Database> get database  async{
    if(_database != null)
    {
      return _database!;
    }

    _database = await init();
    return _database!;
  }

  init() async
  {
    String path = join(await getDatabasesPath(), '$table.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async
      {
        await db.execute('CREATE TABLE $table($name TEXT NOT NULL, $image TEXT NOT NULL, $price TEXT NOT NULL, $amount INTEGER NOT NULL, $id TEXT NOT NULL)');
      },
    );
  }

  addToCart(CartModel? model) async
  {
    var dbUtil = await database;
    await dbUtil.insert(
        table,
        model!.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<CartModel>> getAllData() async
  {
    var dbUtil = await database;
    List<Map<String, Object?>> map = await dbUtil.query(table);
    List<CartModel> list = map.map((e) => CartModel.fromJson(e)).toList();
    return list;
  }


  updateData(CartModel model) async
  {
    var dbUtil = await database;
    return await dbUtil.update(table, model.toMap(), where: '$id = ?', whereArgs: [model.id]);
  }

  deleteData(CartModel model) async
  {
    var dbUtil = await database;
    await dbUtil.delete(table,  where: '$id = ?', whereArgs: [model.id]);
  }

}