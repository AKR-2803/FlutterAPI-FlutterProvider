import 'package:flutter/material.dart';

class TextAndButton extends StatelessWidget {
  const TextAndButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/cart.png", height: 200),
          const SizedBox(
            height: 5,
          ),
          const Text("Oops, Looks like the cart is Empty",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.black, minimumSize: Size(80, 50)),
            child: Text(
              "Continue Shopping",
              style: TextStyle(color: Colors.white),
            ),
          )
        ]);
  }
}
