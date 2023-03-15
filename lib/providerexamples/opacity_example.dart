//OpacityExample
/*
import 'package:apipractice/provider/opacity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpacityExample extends StatefulWidget {
  const OpacityExample({Key? key}) : super(key: key);

  @override
  State<OpacityExample> createState() => _OpacityExampleState();
}

class _OpacityExampleState extends State<OpacityExample> {
  @override
  Widget build(BuildContext context) {
    print("...................build method called.....");
    // final opacityProvider =
    //     Provider.of<OpacityProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Provider Opacity Example")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Change Opacity",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 5,
          ),
          Consumer<OpacityProvider>(
            builder: ((context, consumerValue, child) {
              return Slider(
                  min: 0.0,
                  max: 1.0,
                  value: consumerValue.opacityValue,
                  onChanged: (double onChangedValue) {
                    print(
                        ".......................slider value $onChangedValue");
                    consumerValue.setOpacityValue(onChangedValue);
                    // setState(() {});
                  });
            }),
          ),
          SizedBox(
            height: 5,
          ),
          Consumer<OpacityProvider>(builder: ((context, consumerValue, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent
                          .withOpacity(consumerValue.opacityValue),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 1, 91, 31)
                          .withOpacity(consumerValue.opacityValue),
                    ),
                  ),
                )
              ],
            );
          })),
        ],
      ),
    );
  }
}
*/

//OpacityExample
/*
import 'package:apipractice/provider/opacity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpacityExample extends StatefulWidget {
  const OpacityExample({Key? key}) : super(key: key);

  @override
  State<OpacityExample> createState() => _OpacityExampleState();
}

class _OpacityExampleState extends State<OpacityExample> {
  @override
  Widget build(BuildContext context) {
    print(".........................building...");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<OpactiyProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.opacityValue,
                onChanged: (double onChangedValue) {
                  // print("...............$onChangedValue");
                  value.setOpacityValue(onChangedValue);
                  // setState(() {});
                });
          }),
          Consumer<OpactiyProvider>(builder: (context, value, child) {
            return Row(children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 89, 6, 127)
                          .withOpacity(value.opacityValue)),
                  child: Text(
                    "I am C1",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 72, 143, 2)
                          .withOpacity(value.opacityValue)),
                  child: Text(
                    "I am C2",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ]);
          })
        ],
      ),
    );
  }
}
*/