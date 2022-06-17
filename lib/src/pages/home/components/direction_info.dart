import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class DirectionInfo extends StatefulWidget {
  const DirectionInfo({Key? key}) : super(key: key);

  @override
  State<DirectionInfo> createState() => _DirectionInfoState();
}

class _DirectionInfoState extends State<DirectionInfo> {
  var calles = [
    'Calle 10 9',
    'Calle 11 9',
    'Calle 12 9',
    'Calle 13 9',
    'Calle 14 9',
  ];

  String callesValue = 'Calle 10 9';

  var domicilio = [
    'Entrega a Domicilio',
    'Retiro en Tienda',
  ];

  String domicilioValue = 'Entrega a Domicilio';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.19,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Text(
                    'Hola ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Juan',
                    style: TextStyle(
                      color: ColorSelect.btnBackgroundBo2,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ',',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                width: 65,
                child: Image.asset(
                  'assets/images/splash.png',
                ),
                color: Colors.transparent,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/icon_gps_color.png',
                    height: 32,
                    color: ColorSelect.btnBackgroundBo2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Entregar ahora',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 15,
                        ),
                      ),
                      DropdownButton(
                        value: callesValue,
                        items: calles.map((items) {
                          return DropdownMenuItem(
                            child: Text(items),
                            value: items,
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            callesValue = value!;
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        underline: Container(),
                        isDense: true,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                color: Colors.black12,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                child: DropdownButton(
                  value: domicilioValue,
                  items: domicilio.map((items) {
                    return DropdownMenuItem(
                      child: Text(items),
                      value: items,
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      domicilioValue = value!;
                    });
                  },
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  underline: Container(),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 20,
                  ),
                  isDense: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
