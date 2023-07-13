

import '../core/store.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/themes/theme.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart Page".text.xl4.bold.make().pOnly(left: 70),
      ),
      backgroundColor: MyTheme.creamColor,
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty ? "Nothing to Show".text.bold.xl3.make().centered() :
        ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: _cart.items[index].name.text.xl2.bold.make(),
            leading: Icon(Icons.done, color: Colors.green.shade600,),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_sharp, color: Colors.deepPurple,),
              onPressed: (){
                RemoveMutation(_cart.items[index]);
                // setState(() {});
              },
            ),
          ),
        )
    );
  }
}

class _CartTotal extends StatefulWidget {

  @override
  State<_CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<_CartTotal> {
  @override
  Widget build(BuildContext context) {
    CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (BuildContext context, dynamic _, VxStatus? __){
              return "\$${_cart.totalPrice}".text.xl5.color(Colors.black).bold.make();
            }
          ),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
              onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying items not supported yet.".text.xl2.make()));
          }, child: "Buy".text.bold.xl3.make().p8()
          ).w32(context)
        ],
      ),
    );
  }
}
