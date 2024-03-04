import 'package:flutter/material.dart';
import 'package:flutter_application_11/db/new_food_db/new_food_db_functions.dart';
import 'package:flutter_application_11/screens/home_page/inkwellPages/Buy_foodt/buy_Food.dart';
import 'package:flutter_application_11/screens/home_page/inkwellPages/burger.dart';

import '../../../models/new_food_model/new_models.dart';

class Juice extends StatefulWidget {
  Juice({super.key});

  @override
  State<Juice> createState() => _JuiceState();
}

class _JuiceState extends State<Juice> {
  List<NewFoodModel> searchedListed = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void filterJuiceItem() {
    setState(() {
      if (newFoodModelListNotifier.value.isEmpty) {
        return;
      }
      searchedListed = newFoodModelListNotifier.value
          .where((NewFoodModel foodModel) =>
              foodModel.catagory.toLowerCase() == '  juice')
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    getAllNewFood();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Juices',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 600,
                  height: 200,
                  color: Colors.black,
                  child: Image.asset(
                    'assets/juice-poster,-juice-bar,-juice-poster,-shake-design-template-13c879aac734313dabd0435264b83742_screen.jpg',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CardinBurger(
                          image: 'assets/shutterstock_445480702.jpg',
                          text: 'ShutterShake',
                          title: '100',
                          onpress: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return Buyorder(
                                image: 'assets/shutterstock_445480702.jpg',
                                text: 'ShutterShake',
                                price: '100',
                              );
                            }));
                          },
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        CardinBurger(
                          image:
                              'assets/Low-CalorieBlueberrySmoothie-TheSpruce_AshleyMarti-28d705d68c834a6299d514e919ecd914.jpg',
                          text: 'GrapeJuice',
                          title: '150',
                          onpress: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return Buyorder(
                                image:
                                    'assets/Low-CalorieBlueberrySmoothie-TheSpruce_AshleyMarti-28d705d68c834a6299d514e919ecd914.jpg',
                                text: 'GrapeJuice',
                                price: '150',
                              );
                            }));
                          },
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        CardinBurger(
                          image: 'assets/Watermelon-Juice-9016.jpg',
                          text: 'Watermelon',
                          title: '200',
                          onpress: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return Buyorder(
                                image: 'assets/Watermelon-Juice-9016.jpg',
                                text: 'Watermelon',
                                price: '200',
                              );
                            }));
                          },
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ValueListenableBuilder(
                    valueListenable: newFoodModelListNotifier,
                    builder: (BuildContext context, List<NewFoodModel> foodlist,
                        Widget? child) {
                      getAllNewFood();
                      final filteredList = foodlist
                          .where((foodModel) =>
                              foodModel.catagory.toLowerCase() == 'juice')
                          .toList();
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0),
                                    
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {
                              final data = filteredList[index];
                              return newCardWidget(
                                  image: data.image,
                                  text: data.itemname,
                                  title: data.price,
                                  onpress: () {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                      builder: (ctx) => Buyorder(
                                          image: data.image,
                                          text: data.itemname,
                                          price: data.price),
                                    ));
                                  });
                            }),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
