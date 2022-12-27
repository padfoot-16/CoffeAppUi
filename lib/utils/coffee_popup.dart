// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  final String  coffeeImagePath;
  final String  coffeeName;
  final String  coffeeprice;
  final String  coffeedescr;
  final String tag;
  const CoffeeCard({
    Key? key,
    required this.coffeeImagePath,
    required this.coffeeName,
    required this.coffeeprice,
    required this.coffeedescr,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Hero(
      tag: tag,
      child: Container()
       );
       
  }
}
