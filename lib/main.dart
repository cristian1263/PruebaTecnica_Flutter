import 'package:flutter/material.dart';
import 'principal.dart';
import 'login.dart';
import 'registro.dart';
import 'RegExi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // Tus configuraciones de tema aquí
          ),
      initialRoute: '/',
      routes: {
        '/': (context) => const VisPrincipal(),
        '/Login': (context) => const VisLogin(),
        '/Registro': (context) => const Registro(),
        '/RegExi': (context) => const VisRegExi(),
      },
    );
  }
}
