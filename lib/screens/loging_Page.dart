
import 'package:flutter/material.dart';


import 'package:flutter_application_11/main.dart';
import 'package:flutter_application_11/screens/navigator_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
LoginPage({super.key});

  final TextEditingController _usenamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
 final name = '123';
 final pass ='123';
 final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      body: Center(
      child: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Expanded(
            child: Card(
              
              child: Container( 
                
                height: 400,width: 500,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [  Text('Login',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(validator: (value) {
                        if (value==null||value.isEmpty) {
                          return 'value is empty';
                        }else{
                          return null;
                        }
                      },
                         controller: _usenamecontroller,
                        decoration: InputDecoration( border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        label: const Text('Enter your name',style: TextStyle(fontWeight: FontWeight.bold),),
                        hintText: 'username',
                        // helperText: 'name'
                      ),),
                    )
                    // ,const SizedBox(height: 5,),
                   , Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(validator: (value) {
                        if (value == null|| value.isEmpty) {
                          return 'value is empty';
                        }else{
                          return null;
                        }
                      },
                        controller: _passwordcontroller,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration( border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                      ),
                      label: const Text('Enter your password',style: TextStyle(fontWeight: FontWeight.bold),),hintText: 'Password',),
                      ),
                    ),const SizedBox(height: 20,),ElevatedButton(style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.blue)),
                      onPressed: (){ if (_formkey.currentState!.validate()) {
                        
                      }
                        checkLogin(context);
                 
                      }, child: const Text('Done',style: TextStyle(color: Colors.white),))
                  ],
                ),
              ),
            ),
          ),
        ),
      ), 
      )
    );
  }
  Future <void> checkLogin(BuildContext context)async{
 final _username= _usenamecontroller.text;
 final _password = _passwordcontroller.text;
 if (_username == name && _password ==pass) {
  final _sharedPrfs=await SharedPreferences.getInstance();
   await _sharedPrfs.setBool(SAVE_KEY, true);
   Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
    return const NavigatorHome(); 
   }));
 }else{
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.white,content:Text('The password you entered is Invalid',style: TextStyle(color: Colors.red),),));
 }
  }
}
