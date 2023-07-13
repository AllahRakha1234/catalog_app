
import 'package:flutter/material.dart';
import 'package:catalog_app/models/catalog.dart';

class ItemWidget extends StatelessWidget{
  final Item item;

  const ItemWidget({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.cyanAccent,
      // shape: StadiumBorder(),
      child: Container(
        child: ListTile(
          leading: Image.network("${item.image}"),
          title: Text("${item.name}"),
          subtitle: Text("${item.desc}"),
          trailing: Text("\$${item.price}"),
        ),
      ),
    );
  }



}