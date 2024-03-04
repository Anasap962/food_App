

import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/data_models.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';

import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<BuyOrderModel>> BuyOrderListNotifier=ValueNotifier([]);

Future <void> addOrder(BuyOrderModel value)async {
  final orderCD= await Hive.openBox<BuyOrderModel>('order_cd');
  await orderCD.add(value);
  BuyOrderListNotifier.value.add(value);
  BuyOrderListNotifier.notifyListeners();
}

getAllOrders()async{
final orderCD=await Hive .openBox<BuyOrderModel>('order_cd');
BuyOrderListNotifier.value.clear();
BuyOrderListNotifier.value.addAll(orderCD.values);
BuyOrderListNotifier.notifyListeners();
}

Future <void> deleteOrder(index)async{
final orderCd =await Hive.openBox<BuyOrderModel>('order_cd');
orderCd.deleteAt(index);
getAllOrders();
BuyOrderListNotifier.notifyListeners();
}

Future <void> editProfile(index ,BuyOrderModel value)async{
  final orderCD=await Hive.openBox<BuyOrderModel>('order_cd');
  BuyOrderListNotifier.value.clear();
  BuyOrderListNotifier.value.addAll(orderCD . values);
  orderCD.putAt(index, value);
  BuyOrderListNotifier.notifyListeners();

  getAllOrders();
}
