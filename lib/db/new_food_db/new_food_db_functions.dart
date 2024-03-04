import 'package:flutter_application_11/db/new_food_db/new_food_db_functions.dart';



import 'package:flutter/material.dart';
import 'package:flutter_application_11/db/orders_db/db_functions.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<NewFoodModel>>newFoodModelListNotifier=ValueNotifier([]);

Future <void> newAddedFood(NewFoodModel value  )async{
  final newaddedDB=await Hive.openBox<NewFoodModel>('newadded_db');
  await newaddedDB.add(value);
  newFoodModelListNotifier.value.add(value);
  newFoodModelListNotifier.notifyListeners();
}
getAllNewFood()async{
  final newaddedDb=await Hive.openBox<NewFoodModel>('newadded_db');
newFoodModelListNotifier.value.clear();
newFoodModelListNotifier.value.addAll(newaddedDb.values);
newFoodModelListNotifier.notifyListeners();
}

Future<void>editNewFood(int index,NewFoodModel  value)async{
final newaddedDb=await Hive.openBox<NewFoodModel>('newadded_db');
newFoodModelListNotifier.value.clear();
newFoodModelListNotifier.value.addAll(newaddedDb.values);
newaddedDb.putAt(index, value);
newFoodModelListNotifier.notifyListeners();
getAllNewFood();
}
Future <void>deleteNew( index)async{
final newaddedDb=await Hive.openBox<NewFoodModel>('newadded_db');
newaddedDb.deleteAt(index);
getAllNewFood();
newFoodModelListNotifier.notifyListeners();
}