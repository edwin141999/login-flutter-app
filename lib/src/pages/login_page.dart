import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/recover_password_page.dart';
import 'package:login_flutter/src/pages/register_page.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sesion'),
        backgroundColor: ColorSelect.txtBoHe,
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          color: ColorSelect.paginatorNext,
          icon: const Icon(Icons.arrow_back),
        ),
        toolbarHeight: 48,
        actions: [
          Container(
            width: 100,
            child: Image.asset('assets/images/splash.png'),
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 35, horizontal: 0),
                    child: const Text(
                      'Inicia sesion con tu cuenta para continuar',
                      style: TextStyle(
                        color: ColorSelect.btnTextBo1,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Column(
                    children: [
                      SizedBox(
                        width: 340,
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Correo electronico',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Container(
                              width: 350,
                              height: 50,
                              margin: const EdgeInsets.only(top: 3),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      width: 1.5,
                                      color: ColorSelect.btnTextBo3,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      width: 1.5,
                                      color: ColorSelect.btnTextBo3,
                                    ),
                                  ),
                                  hintStyle: const TextStyle(
                                    color: ColorSelect.btnTextBo3,
                                  ),
                                  hintText: 'Email Address',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: 340,
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Contraseña',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Container(
                              width: 350,
                              height: 50,
                              margin: const EdgeInsets.only(top: 3),
                              child: TextFormField(
                                obscureText: !_passwordVisible,
                                enableSuggestions: false,
                                autocorrect: false,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      width: 1.5,
                                      color: ColorSelect.btnTextBo3,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      width: 1.5,
                                      color: ColorSelect.btnTextBo3,
                                    ),
                                  ),
                                  hintStyle: const TextStyle(
                                    color: ColorSelect.btnTextBo3,
                                  ),
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(_passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              heightFactor: 1.8,
                              child: RichText(
                                text: TextSpan(
                                  text: '¿Has olvidado tu contraseña?',
                                  style: const TextStyle(
                                    color: ColorSelect.paginatorNext,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RecoverPassword(),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: 350,
                  height: 55,
                  decoration: BoxDecoration(
                    color: ColorSelect.btnBackgroundBo2,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: OutlinedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide.lerp(
                          const BorderSide(style: BorderStyle.none),
                          const BorderSide(style: BorderStyle.none),
                          10.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(
                        color: ColorSelect.btnTextBo2,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                RichText(
                  text: TextSpan(
                      style: const TextStyle(fontSize: 18),
                      children: <TextSpan>[
                        const TextSpan(
                            text: '¿Todavia no tienes una cuenta? ',
                            style: TextStyle(color: ColorSelect.txtBoSubHe)),
                        TextSpan(
                          text: 'Registrate',
                          style: const TextStyle(
                            color: ColorSelect.paginatorNext,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                ),
                        ),
                      ]),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
