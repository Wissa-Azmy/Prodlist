import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final double price;
  String userEmail;
  String userPassword;
  bool isFavorite;

  Product({
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.price,
    this.userEmail,
    this.userPassword,
    this.isFavorite = false
  });
}