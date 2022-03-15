import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/home_page.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _passwordVisible = false;
  int val = -1;

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
          onPressed: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            )
          },
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
      backgroundColor: ColorSelect.btnBackgroundBo1,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                'Crea una cuenta para empezar a usar la app',
                style: TextStyle(
                  color: ColorSelect.btnTextBo1,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
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
                            color: ColorSelect.btnTextBo1,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 22,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Nombre completo',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(
                  width: 340,
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Correo electronico',
                          style: TextStyle(
                            color: ColorSelect.btnTextBo1,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 22,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              hintText: 'Direccion de correo'),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10.0)),
                SizedBox(
                  width: 340,
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Contraseña',
                          style: TextStyle(
                            color: ColorSelect.btnTextBo1,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: TextFormField(
                          obscureText: !_passwordVisible,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 22,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Contraseña',
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: const Text(
                          'La contraseña debe contener caracteres, numeros y simbolos con un minimo de 8 caracteres',
                          style: TextStyle(
                            color: ColorSelect.txtBoSubHe,
                            fontSize: 13,
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
                              text:
                                  'terminos y condiciones y la rpolitica de privacidad',
                              style:
                                  TextStyle(color: ColorSelect.paginatorNext))
                        ]),
                  ),
                  leading: Radio(
                    value: 0,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value as int;
                      });
                    },
                    activeColor: ColorSelect.txtBoHe,
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            Container(
              width: 350,
              height: 50,
              // margin: const EdgeInsets.only(top: 150),
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
                  'Crear cuenta',
                  style: TextStyle(
                    color: ColorSelect.btnTextBo2,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              // height: 48,
              child: Row(
                children: [
                  const Text(
                    '¿Ya tienes una cuenta?',
                    style: TextStyle(
                      color: Color(0xff64686f),
                      fontSize: 14,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Iniciar sesion',
                      style: TextStyle(
                        color: Color(0xfffc1460),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.black12,
                      textStyle: const TextStyle(fontSize: 20),
                      side: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
