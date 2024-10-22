import 'package:sqflite/sqflite.dart';

class BaseDatos {
  static Future<void> crearTabla(Database db) async {
    await db.execute("""
    CREATE TABLE usuarios (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      Nombre TEXT,
      Identificacion INTEGER,
      Email TEXT,
      Password TEXT
    )
  """);
  }

  static Future<Database> db() async {
    return openDatabase('usuarios.db', version: 1,
        onCreate: ((database, version) async {
      await crearTabla(database);
    }));
  }

  static Future<int> RegUser(
      String nombre, int id, String email, String password) async {
    final con = await db();
    final datos = {
      "Nombre": nombre,
      "Identificacion": id,
      "Email": email,
      "Password": password
    };
    final idInsertado = await con.insert("usuarios", datos);
    return idInsertado;
  }

  static Future<int> IniciarSesion(String usuario, String password) async {
    final con = await db();
    try {
      final List<Map<String, dynamic>> resultado = await con.query(
        "usuarios",
        where: "(Nombre = ? OR Email = ?) AND Password = ?",
        whereArgs: [usuario, usuario, password],
      );

      if (resultado.isNotEmpty) {
        return resultado.first['Id'] as int;
      } else {
        return 0;
      }
    } catch (e) {
      print("Error al iniciar sesión: $e");
      return 0;
    }
  }
}
