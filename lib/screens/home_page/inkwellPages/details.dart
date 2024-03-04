import 'package:flutter/material.dart';
import 'package:flutter_application_11/models/data_models.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';

import 'package:flutter_application_11/screens/home_page/inkwellPages/Buy_foodt/add_new_food.dart';
import 'package:flutter_application_11/screens/home_page/inkwellPages/Buy_foodt/chart.dart';
import 'package:flutter_application_11/screens/loging_Page.dart';
import 'package:flutter_application_11/screens/navigator_home.dart';
import 'package:flutter_application_11/screens/order.dart';
import 'package:flutter_application_11/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding( 
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView( scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/pexels-cottonbro-studio-4709285.jpg'),
                  radius: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      mouseCursor: MaterialStatePropertyAll(MouseCursor.defer),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Edit profile',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 6,
                ),
                const Divider(
                  thickness: 3,
                  color: Colors.black,
                ),SizedBox(height: 6    ,),
                   ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return  addfood();
                      }));
                    },
                    child: const Text(
                      'Add New food +',
                      style: TextStyle(color: Colors.white),
                    )),SizedBox(height: 6,), Divider(thickness: 3,color: Colors.black,),
                 SizedBox(
                  height:   5,
                ),
                
                const RRowWrap(
                  iconData: Icons.settings,
                  text: 'Settings',
                ),
                const SizedBox(
                  height: 7,
                ),
                GestureDetector(onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx){ return HomePage();}));
                },
                  child: const RRowWrap(
                      iconData: Icons.location_on_outlined, text: 'Chart'),
                ),
                const SizedBox(
                  height: 7,
                ),
                GestureDetector( onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (ctx)=>  Orderpage()));
                },
                  child: const RRowWrap(
                      iconData: Icons.shopping_bag_outlined, text: 'Orders'),
            
                ),
                const SizedBox(
                  height: 7,
                ),
                GestureDetector(onTap: ()async {
                  final orderCD= await Hive.openBox<BuyOrderModel>('order_cd');
                  orderCD.clear();
                  final newadded_db=await Hive.openBox<NewFoodModel>('newadded_db');
                  newadded_db.clear();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctc){return  NavigatorHome();}));
                },
                  child: const RRowWrap(
                      iconData: Icons.lock_outline, text: ' reset'),
                      
                ),
                const SizedBox(
                  height: 7,
                ),
                const RRowWrap(
                    iconData: Icons.help_outline, text: 'Help & Support'),
                const SizedBox(
                  height: 7,),
                  GestureDetector(onTap: ()async{
                     final _sharedPrfs = await SharedPreferences.getInstance();
                    await _sharedPrfs.setBool(SAVE_KEY, true);
                    _sharedPrfs.clear();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){return LoginPage();}));}
                    ,child: RRowWrap(iconData: Icons.logout, text: 'Logout')),SizedBox(height: 5,),
                const Divider(
                  thickness: 3,
                  color: Colors.black,
                ),
                const SizedBox(
                  height:  18    ,
                ),
            
                // ElevatedButton(
                //     style: const ButtonStyle(
                //       backgroundColor: MaterialStatePropertyAll(Colors.blue),
                //     ),
                //     onPressed: () {
                //       Navigator.of(context)
                //           .push(MaterialPageRoute(builder: (ctx) {
                //         return  addfood();
                //       }));
                //     },
                //     child: const Text(
                //       'Add New food +',
                //       style: TextStyle(color: Colors.white),
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RRowWrap extends StatelessWidget {
  final IconData iconData;
  final String text;
  const RRowWrap({
    super.key,
    required this.iconData,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
