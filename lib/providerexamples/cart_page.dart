import 'package:apipractice/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPageNew extends StatefulWidget {
  const CartPageNew({Key? key}) : super(key: key);

  @override
  State<CartPageNew> createState() => _CartPageNewState();
}

class _CartPageNewState extends State<CartPageNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        backgroundColor: Color.fromARGB(255, 244, 195, 46),
      ),
      body: Consumer<CartProvider>(builder: ((context, value, child) {
        return ListView.builder(
            itemCount: value.getCartitems.length,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text(value.getCartitems[index]),
                trailing: IconButton(
                  onPressed: () {
                    String name = value.getCartitems[index];
                    value.removeItemFromCart(name);
                
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            }));
      })),
    );
  }
}
/*
Cart: 

index :       [0]            [1]           [2]
items = ["Item No. 3", "Item No. 5", "Item No. 1"];

Item No. 3
Item No. 5 
Item No. 1

*/