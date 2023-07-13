

import '../../models/catalog.dart';
import 'package:flutter/material.dart';
import '../../pages/catalog_item.dart';
import 'package:catalog_app/pages/home_detail_page.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index){
          final catalogItem = CatalogModel.items[index];
          return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:
                    (context) => HomeDetailPage
                      (catalog: catalogItem)
                )
                );
              },
              child: Hero(
                  tag: Key(catalogItem.id.toString()),
                  child: CatalogItem(catalog: catalogItem)
              )
          );
        }
    );
  }
}
