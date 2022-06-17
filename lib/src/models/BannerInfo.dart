import 'package:flutter/cupertino.dart';

class BannerInfo {
  BannerInfo({
    required this.dtoImageCarousels,
  });

  List<DtoImageCarousel> dtoImageCarousels;
}

class DtoImageCarousel {
  DtoImageCarousel({
    required this.url,
    required this.accion,
    required this.nombre,
  });

  String url;
  String accion;
  String nombre;
}