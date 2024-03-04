import 'dart:io';
import 'package:flutter_application_11/db/new_food_db/new_food_db_functions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_11/db/new_food_db/new_food_db_functions.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';
import 'package:image_picker/image_picker.dart';

class addfood extends StatefulWidget {
  addfood({super.key});

  @override
  State<addfood> createState() => _addfoodState();
}

class _addfoodState extends State<addfood> {
  final _formkey = GlobalKey<FormState>();

  final _namecontroller = TextEditingController();
  final _pricecontroller = TextEditingController();

 File? selectImg;
 String image = 'assets/photo_2024-02-08_23-26-31.jpg';

  String dropdownvalue = 'burger';
  @override
  Widget build(BuildContext context) {
    var items = [
      'burger',
      'juice',
    
      
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Adding Food',
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
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formkey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                 CircleAvatar(
                  backgroundImage:selectImg!=null?
                  FileImage(selectImg!): Image.asset('assets/juice-poster,-juice-bar,-juice-poster,-shake-design-template-13c879aac734313dabd0435264b83742_screen.jpg').image ,
                  radius: 50,
                  foregroundColor: Colors.black,
                ),
                 SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    onPressed: () {
                      _pickFromGelry(source:ImageSource.gallery);
                    },
                    child: const Text(
                      'Add image +',
                      style: TextStyle(color: Colors.white),
                    )
                    ),
                const SizedBox(
                  height: 28,
                ),
                TextFormField(controller: _namecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      label: const Text(
                        'Enter the name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      hintText: 'name'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(controller: _pricecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'value is empty';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        label: const Text(
                          'Enter the price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        hintText: 'price')),
                const SizedBox(
                  height: 1,
                ),
                DropdownButton(
                
                  value: dropdownvalue,
              
                  icon: const Icon(Icons.keyboard_arrow_down),
            
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                 
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                  style: TextStyle(
                      color: Colors.black), 
                  underline: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,border: Border(bottom:  BorderSide(style: BorderStyle.solid))
                    ),
                    height: 1,
                  ),
                ),
                SizedBox(
                  height: 10   ,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        onButtonClick();
                        Navigator.of(context).pop();
                        
                      }
                    },
                    child: const Text(
                      'You added new food',
                      style: TextStyle(color: Colors.white),
                    ))
              ]),
            ),
          ),
        ),
      ),
    );
  }
  void onButtonClick(){
    final _name = _namecontroller.text.trim();
    final _price = _pricecontroller.text.trim();
    if (_name.isEmpty || _price.isEmpty||dropdownvalue.isEmpty||selectImg==null ) {
      return;
    }
    
    final _foodAded= NewFoodModel(image: selectImg!.path, itemname: _name, price: _price,catagory:dropdownvalue );
    newAddedFood(_foodAded);
  }
  Future <void> _pickFromGelry ({required ImageSource source})async{
    final retuning = await ImagePicker().pickImage(source: source);
    if (retuning==null) {
      return ;
    }
    setState(() {
      selectImg = File(retuning.path);
    });
  }
}
