import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Address {
  String? city;
  List<String>? streets;

  Address({this.city, this.streets});

  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    List<dynamic> streetsFromJson = parsedJson['streets'];

    List<String> streetsList = streetsFromJson.cast<String>();

    return Address(city: parsedJson['city'], streets: streetsList);
  }
}

/* 
//Student Class

class Student {
  String? studentId;
  String? studentName;
  int? studentScore;

  Student({this.studentId, this.studentName, this.studentScore});

  factory Student.fromJson(Map<String, dynamic> parsedJson) {
    return Student(
        studentId: parsedJson['id'],
        studentName: parsedJson['name'],
        studentScore: parsedJson['score']);
  }
}
*/