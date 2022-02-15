import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 50,
              ),
              child: const Image(
                width: 150,
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              ),
            ),
            SizedBox(
              width: 350,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.g_mobiledata,
                  color: Colors.white,
                  // size: 50,
                ),
                label: const Text(
                  'Continuar con Google',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
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
            SizedBox(
              width: 350,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.facebook,
                  color: Colors.white,
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
            SizedBox(
              width: 350,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.email,
                  color: Color(0xff64686f),
                ),
                label: const Text(
                  'Registrarse con e-mail',
                  style: TextStyle(
                    color: Color(0xff64686f),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.black12,
                  side: const BorderSide(
                    color: Color(0xff64686f),
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
            Column(
              children: [
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Entrar como invitado',
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
                ),
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Entrar como vendedor',
                      style: TextStyle(
                        color: Color(0xff76aa77),
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
                ),
              ],
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
                )),
          ],
        )),
      ),
    );
  }
}
