import 'package:flutter/material.dart';
import 'dart:ui';

class VisRegExi extends StatefulWidget {
  const VisRegExi({super.key});

  @override
  State<VisRegExi> createState() => _VisRegExiState();
}

class _VisRegExiState extends State<VisRegExi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset('assets/img/Ellipse.png'),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 1.0),
                child: Container(
                  width: 600,
                  color: const Color.fromARGB(255, 84, 40, 241)
                      .withOpacity(0.000001),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 180,
                ),
                //IMAGEN
                Center(
                  child: Container(
                    height: 150, // Ajusta la posición
                    width: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/Group69.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Titulo
                const Center(
                  child: Text(
                    "Registro exitoso",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "SansPro",
                        fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Frase de hoja
                const Center(
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Hemos guardado tus credenciales de forma exitosa, Presiona continuar para seguir adelante.",
                      style: TextStyle(
                          color: Color.fromARGB(255, 145, 161, 178),
                          fontFamily: "SansPro",
                          fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 84, 40, 241),
                      minimumSize: const Size(358, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Continuar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
