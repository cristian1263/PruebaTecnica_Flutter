import 'package:flutter/material.dart';

class VisPrincipal extends StatefulWidget {
  const VisPrincipal({super.key});

  @override
  State<VisPrincipal> createState() => _VisPrincipalState();
}

class _VisPrincipalState extends State<VisPrincipal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/Rectangle3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                  bottom: 40,
                  left: 20,
                  child: Column(
                    children: [
                      Container(
                          height: 110,
                          width: 372,
                          child: const Text(
                            'Accede a créditos con un solo toque y sin complicaciones.',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins-Regular',
                              fontSize: 28,
                            ),
                          )),
                      /////////////////
                      Container(height: 50),
                      ////////////////////
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(358, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Ingresar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'SourceSansPro-Bold',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      /////////////////////
                      Container(height: 5),
                      ////////////////////
                      Container(
                        margin: const EdgeInsets.only(top: 3.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Registro');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 84, 40, 241),
                            minimumSize: const Size(358, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Registrarme',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'SourceSansPro-Bold',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              /////////////////////
            ],
          ),
        ),
      ),
    );
  }
}
