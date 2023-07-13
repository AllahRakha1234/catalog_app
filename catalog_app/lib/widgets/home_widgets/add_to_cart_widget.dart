
import '../../models/cart.dart';
import '../../models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/core/store.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on:[AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: (){
          if(!isInCart){
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.deepPurple)
        ),
        child: isInCart ? Icon(Icons.done,size: 30) : Icon(CupertinoIcons.cart_badge_plus, size: 30,)
    );
  }
}
