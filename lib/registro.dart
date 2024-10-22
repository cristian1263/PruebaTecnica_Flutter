import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'BD.dart';

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
  bool isObscure = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
                physics:
                    BouncingScrollPhysics(), // Para un mejor desplazamiento
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                          //Titulo De Hoja
                          Container(
                              width: 122,
                              child: const Text(
                                'Regístrate',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: 'ProductSans',
                                  fontSize: 25,
                                ),
                              )),
                          //SubTitulo
                          Container(
                              child: const Text(
                            'Solo te tomará unos minutos.',
                            style: TextStyle(
                              color: Color.fromARGB(255, 145, 161, 178),
                              fontFamily: 'Product Sans Bold',
                              fontSize: 16,
                            ),
                          )),
                          //espacio
                          Container(
                            height: 20,
                          ),
                          //Titulo de Nombre
                          Container(
                              width: 335,
                              child: const Text(
                                'Nombre Completo',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 128, 138, 147),
                                  fontFamily: 'Product Sans Bold',
                                  fontSize: 14,
                                ),
                              )),
                          Container(
                            height: 5,
                          ),
                          buildNombre(
                            "Escribe tu Nombre",
                            cntNombre,
                            TextInputType.text,
                          ),
                          Container(
                            height: 10,
                          ),
                          //Titulo de Identificacion
                          Container(
                              width: 335,
                              child: const Text(
                                'Identificación',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 128, 138, 147),
                                  fontFamily: 'Product Sans Bold',
                                  fontSize: 14,
                                ),
                              )),
                          Container(
                            height: 5,
                          ),
                          buildIdenti(
                            "Escribe tu número de identificación",
                            cntIdent,
                            TextInputType.number,
                          ),
                          Container(
                            height: 10,
                          ),
                          //Titulo de Email
                          Container(
                              width: 335,
                              child: const Text(
                                'Email',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 128, 138, 147),
                                  fontFamily: 'Product Sans Bold',
                                  fontSize: 14,
                                ),
                              )),
                          Container(
                            height: 5,
                          ),
                          buildEmail(
                            "Uname@mail.com",
                            cntEmail,
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
                          Container(
                            height: 10,
                          ),
                          //Inicio de Validacion de politicas
                          Center(
                            child: Row(
                              children: [
                                //Checkbox de politicas
                                Container(
                                    child: Checkbox(
                                  checkColor:
                                      Color.fromARGB(255, 208, 213, 221),
                                  activeColor: Color.fromARGB(255, 84, 40, 241),
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
                                    width: 305,
                                    child: const Text(
                                      'Acepto los Términos y Condiciones y la Política de privacidad de Banca créditos ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Product Sans Bold',
                                        fontSize: 14,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Container(height: 10),
                          //Boton para continuar
                          Container(
                            margin: const EdgeInsets.only(top: 3.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (validarCampos()) {
                                  RegistrarUsuario();
                                  Navigator.pushNamed(context, '/RegExi');
                                }
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
                                'Continuar',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'SourceSansPro-Bold',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Container(height: 20),
                          RichText(
                            text: TextSpan(
                              text:
                                  '¿Ya tienes una cuenta? ', // Texto normal no clicable
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              children: [
                                TextSpan(
                                  text: 'Iniciar sesión', // Parte clicable
                                  style: const TextStyle(
                                    color:
                                        const Color.fromARGB(255, 84, 40, 241),
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
                        ]),
                  ),
                )
                //),
                )
          ],
        ),
      ),
    );
  }

  bool validarCampos() {
    return cntNombre.text.isNotEmpty &&
        cntIdent.text.isNotEmpty &&
        cntEmail.text.isNotEmpty &&
        cntContra.text.isNotEmpty;
  }

  void RegistrarUsuario() async {
    String Nombre = cntNombre.text;
    int Ident = int.parse(cntIdent.text);
    String Email = cntEmail.text;
    String Contra = cntContra.text;
    int resultado = await BaseDatos.RegUser(Nombre, Ident, Email, Contra);
  }

  Widget buildNombre(String label, TextEditingController controller,
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
          if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
            return "Ingrese correctamente el nombre";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget buildIdenti(String label, TextEditingController controller,
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
        ),
        style: const TextStyle(
          color: Colors.black,
          fontFamily: "ProductSans",
        ),
        validator: (value) {
          if (!RegExp(r'^[\d]{1,3}\.?[\d]{3,3}\.?[\d]{3,3}$')
              .hasMatch(value!)) {
            return "Ingrese correctamente su identificación";
          } else {
            return null;
          }
        },
      ),
    );
  }

  Widget buildEmail(String label, TextEditingController controller,
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
            return "Ingrese correctamente su Email";
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
