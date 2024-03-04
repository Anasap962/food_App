import 'package:hive_flutter/adapters.dart';
part 'new_models.g.dart';

@HiveType(typeId:2)
class NewFoodModel {

 @HiveField(0)
 final String image;

 @HiveField(1)
 final String itemname;

 @HiveField(2) 
 final String price;


 @HiveField(3) 
 final String catagory;
 
  NewFoodModel({required this.image, required this.itemname, required this.price, required this.catagory });
}
