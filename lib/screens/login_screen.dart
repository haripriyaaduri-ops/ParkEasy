import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
import 'register_screen.dart';



class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();


}



class _LoginScreenState extends State<LoginScreen> {


  final emailController = TextEditingController();

  final passwordController = TextEditingController();




  Future<void> loginUser() async {


    if(emailController.text.isEmpty ||
       passwordController.text.isEmpty){


      ScaffoldMessenger.of(context).showSnackBar(


        const SnackBar(

          content:Text(

            "Enter Email and Password",

          ),

        ),


      );


      return;


    }



    SharedPreferences prefs =
        await SharedPreferences.getInstance();



    await prefs.setBool(

      "isLogin",

      true,

    );



    await prefs.setString(

      "email",

      emailController.text,

    );



    print("LOGIN SAVED");



    Navigator.pushReplacement(


      context,


      MaterialPageRoute(


        builder:(context)=>const HomeScreen(),


      ),


    );


  }






  @override
  Widget build(BuildContext context) {


    return Scaffold(


      backgroundColor:Colors.grey.shade100,



      body:SafeArea(



        child:Padding(



          padding:const EdgeInsets.all(20),



          child:Center(



            child:SingleChildScrollView(



              child:Column(



                children:[



                  const Icon(


                    Icons.local_parking,


                    size:100,


                    color:Colors.blue,


                  ),




                  const SizedBox(height:20),




                  const Text(



                    "Welcome to ParkEasy",



                    style:TextStyle(



                      fontSize:28,


                      fontWeight:FontWeight.bold,



                    ),



                  ),




                  const SizedBox(height:10),




                  const Text(



                    "Login to continue",



                    style:TextStyle(



                      color:Colors.grey,


                    ),



                  ),




                  const SizedBox(height:40),




                  TextField(



                    controller:emailController,



                    decoration:InputDecoration(



                      labelText:"Email",



                      prefixIcon:const Icon(Icons.email),



                      border:OutlineInputBorder(



                        borderRadius:BorderRadius.circular(10),



                      ),



                    ),



                  ),




                  const SizedBox(height:20),




                  TextField(



                    controller:passwordController,



                    obscureText:true,



                    decoration:InputDecoration(



                      labelText:"Password",



                      prefixIcon:const Icon(Icons.lock),



                      border:OutlineInputBorder(



                        borderRadius:BorderRadius.circular(10),



                      ),



                    ),



                  ),




                  const SizedBox(height:30),




                  SizedBox(



                    width:double.infinity,



                    height:50,



                    child:ElevatedButton(



                      onPressed:loginUser,



                      child:const Text(



                        "Login",



                        style:TextStyle(



                          fontSize:18,



                        ),



                      ),



                    ),



                  ),




                  const SizedBox(height:15),




                  TextButton(



                    onPressed:(){



                      Navigator.push(



                        context,



                        MaterialPageRoute(



                          builder:(context)=>const RegisterScreen(),



                        ),



                      );



                    },



                    child:const Text(



                      "Create New Account",



                    ),



                  )



                ],



              ),



            ),



          ),



        ),



      ),



    );


  }


}