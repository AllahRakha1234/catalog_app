

import '../models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_image.dart';
import '../widgets/home_widgets/add_to_cart_widget.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key,required this.catalog});
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            CatalogImage(img: catalog.image),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    catalog.name.text.xl2.bold.make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      children: [
                        "\$${catalog.price}".text.xl2.bold.make(),
                        // 5.heightBox,
                        AddToCart(catalog: catalog),
                      ],
                    )
                  ],
                )
            )
          ],
        )
    ).white.rounded.square(150).make().py12();
  }
}

