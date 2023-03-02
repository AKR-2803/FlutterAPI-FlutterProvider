import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:fintechdashboardclone/models/cart_card_model.dart';
import 'package:fintechdashboardclone/providers/cart_counter_provider.dart';
import 'package:fintechdashboardclone/providers/meme_cart_provider.dart';
import 'package:fintechdashboardclone/screens/cart_page.dart';
import 'package:fintechdashboardclone/screens/preview_download.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fintechdashboardclone/models/memes_model.dart';
import 'package:provider/provider.dart';

Future<MemesModel> getMemesApi() async {
  final response =
      await http.get(Uri.parse("https://api.imgflip.com/get_memes"));
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return MemesModel.fromJson(data);
  } else {
    return MemesModel.fromJson(data);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<MemesModel> memes;

  @override
  void initState() {
    memes = getMemesApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var memeCartProvider =
        Provider.of<MemeCartProvider>(context, listen: false);
    int cartCounter = context.watch<CartCounterProvider>().getCartCount;

    return Scaffold(
      backgroundColor: Color.fromARGB(228, 239, 233, 255),
      appBar: AppBar(
        title: const Text(
          "API + Provider",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 5.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    }),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.orange,
                      maxRadius: 10,
                    ),
                    Text("$cartCounter"),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      body: FutureBuilder<MemesModel>(
        future: memes,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: DynamicHeightGridView(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 25,
                itemCount: snapshot.data!.data!.memes!.length,
                builder: (context, index) {
                  if (snapshot.hasData) {
                    String memeId =
                        snapshot.data!.data!.memes![index].id.toString();
                    String memeName =
                        snapshot.data!.data!.memes![index].name.toString();
                    String memeImageUrl =
                        snapshot.data!.data!.memes![index].url.toString();

                    CartCardModel addCartItem = CartCardModel(
                        id: memeId,
                        nameCart: memeName,
                        imageUrlCart: memeImageUrl);
                    return Card(
                        elevation: 10,
                        child: SizedBox(
                          child: Column(
                              // mainAxisSize: MainAxisSize.max
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Text(
                                //     "memes type : ${snapshot.data!.data!.memes.runtimeType}"),
                                Text(
                                    "${snapshot.data!.data!.memes![index].name}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(
                                  height: 5,
                                ),
                                Image.network(memeImageUrl),
                                SizedBox(
                                  height: 5,
                                ),

                                ElevatedButton(
                                    onPressed: () {
                                      if (memeCartProvider.getMemesIdList!
                                          .contains(memeId)) {
                                        // print(
                                        //     ".....memeid : ............................${memeId}");
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                content:
                                                    Text("Already in cart")));
                                        //ignore:avoid_print
                                        print(
                                            ".............memesIdList duplicate: ${memeCartProvider.getMemesIdList.toString()}");
                                      } else {
                                        memeCartProvider.getMemesIdList!
                                            .add(memeId);
                                        memeCartProvider.addItem(addCartItem);
                                        context
                                            .read<CartCounterProvider>()
                                            .increment();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          duration: Duration(milliseconds: 800),
                                          content: Text("Added to Cart"),
                                          action: SnackBarAction(
                                              label: "View Cart",
                                              textColor: Colors.white,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CartPage()));
                                              }),
                                        ));
                                        //ignore:avoid_print
                                        print(
                                            ".............memesIdList add: ${memeCartProvider.getMemesIdList.toString()}");
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.black),
                                    child: const Text(
                                      "Get This Meme",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                PreviewDownload(imageUrl: memeImageUrl)
                              ]),
                        ));
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error Occured : ${snapshot.error}"),
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.teal,
                    ));
                  }
                }),
          );
        },
      ),
    );
  }
}
