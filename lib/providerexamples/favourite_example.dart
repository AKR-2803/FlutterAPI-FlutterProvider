import 'package:apipractice/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteExample extends StatefulWidget {
  const FavouriteExample({Key? key}) : super(key: key);

  @override
  State<FavouriteExample> createState() => _FavouriteExampleState();
}

class _FavouriteExampleState extends State<FavouriteExample> {
  @override
  Widget build(BuildContext context) {
    //ignore: avoid_print
    print("......................build method");
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Example Favourite"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),

      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Consumer<FavouriteProvider>(
                builder: (context, value, child) {
              return ListTile(
                title: Text(
                  "Item no. ${index + 1}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing: value.selectedItems.contains(index)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border_outlined),
                onTap: () {
                  if (value.selectedItems.contains(index)) {
                    value.removeItem(index);
                  } else {
                    value.addItem(index);
                  }
                },
              );
            });
          }),
    ));
  }
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: favouriteProvider.selectedItems.length,
        itemBuilder: (context, index) {
          return Consumer<FavouriteProvider>(builder: ((context, value, child) {
            return ListTile(
              onTap: () {
                if (value.selectedItems.contains(index)) {
                  value.removeItem(index);
                } else {
                  value.addItem(index);
                }
              },
              title: Text("Item no. $index"),
              trailing: Icon(value.selectedItems.contains(index)
                  ? Icons.favorite_outline_rounded
                  : Icons.favorite_rounded),
            );
          }));
        },
      ),
    );
  }
}





// import 'package:apipractice/favourite_cart.dart';
// import 'package:apipractice/provider/favourite_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FavouriteExample extends StatefulWidget {
//   const FavouriteExample({Key? key}) : super(key: key);

//   @override
//   State<FavouriteExample> createState() => _FavouriteExampleState();
// }

// class _FavouriteExampleState extends State<FavouriteExample> {
//   @override
//   Widget build(BuildContext context) {
//     // ignore: avoid_print
//     print("............building");
//     // final FavouriteProvider favouriteProvider =
//     //     Provider.of<FavouriteProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Favourite Example Provider"),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => const FavouriteCart()));
//               },
//               icon: const Icon(Icons.favorite_outlined))
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: ListView.builder(
//                   itemCount: 50,
//                   itemBuilder: (context, index) {
//                     return Consumer<FavouriteProvider>(
//                         builder: ((context, value, child) {
//                       return ListTile(
//                         onTap: () {
//                           if (value.selectedItem.contains(index)) {
//                             value.removeItem(index);
//                           } else {
//                             value.addItem(index);
//                           }
//                         },
//                         title: Text("Item $index"),
//                         trailing: Icon(value.selectedItem.contains(index)
//                             ? Icons.favorite_outlined
//                             : Icons.favorite_outline),
//                       );
//                     }));
//                   })),
//         ],
//       ),
//     );
//   }
// }
