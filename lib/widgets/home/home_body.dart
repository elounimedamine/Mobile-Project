import 'package:application_from_scratch_flutter_9antra_the_bridge/constants.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/models/product.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/screens/pages_screens/details_screen.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/widgets/home/product_cart.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          // SizedBox de height 10 (20.0/2=10.0)
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            //Stack => pour des objets sur des autres objets
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70.0),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => ProductCard(
                    itemIndex: index,
                    product: products[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: products[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
