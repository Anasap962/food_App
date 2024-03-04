import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/data_models.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';

import 'package:flutter_application_11/screens/splash.dart';

import 'package:hive_flutter/adapters.dart';
 const SAVE_KEY =' UserLgedIn';

void main()async {WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
 if (!Hive.isAdapterRegistered(BuyOrderModelAdapter().typeId))
  {
   Hive.registerAdapter(BuyOrderModelAdapter());
 }
 if (!Hive.isAdapterRegistered(NewFoodModelAdapter().typeId)) {
   Hive.registerAdapter(NewFoodModelAdapter());
 }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splash() );
  }
}
