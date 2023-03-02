import 'package:fintechdashboardclone/models/cart_card_model.dart';
import 'package:fintechdashboardclone/providers/cart_counter_provider.dart';
import 'package:fintechdashboardclone/providers/meme_cart_provider.dart';
import 'package:fintechdashboardclone/widgets/text_and_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var memeCartProvider = Provider.of<MemeCartProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.amber,
      appBar: AppBar(title: const Text("Meme Cart")),
      body: memeCartProvider.getCartList.isEmpty
          ? TextAndButton()
          : Consumer<MemeCartProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: value.getMemesIdList!.length,
                itemBuilder: ((context, index) {
                  CartCardModel cartObject = value.getCartList[index];
                  // print("................id :${cartObject.id}");
                  // print("................name :${cartObject.nameCart}");
                  // print("................img url :${cartObject.imageUrlCart}");
                  return SizedBox(
                    // height: 250,
                    // width:150,
                    child: Card(
                      elevation: 3,
                      color: Color.fromARGB(255, 56, 56, 56),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      // margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              "${cartObject.imageUrlCart}",
                              width: 140,
                            ),
                            Text(
                              cartObject.nameCart!.length > 20
                                  ? "${cartObject.nameCart!.substring(0, 20)}..."
                                  : "${cartObject.nameCart}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                size: 25,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // print(
                                //     "ID list bfor: .........${value.getCartList.toString()}");
                                // print(".........CartObject id :${cartObject.id}");
                                // print(
                                //     ".........Provider id :${value.getMemesIdList![index]}");
                                value.removeItem(cartObject.id);
                                context
                                    .read<CartCounterProvider>()
                                    .decrement();
                                // print(
                                //     "ID list after: .........${value.getCartList.toString()}");
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
    );
  }
}
