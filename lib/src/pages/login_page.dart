import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/recover_password_page.dart';
import 'package:login_flutter/src/pages/register_page.dart';
import 'package:login_flutter/src/pages/home/home_screen.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

//SERVER
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

AlertDialog getAlertDialog(title, content, ctx) {
  return AlertDialog(
    title: const Text("Login failed"),
    content: Text('$content'),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(ctx).pop();
        },
        child: const Text('Close'),
      )
    ],
  );
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginData {
  String email = '';
  String password = '';
}

class UserData extends _LoginData {
  String token = '';
  String username = '';
  // late int id;

  void addData(Map<String, dynamic> responseMap) {
    // id = responseMap["id"];
    username = responseMap["email"];
    token = responseMap["token"];
  }
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserData userData = UserData();

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      login();
    }
  }

  Future<void> login() async {
    var url = Uri.parse('http://192.168.100.13:4000/users/authenticate');
    return await Future.delayed(
      const Duration(seconds: 2),
      () => {
        http.post(
          url,
          body: {
            'email': userData.email,
            'password': base64Encode(userData.password.codeUnits)
          },
        ).then((response) {
          Map<String, dynamic> responseMap = json.decode(response.body);
          // print(responseMap);
          // print(response.statusCode);
          if (response.statusCode == 200) {
            // userData.addData(responseMap);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserPage(),
              ),
            );
          } else {
            if (responseMap.containsKey("message")) {
              showDialog(
                  context: context,
                  builder: (ctx) => getAlertDialog(
                      "Login failed", '${responseMap["message"]}', ctx));
            }
          }
        }).catchError((err) {
          showDialog(
              context: context,
              builder: (ctx) =>
                  getAlertDialog("Login failed", err.toString(), ctx));
        })
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            child: Image.asset(
              'assets/images/splash.png',
              color: Colors.white,
            ),
            color: Colors.transparent,
          )
        ],
      ),
      backgroundColor: ColorSelect.btnBackgroundBo1,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 35, horizontal: 0),
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
                                  keyboardType: TextInputType.emailAddress,
                                  textAlignVertical: TextAlignVertical.center,
                                  onSaved: (value) {
                                    userData.email = value!;
                                  },
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
                                  onSaved: (value) =>
                                      {userData.password = value!},
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
                      // onPressed: () => {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => const UserPage()))
                      // },
                      onPressed: submit,
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
                                      builder: (context) =>
                                          const RegisterPage(),
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
      ),
    );
  }
}
