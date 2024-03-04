import 'package:flutter/material.dart';
import 'package:flutter_application_11/db/new_food_db/new_food_db_functions.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';
import 'package:flutter_application_11/screens/home_page/inkwellPages/Buy_foodt/add_edit.dart';
import 'package:flutter_application_11/screens/order.dart';

class Newfood extends StatefulWidget {
  const Newfood({super.key});

  @override
  State<Newfood> createState() => _NewfoodState();
}

class _NewfoodState extends State<Newfood> {
  String search = '';
  List<NewFoodModel> searchedListed = [];

  void searchListUpdated() {
    setState(() {
      searchedListed = newFoodModelListNotifier.value
          .where((NewFoodModel foodModel) =>
              foodModel.itemname.toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }
  void filterBurgerItems() {
  setState(() {
    searchedListed = newFoodModelListNotifier.value
        .where((NewFoodModel foodModel) =>
            foodModel.catagory== 'burger')
        .toList();
  });
}

  @override
  Widget build(BuildContext context) {
    getAllNewFood();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'New Food',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                      hintText: 'search', border: OutlineInputBorder()),
                  onChanged: (value) {
                    setState(() {
                      search = value;
                    });
                    searchListUpdated();
                  }),
              SizedBox(
                height: 5,
              ),
              Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: newFoodModelListNotifier,
                      builder: (BuildContext context,
                          List<NewFoodModel> foodlist, Widget? child) {
                        return search.isNotEmpty
                            ? ListView.separated(
                                itemBuilder: (ctx, index) {
                                  final data = searchedListed[index];
                                  getAllNewFood();
                                  return buildListTile(data, index);
                                },
                                separatorBuilder: (ctx, index) {
                                  return Divider();
                                },
                                itemCount: searchedListed.length,
                              )
                            : ListView.separated(
                                itemBuilder: (ctx, index) {
                                  final data = foodlist[index];
                                  return buildListTile(data, index);
                                },
                                separatorBuilder: (ctx, index) {
                                  return Divider();
                                },
                                itemCount: foodlist.length);
                      }))
            ],
          ),
        ),
      ),
    );
  }

  Container buildListTile(NewFoodModel data, index) {
    return Container(
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 113, 166, 210)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 110,
            width: 110,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  data.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  orderContainor(text: 'Item: ${data.itemname}'),
                  const SizedBox(
                    width: 10,
                  ),
                  orderContainor(text: 'Price:${data.price}')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      deleteNew(index);
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
                          .push(MaterialPageRoute(builder: (ctx) {
                        return add_edit(
                          image: data.image,
                          itemname: data.itemname,
                          price: data.price,
                          index: index,
                          cetogory: data.catagory,
                        );
                      }));
                    },
                    icon: const Icon(Icons.edit),
                    color: Colors.red,
                    hoverColor: Colors.white,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
