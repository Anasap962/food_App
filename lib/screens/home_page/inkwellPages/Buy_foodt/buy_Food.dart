import 'package:flutter/material.dart';
import 'package:flutter_application_11/db/orders_db/db_functions.dart';

import 'package:flutter_application_11/main.dart';
import 'package:flutter_application_11/models/data_models.dart';
import 'package:flutter_application_11/screens/navigator_home.dart';

class Buyorder extends StatefulWidget {
  String image; 
  String text;
  String price;

  Buyorder({
    super.key,
    required this.image,
    required this.text,
    required this.price,
  });

  @override
  State<Buyorder> createState() => _BuyorderState();
}

class _BuyorderState extends State<Buyorder> {
  final TextEditingController itemnameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemnameController.text = widget.text;
    priceController.text = widget.price;
  }

  @override
  Widget build(BuildContext context) {
   
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Odering Food',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                    width: 125,
                    height: 125,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    
                      Text(
                        '  Item: ${widget.text}  ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.blue[200]),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        ' Price ${widget.price}  ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            backgroundColor: Colors.blue[200]),
                      )
                    ],
                  ),
                 

              
                  const SizedBox(
                    height: 15,
                  ),
                  TTextformfeild(
                    maxLength: 20,
                    iconData: Icons.person_2,
                    text: 'Enter your name',
                    title: 'name',
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TTextformfeild( 
                    maxLength: 10
                    ,
                    iconData: Icons.phone_outlined,
                    text: 'Enter your number',
                    title: 'number',
                    controller: numberController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          allOrderAdd();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (ctx) {
                            return NavigatorHome();
                          }));
                        }
                      },
                      child: const Text(
                        'Order',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void allOrderAdd() {
    
    final orders = BuyOrderModel(
        image: widget.image,
        itemname: itemnameController.text,
        price: priceController.text,
        name: nameController.text,
        number: numberController.text);
    addOrder(orders);
  }
}

class TTextformfeild extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;
  final String text;
  final String title;
  final IconData iconData;

  TTextformfeild(
      {super.key,
      required this.iconData,
      required this.text,
      required this.title,
      required this.controller,
      required this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Invalid';
        } else {
          return null;
        }
      },
      controller: controller,
      decoration: InputDecoration(
       
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  strokeAlign: 22,
                  width: 22),
              borderRadius: BorderRadius.circular(44)),
          label: Text(text),
          hintText: title,
          prefixIcon: Icon(iconData)),
    );
  }
}
