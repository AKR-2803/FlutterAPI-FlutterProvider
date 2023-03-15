//Login Authentication using POST API

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      final response =
          await http.post(Uri.parse("https://reqres.in/api/login"), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        //ignore: avoid_print
        print("...................Successful");
      } else {
        //ignore: avoid_print
        print("...................Failure");
        setLoading(false);
      }
    } catch (e) {
      setLoading(false);
      //ignore: avoid_print
      print("Following error occured : ${e.toString()}");
    }
  }
}
