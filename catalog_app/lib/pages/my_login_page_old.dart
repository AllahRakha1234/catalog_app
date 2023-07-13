

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalog_app/utils/routes.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // COUNT VARIABLE INITIALIZED
  var usernameController = TextEditingController();

  var passwordController = TextEditingController();

  var result = "";

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Form(
              key: _formkey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  Image.asset("assets/images/login.png", height: 300,width: 350,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15),
                    child: TextFormField(
                      // keyboardType: TextInputType.text,
                      controller: usernameController,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          prefixText: 'Username: ',
                          prefixStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 2.0,
                              )
                          )
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return("Username can't be empty.");
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15),
                    child: TextFormField(
                      // keyboardType: TextInputType.text,
                      controller: passwordController,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          prefixText: 'Password: ',
                          prefixStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 2.0,
                              )
                          )
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return("Password can't be empty.");
                        }
                        else if(value.length < 6){
                          return("Password length should be least 6.");
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height:10),
                  ElevatedButton(onPressed: (){
                    print("Clicked!");
                    if (_formkey.currentState!.validate()) {
                      setState(() {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                        result = "Form submitted successfully!";
                      });
                    }
                  }, child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text("Login", style:
                    TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold,),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(result, style: TextStyle
                      (fontSize: 30, color: Colors.deepPurple, fontWeight: FontWeight.bold),),
                  )
                ],

              ),
            ),
          ),
        )
    );
  }
}