import 'package:flutter/material.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Contraseña'),
        backgroundColor: ColorSelect.txtBoHe,
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: const Icon(Icons.arrow_back)),
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
                      'Ingresa tu email para restablecer tu contraseña',
                      style: TextStyle(
                        color: ColorSelect.btnTextBo1,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
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
                            textAlignVertical: TextAlignVertical.center,
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
                              hintText: 'Direccion de correo',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15),
                          child: const Text(
                            'Ingrese su correo electrónico registrado y le enviaremos un correo electronico que contiene un enlace para restablecer su contraseña.',
                            style: TextStyle(
                              color: ColorSelect.btnTextBo3,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                  'Enviar Solicitud',
                  style: TextStyle(
                    color: ColorSelect.btnTextBo2,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 25)),
          ],
        ),
      ),
    );
  }
}
