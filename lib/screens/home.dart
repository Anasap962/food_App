import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/db/orders_db/db_functions.dart';

import 'package:flutter_application_11/screens/home_page/inkwellPages/burger.dart';

import 'package:flutter_application_11/screens/home_page/inkwellPages/juice.dart';

import '../db/new_food_db/new_food_db_functions.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
 

  @override
  Widget build(BuildContext context) {
       getAllNewFood();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'FuDY ShAAP',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 480,
                  child: BannerCarousel.fullScreen(
                    initialPage: 0,
                    height: 200,
                    banners: [
                      BannerModel(
                          imagePath: 'assets/food-photographer-ideas.jpg',
                          id: '0'),
                      BannerModel(
                          imagePath: 'assets/shutterstock_445480702.jpg',
                          id: '1'),
                      BannerModel(
                          imagePath:
                              'assets/michaela-hartwig-food-styling-blog-post-capture-one-pro-raw-photo-editor-noodle-bowl-1.jpg',
                          id: '2'),
                      BannerModel(
                          imagePath: 'assets/pexels-chan-walrus-958545.jpg',
                          id: '3')
                    ],
                    activeColor: Colors.black,
                    borderRadius: 10,
                    animation: true,
                    // viewportFraction: 10,
                    // indicatorBottom: true ,
                    showIndicator: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      CardHomeSElection(
                        image: 'assets/pexels-jonathan-borba-2983101.jpg',
                        text: 'Burger',
                        onpress: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return const Burger();
                          }));
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    
                      const SizedBox(
                        height: 10,
                      ),
                      CardHomeSElection(
                          image: 'assets/istockphoto-156152863-612x612.jpg',
                          text: 'Juice',
                          onpress: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return Juice();
                            }));
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                    
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class CardHomeSElection extends StatelessWidget {
  final dynamic image;
  final String text;
  final VoidCallback onpress;

  const CardHomeSElection({
    super.key,
    required this.image,
    required this.text,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Card(
          elevation: 25,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              SizedBox(
                  height: 200,
                  width: 400,
                  child: Image.asset(
                    image,
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          )),
    );
  }
}
