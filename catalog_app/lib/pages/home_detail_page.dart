
import 'package:catalog_app/themes/theme.dart';
import 'package:catalog_app/widgets/home_widgets/add_to_cart_widget.dart';

import '../models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {

  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      title: "Detail Page".text.xl4.bold.make().pOnly(left: 70),
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${catalog.price}".text.xl4.color(Colors.red).bold.make(),
          10.heightBox,
          AddToCart(catalog: catalog).wh(140, 45).pOnly(right: 10)
        ],
      ).p8(),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Hero(
                  tag: Key(catalog.id.toString()),
                  child: Center(child: Image.network(catalog.image).w64(context).p16())
              ),
              Expanded(
                  child: VxArc(
                    height: 30,
                    edge: VxEdge.top,
                    arcType: VxArcType.convey,
                    child: Container(
                      width: context.screenWidth,
                      color: Colors.white,
                      child: Column(
                        children: [
                          catalog.name.text.xl4.bold.make(),
                          catalog.desc.text.bold.xl2.textStyle(context.captionStyle).make(),
                          "The iPhone, developed by Apple, is a groundbreaking smartphone with a sleek design "
                              "and powerful hardware.AirPods are wireless earbuds that offer "
                              "a seamless audio experience, connecting to iPhones and other devices."
                              " Laptops provide portable computing, offering versatility performance. "
                              "PlayStations are popular gaming consoles with immersive gameplay and stunning graphics."
                              .text.bold.center.textStyle(context.captionStyle).minFontSize(14).make().pOnly(right: 16, left: 16, top: 16)
                        ],
                      ).py64(),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
