import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
   const AddToCart({
     Key ? key, required this.catalog
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on:[AddMutation,RemoveMutation]);    // rebuild 
    final CartModel _cart = (VxState.store as MyStore).cart;
    //final CatalogModel _catalog = (VxState.store as MyStore).catalog;
  bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if(!isInCart) {
        //isInCart = isInCart.toggle();
        AddMutation(catalog);
        //setState(() {});
        }
      },
      style: ButtonStyle(
          // ignore: deprecated_member_use
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          //shape: MaterialStateProperty.all(
            //StadiumBorder(),
          //)
          ),
      child: isInCart ? const Icon(Icons.done) : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

