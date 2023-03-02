// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CartCardModel extends ChangeNotifier {
  String id;
  String? nameCart;
  String? imageUrlCart;
  CartCardModel({
    required this.id,
    this.nameCart,
    this.imageUrlCart,
  });
}
