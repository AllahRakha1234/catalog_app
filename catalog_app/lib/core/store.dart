
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart ;

  MyStore() {
    cart = CartModel();
    catalog = CatalogModel();
    cart.catalog = catalog;
  }
}