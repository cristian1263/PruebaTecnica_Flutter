import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController cntNombre = TextEditingController();
  TextEditingController cntIdent = TextEditingController();
  TextEditingController cntEmail = TextEditingController();
  TextEditingController cntContra = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 80,
              right: 84,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Logo
                  Container(
                    height: 45,
                    width: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/spinner-two.png'),
                      ),
                    ),
                  ),
                  //Nombre de la empresa
                  Container(
                      child: const Text(
                    'Banca créditos',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ProductSans',
                      fontSize: 28,
                    ),
                  )),
                ],
              ),
            ),
            Positioned(
              top: 130,
              right: 140,
              child: Column(children: [
                //Titulo De Hoja

                Container(
                    width: 130,
                    child: const Text(
                      'Regístrate',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'ProductSans',
                        fontSize: 25,
                      ),
                    )),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
