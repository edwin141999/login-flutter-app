import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/login/login_screen.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

//SERVER
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

AlertDialog getAlertDialog(title, content, ctx) {
  return AlertDialog(
    title: Text('$title'),
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

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterData {
  String name = '';
  String email = '';
  String password = '';
}

class UserRegisterData extends _RegisterData {}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordVisible = false;
  int val = -1;
  bool _pressed = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserRegisterData registerData = UserRegisterData();

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      register();
    }
  }

  Future<void> register() async {
    // var url = Uri.parse('http://192.168.100.13:4000/users/register');
    var url = Uri.parse('http://172.20.10.8:4000/users/register');
    // var url = Uri.parse('http://192.168.111.110:4000/users/register');
    return await Future.delayed(
        const Duration(seconds: 2),
        () => {
              http.post(
                url,
                body: {
                  'name': registerData.name,
                  "email": registerData.email,
                  "password": base64Encode(registerData.password.codeUnits)
                },
              ).then((response) {
                Map<String, dynamic> responseMap = jsonDecode(response.body);
                if (response.statusCode == 200) {
                  showDialog(
                    context: context,
                    builder: (ctx) => getAlertDialog("Successful registration",
                        "You account has been registered", ctx),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                } else {
                  if (responseMap.containsKey("message")) {
                    showDialog(
                        context: context,
                        builder: (ctx) => getAlertDialog("Register failed",
                            '${responseMap["message"]}', ctx));
                  }
                }
              }).catchError((err) {
                showDialog(
                  context: context,
                  builder: (ctx) =>
                      getAlertDialog("Register failed", err.toString(), ctx),
                );
              }),
            });
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrate'),
        backgroundColor: ColorSelect.txtBoHe,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: ColorSelect.paginatorNext,
          onPressed: () => {Navigator.pop(context)},
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 25),
                child: Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 18),
                      child: Text(
                        'Crea una cuenta para empezar a usar la app',
                        style: TextStyle(
                          color: ColorSelect.btnTextBo1,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 340,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Nombre',
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
                            onSaved: (value) {
                              registerData.name = value!;
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 20),
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
                              hintText: 'Nombre completo',
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 25)),
                      ],
                    ),
                  ),
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
                            onSaved: (value) => {registerData.email = value!},
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 20),
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
                                hintText: 'Direccion de correo'),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 20)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 340,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Contrase??a',
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
                                {registerData.password = value!},
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 20),
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
                              hintText: 'Contrase??a',
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
                        Container(
                          margin: const EdgeInsets.only(
                              top: 15, left: 12, right: 0, bottom: 20),
                          height: 30,
                          child: const Text(
                            'La contrase??a debe contener caracteres, numeros y simbolos con un minimo de 8 caracteres',
                            style: TextStyle(
                              color: Color.fromARGB(239, 189, 189, 189),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Al registrarme, acepto los ',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: 'terminos y condiciones ',
                              style:
                                  TextStyle(color: ColorSelect.paginatorNext)),
                          TextSpan(
                              text: 'y la ',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: 'politica de privacidad',
                              style:
                                  TextStyle(color: ColorSelect.paginatorNext)),
                        ],
                      ),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _pressed = !_pressed;
                          });
                        },
                        child: _pressed
                            ? const Icon(
                                Icons.radio_button_checked,
                                color: ColorSelect.txtBoHe,
                                size: 20,
                              )
                            : const Icon(
                                Icons.radio_button_unchecked,
                                color: Colors.grey,
                                size: 20,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 75)),
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
                        'Crear cuenta',
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
                              text: '??Ya tienes una cuenta? ',
                              style: TextStyle(color: ColorSelect.txtBoSubHe)),
                          TextSpan(
                            text: 'Iniciar Sesion',
                            style: const TextStyle(
                              color: ColorSelect.paginatorNext,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  ),
                          ),
                        ]),
                  ),
                  // const Padding(padding: EdgeInsets.only(bottom: 20)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
