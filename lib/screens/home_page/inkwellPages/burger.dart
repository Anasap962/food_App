import 'package:flutter/material.dart';
import 'package:flutter_application_11/db/new_food_db/new_food_db_functions.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';
import 'package:flutter_application_11/screens/home_page/inkwellPages/Buy_foodt/buy_Food.dart';

class Burger extends StatefulWidget {
  const Burger({Key? key}) : super(key: key);

  @override
  State<Burger> createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  List<NewFoodModel> searchedListed = [];

  @override
  void initState() {
    super.initState();
  }

  void filterBurgerItems() {
    setState(() {
      if (newFoodModelListNotifier.value.isEmpty) {
        print(
            'jkghrkjghsdjhfsdjhgsdjhggggggggggggggggggggggggggggggggggggggggggggggg');
        return;
      }
      searchedListed = newFoodModelListNotifier.value
          .where((NewFoodModel foodModel) =>
              foodModel.catagory.toLowerCase() == 'burger')
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
        title: const Text(
          'Burger',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
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
                    'assets/burger-poster-template-vector-01.jpg',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CardinBurger(
                        image: 'assets/Teriyaki-Burgers-9-1.jpg',
                        text: 'VegBurger',
                        title: '100',
                        onpress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Buyorder(
                                    image: 'assets/Teriyaki-Burgers-9-1.jpg',
                                    text: 'VegBurger',
                                    price: '100',
                                  )));
                        },
                      ),
                      CardinBurger(
                        image: 'assets/zinger-burger-recipe.jpeg',
                        text: 'Crispy',
                        title: '150',
                        onpress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Buyorder(
                                    image: 'assets/zinger-burger-recipe.jpeg',
                                    text: 'Crispy',
                                    price: '150',
                                  )));
                        },
                      ),
                      CardinBurger(
                        image: 'assets/bombay-grilled-sandwich.jpg',
                        text: 'Building',
                        title: '250',
                        onpress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Buyorder(
                                    image: 'assets/bombay-grilled-sandwich.jpg',
                                    text: 'Building',
                                    price: '250',
                                  )));
                        },
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CardinBurger(
                        image: 'assets/Gus_s_Chop_House_Burger_at_Bar.9.jpg',
                        text: 'Burgerspicy',
                        title: '200',
                        onpress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Buyorder(
                                    image:
                                        'assets/Gus_s_Chop_House_Burger_at_Bar.9.jpg',
                                    text: 'Burgerspicy',
                                    price: '200',
                                  )));
                        },
                      ),
                      CardinBurger(
                        image: 'assets/indian-sandwich-recipes.jpg',
                        text: 'FlatSandwitch',
                        title: '300',
                        onpress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Buyorder(
                                    image: 'assets/indian-sandwich-recipes.jpg',
                                    text: 'FlatSandwitch',
                                    price: '300',
                                  )));
                        },
                      ),
                      CardinBurger(
                        image:
                            'assets/https___8c0ef296153b3b754f5770623631eff2.cdn.bubble.io_f1512186618568x623568770708516200_veg20sandwich.jpg',
                        text: 'ChickenSandwitch',
                        title: '150',
                        onpress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => Buyorder(
                                    image:
                                        'assets/https___8c0ef296153b3b754f5770623631eff2.cdn.bubble.io_f1512186618568x623568770708516200_veg20sandwich.jpg',
                                    text: 'ChickenSandwitch',
                                    price: '150',
                                  )));
                        },
                      ),
                    ]),
                const SizedBox(height: 15),
                ValueListenableBuilder(
                  valueListenable: newFoodModelListNotifier,
                  builder: (BuildContext context, List<NewFoodModel> foodlist,
                      Widget? child) {
                    getAllNewFood();
                    final filteredList = foodlist
                        .where((foodModel) =>
                            foodModel.catagory.toLowerCase() == 'burger')
                        .toList();
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              3, // Adjust the number of columns as needed
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          final data = filteredList[index];
                          return newCardWidget(
                              image: data.image,
                              text: data.itemname,
                              title: data.price,
                              onpress: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => Buyorder(
                                          image: data.image,
                                          text: data.itemname,
                                          price: data.price,
                                        )));
                              });
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardinBurger extends StatelessWidget {
  final String image;
  final String text;
  final String title;
  final VoidCallback onpress;
  CardinBurger({
    super.key,
    required this.image,
    required this.text,
    required this.title,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 125,
                  width: 125,
                  child: Image.network(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'price:${title}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class newCardWidget extends StatelessWidget {
  final String image;
  final String text;
  final String title;
  final VoidCallback onpress;
  newCardWidget({
    super.key,
    required this.image,
    required this.text,
    required this.title,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: SizedBox(
        height: 150,
        child: Card(
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              SizedBox(
                height: 80,
                width: 125,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'price:${title}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
