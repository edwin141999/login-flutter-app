import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/PetItemInfo.dart';
import 'package:login_flutter/src/models/ProductsInfo.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

// SERVER
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products extends StatelessWidget {
  Future<ProductsInfo> getProducts() async {
    var url = Uri.parse(
        'http://desarrollovan-tis.dedyn.io:4030/GetProductsByIdSeller');
    final resp = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"idSeller": '1'}),
    );
    return productsInfoFromJson(resp.body);
  }

  Future<PetItemInfo> getPets() async {
    var url =
        Uri.parse('http://desarrollovan-tis.dedyn.io:4030/GetPetTaxonomia');
    final resp = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"idChannel": '1'}),
    );
    return petItemInfoFromJson(resp.body);
  }

  const Products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'Productos cerca',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            FutureBuilder(
              future: getPets(),
              builder: (ctx, AsyncSnapshot<PetItemInfo> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return ListButtons(
                    pets: snapshot.data!.dtoPetTaxonomies,
                    primary: ColorSelect.btnBackgroundBo2,
                  );
                }
              },
            ),
          ],
        ),
        FutureBuilder(
          future: getProducts(),
          builder: (ctx, AsyncSnapshot<ProductsInfo> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else {
              return ContainerProducts(
                snapshot.data!.getProducts.response.docs,
                primary: ColorSelect.btnBackgroundBo2,
              );
            }
          },
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'Servicios cerca',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            FutureBuilder(
              future: getPets(),
              builder: (ctx, AsyncSnapshot<PetItemInfo> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return ListButtons(
                    pets: snapshot.data!.dtoPetTaxonomies,
                    primary: ColorSelect.txtBoHe,
                  );
                }
              },
            ),
          ],
        ),
        FutureBuilder(
          future: getProducts(),
          builder: (ctx, AsyncSnapshot<ProductsInfo> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else {
              return ContainerProducts(
                snapshot.data!.getProducts.response.docs,
                primary: ColorSelect.txtBoHe,
              );
            }
          },
        ),
      ],
    );
  }
}

class ListButtons extends StatefulWidget {
  final List<DtoPetTaxonomy> pets;
  final Color primary;
  const ListButtons({
    Key? key,
    required this.pets,
    required this.primary,
  }) : super(key: key);

  @override
  State<ListButtons> createState() => _ListButtonsState();
}

class _ListButtonsState extends State<ListButtons> {
  int pages = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width * 0.45,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.pets.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  pages = index;
                });
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: pages == index
                    ? widget.primary
                    : Colors.transparent, // no select
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: pages == index
                    ? null
                    : const BorderSide(color: Colors.transparent, width: 0),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
              ),
              child: Text(
                widget.pets[index].pet[0].pet,
                style: TextStyle(
                  fontSize: 15,
                  color: pages == index
                      ? ColorSelect.btnBackgroundBo1
                      : ColorSelect.btnTextBo3,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ContainerProducts extends StatelessWidget {
  final List<Doc> products;
  final Color primary;
  const ContainerProducts(this.products, {Key? key, required this.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) {
            return Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    products[index].urlImage,
                    width: 175,
                    height: 150,
                  ),
                  Text(
                    products[index].name,
                    style: TextStyle(
                      // color: ColorSelect.btnBackgroundBo2,
                      color: primary,
                      fontWeight: FontWeight.w900,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(
                      width: 175,
                      child: Text(products[index].description,
                          style: const TextStyle(
                            color: ColorSelect.btnTextBo3,
                            fontSize: 15,
                          ))),
                  Text(
                    '\$${products[index].price}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
