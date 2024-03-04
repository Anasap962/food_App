import 'package:flutter/material.dart';
import 'package:flutter_application_11/db/orders_db/db_functions.dart';
import 'package:flutter_application_11/models/data_models.dart';


class editpage extends StatefulWidget {
  final int index;
  final String image;
  final String itemname;
  final String price;
  final String name;
  final String number;
   editpage(
      {super.key,
      required this.image,
      required this.itemname,
      required this.price,
      required this. number,
      required this.name,
      required this.index
      });

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _numbercontroller = TextEditingController();
  final _formkey=GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   _namecontroller.text = widget .name;
  _numbercontroller .text = widget.number;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(onPressed: (){Navigator.of(context).pop();}, icon:Icon(Icons.arrow_back_rounded),color:Colors.white , ),
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Edit ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(key: _formkey,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(widget.image,),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text('  Itemname: ${widget.itemname}  ',style: TextStyle(fontSize:15  ,fontWeight: FontWeight.bold,backgroundColor: Colors.blue[200]),),const SizedBox(width: 50,),
                  Text(' Price : ${widget.price}  ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,backgroundColor: Colors.blue[200]),)
                ],),
                 const SizedBox(
                  height: 20,
                ),
                Formfeildedit(controller: _namecontroller, labeltext:'name' ,),
                const SizedBox(
                  height: 20      ,
                ),
              Formfeildedit(controller: _numbercontroller, labeltext:'number' ,),const SizedBox(height: 20   ,),
                // Formfeildedit(text:,),
                // Formfeildedit(text: ,),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        editAll(widget. index);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void editAll(int index) {
    final edits = BuyOrderModel(
        image: widget.image,
        itemname: widget.itemname,
        price: widget.price,
        name: _namecontroller.text,
        number: _numbercontroller.text);
       editProfile(index,edits);
  }
}

class Formfeildedit extends StatelessWidget {
   final String labeltext;
  final TextEditingController controller;
   Formfeildedit({
    required this.controller,
    required this .labeltext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      validator: (value) {
        if (value==null||value.isEmpty) {
          return 'Invalid';
        }else{
          return null;
        }
        
      },
      controller:controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          label: Text(labeltext
            ,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
    );
  }
}
