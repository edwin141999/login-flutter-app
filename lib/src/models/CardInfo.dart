import 'package:flutter/material.dart';

class CardInfo {
  final String image, title, description;
  final int id;
  CardInfo({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });
}

List<CardInfo> cards = [
  CardInfo(
    id: 1,
    image: 'assets/images/adebio.jpg',
    title: 'adebio',
    description: 'lorem ipsum',
  ),
  CardInfo(
    id: 2,
    image: 'assets/images/agromycin.png',
    title: 'agromycin',
    description: 'lorem ipsum',
  ),
  CardInfo(
    id: 3,
    image: 'assets/images/alin.webp',
    title: 'alin',
    description: 'lorem ipsum',
  ),
  CardInfo(
    id: 4,
    image: 'assets/images/fortipen.jpg',
    title: 'fortipen',
    description: 'lorem ipsum',
  ),
  CardInfo(
    id: 5,
    image: 'assets/images/liquamox.png',
    title: 'liquamox',
    description: 'lorem ipsum',
  ),
  CardInfo(
    id: 6,
    image: 'assets/images/maxbiocide.png',
    title: 'maxbiocide',
    description: 'lorem ipsum',
  ),
  CardInfo(
    id: 7,
    image: 'assets/images/scalibor.jpg',
    title: 'scalibor',
    description: 'lorem ipsum',
  ),
  CardInfo(
    id: 8,
    image: 'assets/images/trucid.png',
    title: 'trucid',
    description: 'lorem ipsum',
  ),
  CardInfo(
    id: 9,
    image: 'assets/images/vetactin.jpg',
    title: 'vetactin',
    description: 'lorem ipsum',
  ),
];
