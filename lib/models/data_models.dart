import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
part 'data_models.g.dart';



@HiveType(typeId: 1)
class BuyOrderModel {

  @HiveField(0)
  final String image;

  @HiveField(1)
  final String itemname;

  @HiveField(2)
  final String price;

  @HiveField(3)
  final String name;

  @HiveField(4)
  final String number;

  BuyOrderModel({required this.image,required this . itemname, required this .price ,required this.name,required this .number});

}