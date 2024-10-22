import 'package:sqflite/sqflite.dart';

class BaseDatos {
  static Future<void> crearTabla(Database db) async {
    await db.execute("""
CREATE TABLE usuarios
id INTEGER PRIMARY KEY AUTOINCREMENT,
Nombre TEXT,
Identificacion NUMBER,
Email TEXT,
Password  TEXT
""");
  }

  static Future<Database> db() async {
    return openDatabase('Usuarios.db', version: 1,
        onCreate: ((database, version) async {
      await crearTabla(database);
    }));
  }

  static Future<int> RegUser(
      String Nombre, int Id, String Email, String Password) async {
    final con = await db();
    final datos = {
      "Nombre": Nombre,
      "Identificacion": Id,
      "Email": Email,
      "Password": Password
    };
    final id = await con.insert("usuarios", datos);
    return id;
  }
}
