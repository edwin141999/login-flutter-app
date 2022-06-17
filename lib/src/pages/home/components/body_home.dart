import 'package:flutter/material.dart';
import 'package:login_flutter/src/pages/home/components/direction_info.dart';
import 'package:login_flutter/src/pages/home/components/pets_info.dart';
import 'package:login_flutter/src/pages/home/components/products.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  int pages = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: const [
            DirectionInfo(),
            PetsInfo(),
            Products(),
          ],
        ),
      ),
    );
  }
}


// class GridContainer extends StatelessWidget {
//   const GridContainer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 180,
//       decoration: const BoxDecoration(
//         color: ColorSelect.txtBoHe,
//       ),
//       margin: const EdgeInsets.all(20),
//       child: Expanded(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           child: GridView.builder(
//             itemCount: cards.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               childAspectRatio: 0.75,
//               mainAxisSpacing: 25.0,
//               crossAxisSpacing: 10.0,
//             ),
//             itemBuilder: (ctx, index) => GridCard(
//               card: cards[index],
//               press: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (ctx) => DetailsScreen(
//                     card: cards[index],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }