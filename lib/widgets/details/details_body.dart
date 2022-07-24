// ignore_for_file: deprecated_member_use

import 'package:application_from_scratch_flutter_9antra_the_bridge/constants.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/models/product.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/screens/pages_screens/home_screen.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/widgets/details/product_image.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  final Product product;

  const DetailsBody({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to provide us the height and the width of the sceen
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
          decoration: const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ProductImage(
                  size: size,
                  image: product.image,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text(
                'Prix: ${product.price} DT',
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                ),
              ),
              const SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5,
            vertical: kDefaultPadding / 2,
          ),
          child: Text(
            product.description,
            style: const TextStyle(color: Colors.white, fontSize: 19.0),
          ),
        ),
        Center(
          child: Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
              child: const Text(
                'Commander',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
