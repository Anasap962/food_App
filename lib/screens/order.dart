import 'package:flutter/material.dart';
import 'package:flutter_application_11/db/orders_db/db_functions.dart';
import 'package:flutter_application_11/models/data_models.dart';
import 'package:flutter_application_11/screens/home_page/inkwellPages/Buy_foodt/edit.dart';

import 'package:lottie/lottie.dart';

class Orderpage extends StatefulWidget {
  const Orderpage({super.key});

  @override
  State<Orderpage> createState() => _OrderpageState();
}

class _OrderpageState extends State<Orderpage> {
  String search = '';

  List<BuyOrderModel> searchedList = [];

  void searchListUpdate() {
    setState(() {
      searchedList = BuyOrderListNotifier.value
          .where((BuyOrderModel foodList) =>
              foodList.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }
 
  int totalPrice = 0;
  int listlength = 0;
  @override
  Widget build(BuildContext context) {
    getAllOrders();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22)),
                    suffixIcon: const Icon(Icons.search),
                    label: const Text('Search'),
                    hintText: 'Search'),
                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                  searchListUpdate();
                },
              ),
            ),
            ValueListenableBuilder(
                valueListenable: BuyOrderListNotifier,
                builder: (BuildContext context, List<BuyOrderModel> orderList,
                    Widget? child) {
                  return search.isNotEmpty
                      ? Expanded(
                          child:searchedList.isEmpty
                          ?Center(child: Lottie.asset('assets/Animation - 1708580774808.json',height: 300),): ListView.builder(
                            itemBuilder: (ctx, index) {
                              final data = searchedList[index];
                              getAllOrders();
                              listlength = searchedList.length;

                              List<int?> price = [];

                              for (var element in searchedList) {
                                price.add(int.tryParse(element.price)!.toInt());
                              }
                              totalPrice = price.reduce(
                                  (value, element) => value! + element!)!;

                              return  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: Container(
                                        width: double.infinity,
                                        height: 140,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color.fromARGB(
                                                255, 113, 166, 210)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              height:125,
                                              width: 125,
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15)),
                                                clipBehavior: Clip.antiAlias,
                                                child: Image.network(
                                                  data.image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    orderContainor(
                                                        text:
                                                            'Item: ${data.itemname}'),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    orderContainor(
                                                        text:
                                                            'Price:${data.price}')
                                                  ],
                                                ),SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    orderContainor(
                                                      text:
                                                          'Name: ${data.name}',
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    orderContainor(
                                                        text:
                                                            'Number: ${data.number}'),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                                // const SizedBox(
                                                //   height: 5,
                                                // ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        deleteOrder(index);
                                                      },
                                                      icon: const Icon(
                                                        Icons.delete,
                                                      ),
                                                      color: Colors.red,
                                                      hoverColor: Colors.white,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (ctx) {
                                                          return editpage(
                                                            image: data.image,
                                                            itemname:
                                                                data.itemname,
                                                            price: data.price,
                                                            index: index,
                                                            name: data.name,
                                                            number: data.number,
                                                          );
                                                        }));
                                                      },
                                                      icon: const Icon(
                                                          Icons.edit),
                                                      color: Colors.red,
                                                      hoverColor: Colors.white,
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                            },
                            itemCount: orderList.length,
                          ),
                        )
                      : orderList.isEmpty
                          ? Center(
                            child: Lottie.asset(
                                'assets/Animation - 1707818608495.json',
                                height: 300),
                          )
                          : Expanded(
                              child: Stack(children: [
                                ListView.builder(
                                  itemCount: orderList.length,
                                  itemBuilder: (context, index) {
                                    getAllOrders();
                                    listlength = orderList.length;

                                    final data = orderList[index];

                                    List<int?> price = [];

                                    for (var element in orderList) {
                                      price.add(
                                          int.tryParse(element.price)!.toInt());
                                    }
                                    totalPrice = price.reduce(
                                        (value, element) => value! + element!)!;

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 5),
                                      child: Container(
                                        width: double.infinity,
                                        height:  140    ,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: const Color.fromARGB(
                                                255, 113, 166, 210)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              height: 125,
                                              width: 125,
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(15)),
                                                clipBehavior: Clip.antiAlias,
                                                child: Image.network(
                                                  data.image,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    orderContainor(
                                                        text:
                                                            'Item: ${data.itemname}'),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    orderContainor(
                                                        text:
                                                            'Price:${data.price}')
                                                  ],
                                                ),SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    orderContainor(
                                                      text:
                                                          'Name: ${data.name}',
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    orderContainor(
                                                        text:
                                                            'Number: ${data.number}'),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                                // const SizedBox(
                                                //   height: 5,
                                                // ),
                                                Row(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        deleteOrder(index);
                                                      },
                                                      icon: const Icon(
                                                        Icons.delete,
                                                      ),
                                                      color: Colors.red,
                                                      hoverColor: Colors.white,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (ctx) {
                                                          return editpage(
                                                            image: data.image,
                                                            itemname:
                                                                data.itemname,
                                                            price: data.price,
                                                            index: index,
                                                            name: data.name,
                                                            number: data.number,
                                                          );
                                                        }));
                                                      },
                                                      icon: const Icon(
                                                          Icons.edit),
                                                      color: Colors.red,
                                                      hoverColor: Colors.white,
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: Container(
                                            padding: const EdgeInsets.all(10),
                                            width: double.infinity,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 143, 241, 172),
                                              border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 247, 152, 9),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  'Items: $listlength',
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 100,
                                                ),
                                                Text(
                                                  'TotalPrice: $totalPrice',
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            )),
                                      ),
                                    ))
                              ]),
                            );
                }),
          ],
        ),
      ),
    );
  }
}

class orderContainor extends StatelessWidget {
  final String text;

  const orderContainor({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ));
  }
}
