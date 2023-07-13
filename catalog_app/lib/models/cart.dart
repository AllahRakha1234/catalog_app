

import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/catalog.dart';

class CartModel {

  // // SINGLETON CLASS (WHICH CREATES ONE OBJECT AND THAT IS USE ALWAYS)
  // static final cartModel = CartModel._internal();
  // CartModel._internal();
  // factory CartModel () => cartModel;

  // LIST OF ITEM's IDs AND CATALOG OBJECT FIELD (PRIVATE)
  late CatalogModel _catalog;
  final List<int> _ItemIds = [];

  // GETTER METHOD
  CatalogModel get catalog => _catalog;
  // OR (below is same as above) (The arrow function get catalog => _catalog; is a concise way to
  // define a getter method named catalog that returns the value of the private variable _catalog of type CatalogModel.)
  // CatalogModel getCatalog() {
  //   return _catalog;
  // }

  // SETTER METHOD
  set catalog (CatalogModel newCatalog) {
    assert(newCatalog != null) ;
    _catalog = newCatalog;
  }

  // GET ITEMS IN THE CART
  List<Item> get items => _ItemIds.map((id) => _catalog.getById(id)).toList();

  // GET TOTAL PRICE
  num get totalPrice => items.fold(0, (totalValue, currentElement) => totalValue + currentElement.price);

  // // ADD ITEM
  // void addItem(Item item){
  //   _ItemIds.add(item.id);
  // }
  //
  // // ADD ITEM
  // void removeItem(Item item){
  //   _ItemIds.remove(item.id);
  // }

}

class AddMutation extends VxMutation<MyStore>{
  final Item item;
  AddMutation(this.item);
  @override
  perform(){
    store?.cart._ItemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._ItemIds.remove(item.id);
  }
}