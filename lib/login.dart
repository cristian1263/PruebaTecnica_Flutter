import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class VisLogin extends StatefulWidget {
  const VisLogin({super.key});

  @override
  State<VisLogin> createState() => _VisLoginState();
}

class _VisLoginState extends State<VisLogin> {
  TextEditingController cntpersona = TextEditingController();
  TextEditingController cntContra = TextEditingController();
  bool isObscure = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Stack(children: [
              SingleChildScrollView(
                  physics:
                      BouncingScrollPhysics(), // Para un mejor desplazamiento
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      child: Form(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Logo
                                Container(
                                  height: 45,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/img/spinner-two.png'),
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
                              //Fin de la fila
                            ),
                            Container(
                              height: 15,
                            ),
                            //Texto de detalle
                            SizedBox(
                              width: 310,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  text:
                                      '', // Texto inicial vacío si no quieres contenido antes
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16), // Estilo general del texto
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          'Inicia sesión o continua', // Parte en negrita
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily:
                                              'ProductSans'), // Aquí aplicas negrita
                                    ),
                                    TextSpan(
                                      text:
                                          ' , solo te tomará unos minutos.', // Parte normal
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily:
                                              'ProductSans'), // Estilo normal
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                            ),
                            //Titulo de Usuario
                            Container(
                                width: 335,
                                child: const Text(
                                  'Email or Usuario',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 128, 138, 147),
                                    fontFamily: 'Product Sans Bold',
                                    fontSize: 14,
                                  ),
                                )),
                            Container(
                              height: 5,
                            ),
                            buildPersona(
                              "Uname@mail.com",
                              cntpersona,
                              TextInputType.emailAddress,
                            ),
                            Container(
                              height: 10,
                            ),
                            //Titulo de Contraseña
                            Container(
                                width: 335,
                                child: const Text(
                                  'Contraseña',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 128, 138, 147),
                                    fontFamily: 'Product Sans Bold',
                                    fontSize: 14,
                                  ),
                                )),
                            Container(
                              height: 5,
                            ),
                            buildContra(
                              "Password",
                              cntContra,
                              TextInputType.visiblePassword,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  //Checkbox
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Checkbox(
                                        checkColor: Colors.black,
                                        activeColor:
                                            Color.fromARGB(255, 251, 188, 5),
                                        value: isChecked,
                                        side: BorderSide(width: 1),
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        },
                                      )),

                                      // Textro de Politicas de privacidad
                                      Container(
                                          width: 130,
                                          child: const Text(
                                            'Recordarme',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'ProductSans',
                                              fontSize: 14,
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                      child: GestureDetector(
                                    onTap: () {
                                      // Navegas a la pantalla de inicio de sesión
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyApp()),
                                      );
                                    },
                                    child: const Text(
                                      '¿Olvide mi contraseña?',
                                      style: TextStyle(
                                        fontFamily: 'ProductSans',
                                        color: Color.fromARGB(255, 84, 40,
                                            241), // Color del texto
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 3.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '');
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
                                  'Iniciar sesión',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //Linea de separacion
                            Container(
                              color: Colors.white,
                              child: SizedBox(
                                width: 328,
                                height: 15,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      width: 149,
                                      top: 12,
                                      height: 1,
                                      child: Container(
                                        width: 149,
                                        height: 1,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffc8d0d9),
                                              width: 1),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 179,
                                      width: 149,
                                      top: 12,
                                      height: 1,
                                      child: Container(
                                        width: 149,
                                        height: 1,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffc8d0d9),
                                              width: 1),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      left: 159,
                                      top: 2,
                                      child: Text(
                                        'O',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 12,
                                            color: const Color(0xffa0a7ae),
                                            fontFamily: 'ProductSans-Regular',
                                            fontWeight: FontWeight.normal),
                                        maxLines: 9999,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //Boton de google
                            SizedBox(
                              width: 340,
                              //margin: const EdgeInsets.only(top: 10.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  // Ajusta el padding
                                  minimumSize: const Size(200, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                          color: Color.fromARGB(255, 177, 181,
                                              187), // Color del borde
                                          width: 1)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Centra el contenido
                                  children: [
                                    // Imagen al lado del texto
                                    Image.asset(
                                      'assets/img/Logo.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(
                                        width:
                                            8), // Espacio entre la imagen y el texto
                                    const Text(
                                      'Ingresa con Google',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //Boton de Apple
                            SizedBox(
                              width: 340,
                              //margin: const EdgeInsets.only(top: 10.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: const Size(300, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                          color: Color.fromARGB(255, 177, 181,
                                              187), // Color del borde
                                          width: 1)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Centra el contenido
                                  children: [
                                    // Imagen al lado del texto
                                    Image.asset(
                                      'assets/img/Logo2.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(
                                        width:
                                            8), // Espacio entre la imagen y el texto
                                    const Text(
                                      'Ingresa con Apple',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(height: 30),
                            RichText(
                              text: TextSpan(
                                text:
                                    '¿No tienes una cuenta? ', // Texto normal no clicable
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                children: [
                                  TextSpan(
                                    text: 'Regístrate', // Parte clicable
                                    style: const TextStyle(
                                      color: const Color.fromARGB(
                                          255, 84, 40, 241),
                                      //Color para el texto clicable
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Aquí navegas a la pantalla de inicio de sesión
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const VisLogin()),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ]))))
            ])));
  }

  Widget buildPersona(String label, TextEditingController controller,
      TextInputType keyboardType) {
    return Container(
      width: 335,
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 2),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 200, 208, 217), width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                  color: Color.fromARGB(255, 200, 208, 217), width: 1)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 177, 181, 187),
            fontFamily: "Product Sans Bold",
            fontSize: 14,
          ),
          prefixIcon: const Icon(
            Icons.person_outline_sharp,
            color: Color.fromARGB(255, 177, 181, 187),
          ),
        ),
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "ProductSans",
        ),
        validator: (value) {
          if (!RegExp(r'^[\w-\.]+@([\w]+\.)+^[\w-]{2,4}').hasMatch(value!)) {
            return "Ingrese correctamente el usuario";
          } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
            return "Ingrese correctamente el usuario";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget buildContra(String label, TextEditingController controller,
      TextInputType keyboardType) {
    return Container(
      width: 335,
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: SizedBox(
        child: TextFormField(
          obscureText: isObscure,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 200, 208, 217), width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 200, 208, 217), width: 1)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            filled: true,
            fillColor: Colors.white,
            hintText: label,
            hintStyle: const TextStyle(
              color: Color.fromARGB(255, 177, 181, 187),
              fontFamily: "Product Sans Bold",
              fontSize: 14,
            ),
            prefixIcon: const Icon(
              Icons.lock_outline_rounded,
              color: Color.fromARGB(255, 177, 181, 187),
            ),
          ),
        ),
      ),
    );
  }
}
