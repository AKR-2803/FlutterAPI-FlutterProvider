import 'package:apipractice/provider/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({Key? key}) : super(key: key);

  @override
  _DarkThemeScreenState createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Change Example Provider"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text('LightMode'),
            value: ThemeMode.light,
            groupValue: themeChanger.getThemeMode,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeChanger.getThemeMode,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: Text('System Mode'),
            value: ThemeMode.system,
            groupValue: themeChanger.getThemeMode,
            onChanged: themeChanger.setTheme,
          ),
        ],
      ),
    );
  }
}


// import 'package:apipractice/provider/theme_changer_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class DarkThemeScreen extends StatefulWidget {
//   const DarkThemeScreen(Key? key) : super(key: key);

//   @override
//   _DarkThemeScreenState createState() => _DarkThemeScreenState();
// }

// class _DarkThemeScreenState extends State<DarkThemeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final themeChanger = Provider.of<ThemeChangerProvider>(context);
//     return Scaffold(
//         appBar: AppBar(title:Text("Provider ThemeChange Example")),
//         body: Column(
//           children: [
//             RadioListTile<ThemeMode>(
//               title: Text('Light Mode'),
//               value: ThemeMode.light,
//               groupValue: themeChanger.getThemeMode,
//               onChanged: themeChanger.setTheme,
//             ),
//             RadioListTile<ThemeMode>(
//               title: Text('Dark Mode'),
//               value: ThemeMode.dark,
//               groupValue: themeChanger.getThemeMode,
//               onChanged: themeChanger.setTheme,
//             ),
//             RadioListTile<ThemeMode>(
//               title: Text('System Mode'),
//               value: ThemeMode.system,
//               groupValue: themeChanger.getThemeMode,
//               onChanged: themeChanger.setTheme,
//             ),
//             SizedBox(height: 10),
//             Icon(
//               Icons.favorite_rounded,
//               size: 30,
              
//             ),
//           ],
//         ));
//   }
// }
