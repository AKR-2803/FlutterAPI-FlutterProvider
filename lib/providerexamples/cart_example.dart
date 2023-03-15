import 'package:apipractice/provider/cart_provider.dart';
import 'package:apipractice/providerexamples/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartExample extends StatefulWidget {
  const CartExample({Key? key}) : super(key: key);

  @override
  State<CartExample> createState() => _CartExampleState();
}

class _CartExampleState extends State<CartExample> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Cart Provider Example"),
          backgroundColor: Colors.purpleAccent,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPageNew()));
                },
                icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.85),
            itemCount: 9,
            itemBuilder: (context, index) => Card(
                margin: EdgeInsets.all(10),
                elevation: 3.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Item $index",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    Consumer<CartProvider>(builder: ((context, value
                    , child) {
                      return ElevatedButton(
                          onPressed: () {
                            if (value.getCartitems
                                .contains("Item No. $index")) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Item Already in cart"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Color.fromARGB(
                                                    255, 206, 157, 8)),
                                            child: Text("OK"))
                                      ],
                                    );
                                  });
                            } else {
                              Provider.of<CartProvider>(context, listen: false)
                                  .addItemToCart("Item No. $index");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 52, 193, 160)),
                          child: Text(
                            "Add to Cart",
                          ));
                    }))
                  ],
                ))),
      );
}

/*
Cart: 

index :       [0]            [1]           [2]
items = ["Item No. 3", "Item No. 5", "Item No. 1"];

Item No. 3
Item No. 5 
Item No. 1

*/