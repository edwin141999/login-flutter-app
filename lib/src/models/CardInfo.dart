import 'package:flutter/material.dart';

class CardInfo {
  final String image, title;
  final int id;
  CardInfo({
    required this.id,
    required this.title,
    required this.image,
  });
}

List<CardInfo> cards = [
  CardInfo(
    id: 1,
    image: 'assets/images/B5.png',
    title: 'PRODUCTOS',
  ),
  CardInfo(
    id: 2,
    image: 'assets/images/B1.png',
    title: 'SERVICIOS',
  )
];
