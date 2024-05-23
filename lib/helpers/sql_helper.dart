import 'dart:developer';

import 'package:data_base/models/employees.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  Database? db;

  String table = 'employees';

  SqlHelper() {
    init();
  }

  void createTable() async {
    await db!.execute("""
    Create table if not exists names (
      id integer primary key,
      name text not null,
      )
      """);
  }

  Future<void> insertEmployee(Employee employee) async {
    db = await openDatabase(table);
    await db!.insert(table, employee.toMap());
  }

  Future<List<Employee>> getEmployees() async {
    db = await openDatabase(table);
    List<Map<String, Object?>> emp = await db!.query('names');
    return [
      for (final {
            'id': id as int,
            'name': name as String,
          } in emp)
        Employee(id: id, name: name),
    ];
  }

  void init() async {
    try {
      db = await openDatabase(
        'employees.db',
        version: 1,
        onCreate: (db, version) {
          createTable();
        },
      );
    } catch (e) {
      log('error on creating db : $e');
    }
  }
}
