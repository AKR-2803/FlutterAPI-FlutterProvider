import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apipractice/provider/favourite_provider.dart';

class FavouriteCart extends StatefulWidget {
  const FavouriteCart({Key? key}) : super(key: key);

  @override
  State<FavouriteCart> createState() => _FavouriteCartState();
}

class _FavouriteCartState extends State<FavouriteCart> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    // ignore: avoid_print
    print("............building");
    // final FavouriteProvider favouriteProvider =
    //     Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Example Provider"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavouriteCart()));
              },
              icon: Icon(Icons.favorite_outlined))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: favouriteProvider.selectedItems.length,
                  itemBuilder: (context, index) {
                    return Consumer<FavouriteProvider>(
                        builder: ((context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItems.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        title: Text("Item $index"),
                        trailing: Icon(value.selectedItems.contains(index)
                            ? Icons.favorite_outlined
                            : Icons.favorite_outline),
                      );
                    }));
                  })),
        ],
      ),
    );
  }
}
