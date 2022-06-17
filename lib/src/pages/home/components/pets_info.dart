import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/BannerInfo.dart';
import 'package:login_flutter/src/models/CardInfo.dart';
import 'package:login_flutter/src/pages/home/components/gridcard.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

// SERVER
import 'package:http/http.dart' as http;
import 'dart:convert';

class PetsInfo extends StatefulWidget {
  const PetsInfo({Key? key}) : super(key: key);

  @override
  State<PetsInfo> createState() => _PetsInfoState();
}

class _PetsInfoState extends State<PetsInfo> {
  late PageController _pageController;
  Timer? _timer;

  int activePage = 0;
  int activeInitialPage = 999;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8, initialPage: 999);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      activeInitialPage++;
      _pageController.animateToPage(activeInitialPage,
          duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
    });
    getBanners().then((value) {
      setState(() {
        bannerUrl.addAll(value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  List<BannerInfo> bannerUrl = [];

  Future<List<BannerInfo>> getBanners() async {
    var url =
        Uri.parse('http://desarrollovan-tis.dedyn.io:4030/GetImagesCarousel');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'idChannel': '1'}),
    );
    List<BannerInfo> banners = [];
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body)["dtoImageCarousels"];
      for (var item in responseMap) {
        banners.add(BannerInfo(dtoImageCarousels: [
          DtoImageCarousel(
            url: item["url"],
            accion: item["accion"],
            nombre: item["nombre"],
          ),
        ]));
      }
    }
    return banners;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mis mascotas',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                MaterialButton(
                  onPressed: () {},
                  color: const Color.fromRGBO(242, 242, 242, 1),
                  textColor: const Color.fromRGBO(203, 203, 203, 1),
                  elevation: 0,
                  child: const Icon(
                    Icons.add,
                    size: 45,
                  ),
                  padding: const EdgeInsets.all(10),
                  minWidth: 0,
                  shape: const CircleBorder(),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: 70,
                    child: Text(
                      'Agregar Mascota',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(139, 139, 139, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            height: 220,
            child: ListView.builder(
              itemCount: cards.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GridCard(
                  card: cards[index],
                );
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 312,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(242, 242, 242, 1),
              ),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Color.fromRGBO(203, 203, 203, 1),
                      size: 30,
                    ),
                    hintText: 'Buscar productos o servcios..',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(139, 139, 139, 1),
                    ),
                    contentPadding: EdgeInsets.only(left: 15, top: 5),
                  ),
                ),
              ),
            ),
            // MaterialButton(
            //   onPressed: () {},
            //   color: ColorSelect.paginatorNext,
            //   textColor: Colors.white,
            //   elevation: 0,
            //   child: const Icon(
            //     Icons.settings,
            //     size: 20,
            //   ),
            //   padding: const EdgeInsets.all(10),
            //   minWidth: 0,
            //   shape: const CircleBorder(),
            // ),
            Image.asset(
              'assets/images/icon_filters.png',
              width: 40,
            ),
          ],
        ),
        if (bannerUrl.isNotEmpty)
          SizedBox(
            height: 185,
            child: PageView.builder(
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  activePage = index % bannerUrl.length;
                });
              },
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInCubic,
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    bannerUrl[index % bannerUrl.length]
                        .dtoImageCarousels[0]
                        .url,
                  ),
                );
              },
            ),
          ),
        if (bannerUrl.isEmpty)
          SizedBox(
            height: 185,
            width: MediaQuery.of(context).size.width,
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
