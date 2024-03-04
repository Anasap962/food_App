// import 'dart:io';
import 'dart:io';

import 'package:flutter_application_11/db/new_food_db/new_food_db_functions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_11/db/new_food_db/new_food_db_functions.dart';
import 'package:flutter_application_11/models/new_food_model/new_models.dart';
import 'package:image_picker/image_picker.dart';

class add_edit extends StatefulWidget {
  final int index;
  final String image;
  final String itemname;
  final String price;
  final String cetogory;
 
   const add_edit({super.key,required this.index,
   required this.image,required this.itemname,required this.price,required this.cetogory});

  @override
  State<add_edit> createState() => _add_editState();
}

class _add_editState extends State<add_edit> {
  
File? selectImage;
 final TextEditingController _itemnamecontroller=TextEditingController();
  final TextEditingController _pricecontroller = TextEditingController(); 
 
 final  _formkey=GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    
    _itemnamecontroller.text=widget.itemname;
    _pricecontroller.text=widget.price;
  
    selectImage = widget.image !='' ? File(widget.image): null;
     super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading:  IconButton(onPressed: (){Navigator.of(context).pop();}, icon:const Icon(Icons.arrow_back_rounded),color:Colors.white , ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Added food edit ',
          style: TextStyle(color: Colors.white),
        ),
        
      ),
      body: Center(
        child:  Form(key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [  CircleAvatar(  backgroundImage: AssetImage( widget.image),
                          radius: 60,
                        ),
                        TextButton.icon(
                          onPressed: () {
                            _picImageFromGallery();
                          },
                          icon: Icon(Icons.image),
                          label: Text("GALLERY"),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            picImageFromCamera();
                          },
                          icon: Icon(Icons.camera_alt),
                          label: Text("CAMERA"),
                        ), 
                TextFormField( validator: (value) {
                  if (value!.isEmpty||value==null) {
                    return 'Invalid';
                  }else{
                    return null;
                  }
                },controller: _itemnamecontroller,decoration: InputDecoration( 
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),label:const Text('Item name'),
                ),),const SizedBox( height: 10,),SizedBox(height: 6,),
            
                TextFormField(validator: (value) {
                  if (value==null||value.isEmpty) {
                    return 'Invalid';
                  }else{
                  return null;
                  }
                },controller: _pricecontroller, decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),label:const Text('Price'),
                ),),const SizedBox( height: 10,),
            
                ElevatedButton(onPressed: (){
                 if (_formkey.currentState!.validate()) {
                    newFoodAllEdit(widget.index);
                    Navigator.of(context).pop();
                 } 
                }, child: const Text('DONE',  style: TextStyle(fontWeight: FontWeight.bold),))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void newFoodAllEdit( int index){
    final edits= NewFoodModel(
    image: widget.image,
     itemname:_itemnamecontroller.text,
     price:_pricecontroller.text,
     catagory: widget.cetogory
    
    );
    editNewFood(index, edits as NewFoodModel );

    
  }
   Future<void> _picImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }
    setState(() {
      selectImage = File(returnImage.path);
    });
  }

  Future<void> picImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) {
      return;
    }
    setState(() {
      selectImage = File(returnImage.path);
    });
  }
}