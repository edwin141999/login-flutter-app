import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/login_page.dart';
import 'package:login_flutter/src/pages/register_page.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.btnBackgroundBo1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              //LOGO DE LA APP
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 50,
              ),
              child: Image.asset(
                'assets/images/splash.png',
                width: 150,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  //GOOGLE
                  width: 350,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.g_mobiledata,
                      color: ColorSelect.btnBackgroundBo1,
                    ),
                    label: const Text(
                      'Continuar con Google',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff3169f5),
                      textStyle: const TextStyle(fontSize: 20),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(
                  //FACEBOOK
                  width: 350,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook,
                      color: ColorSelect.btnBackgroundBo1,
                    ),
                    label: const Text(
                      'Continuar con Facebook',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff324fa5),
                      textStyle: const TextStyle(fontSize: 20),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(21.0)),
                SizedBox(
                  //EMAIL
                  width: 350,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () => {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      )
                    },
                    icon: const Icon(
                      Icons.mail,
                      color: ColorSelect.btnTextBo1,
                    ),
                    label: const Text(
                      'Registrarse con e-mail',
                      style: TextStyle(
                        color: ColorSelect.btnTextBo1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: ColorSelect.btnTextBo2, //color primario
                      onPrimary: ColorSelect.btnTextBo1, //color al presionarlo
                      shadowColor: Colors.black12,
                      side: const BorderSide(
                        color: ColorSelect.btnTextBo1,
                        width: 3,
                      ),
                      textStyle: const TextStyle(fontSize: 20),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 350,
                  height: 35,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Entrar como invitado',
                      style: TextStyle(
                        color: ColorSelect.paginatorNext,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.black12,
                      textStyle: const TextStyle(fontSize: 18),
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 35,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Entrar como vendedor',
                      style: TextStyle(
                        color: ColorSelect.btnBackgroundBo2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.black12,
                      textStyle: const TextStyle(fontSize: 18),
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 18),
                children: <TextSpan>[
                  const TextSpan(
                    text: '¿Ya tienes una cuenta? ',
                    style: TextStyle(
                      color: ColorSelect.txtBoSubHe,
                    ),
                  ),
                  TextSpan(
                    text: 'Iniciar Sesion',
                    style: const TextStyle(
                        color: ColorSelect.paginatorNext,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: 350,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const Text(
            //         '¿Ya tienes una cuenta?',
            //         style: TextStyle(
            //           color: Color(0xff64686f),
            //           fontSize: 18,
            //         ),
            //       ),
            //       OutlinedButton(
            //         onPressed: () {
            //           Navigator.pushReplacement(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const LoginPage()),
            //           );
            //         },
            //         child: const Text(
            //           'Iniciar sesion',
            //           style: TextStyle(
            //             color: ColorSelect.paginatorNext,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         style: ElevatedButton.styleFrom(
            //           primary: Colors.transparent,
            //           shadowColor: Colors.black12,
            //           textStyle: const TextStyle(fontSize: 18),
            //           side: const BorderSide(
            //             color: Colors.transparent,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
