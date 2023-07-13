
import 'dart:convert';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart.dart';

import '../themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/models/catalog.dart';
import '../widgets/home_widgets/catalog_list.dart';
import '../widgets/home_widgets/catalog_header.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var catalogProducts = decodedData["products"];
    CatalogModel.items =
        List.from(catalogProducts).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        floatingActionButton: VxBuilder(
          mutations: {RemoveMutation, AddMutation},
          builder: (BuildContext context, dynamic _, VxStatus? __) => FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: Icon(
              Icons.shopping_cart,
            ),
          ).badge(count: _cart.items.length,size: 22, color: Colors.red, textStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black
          )),
        ),
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
              padding: Vx.m20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    CatalogList().expand()
                  else
                    CircularProgressIndicator().centered().expand(),
                ],
              )),
        ));
  }
}
