import 'package:flutter/material.dart';
import 'login_screen.dart';


class WelcomeScreen extends StatelessWidget {

  const WelcomeScreen({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(


      body:Container(


        width:double.infinity,


        decoration:const BoxDecoration(


          gradient:LinearGradient(


            colors:[

              Colors.blue,

              Colors.lightBlue,

            ],


            begin:Alignment.topCenter,

            end:Alignment.bottomCenter,


          ),


        ),




        child:Column(



          mainAxisAlignment:MainAxisAlignment.center,



          children:[



            const Icon(


              Icons.local_parking,


              size:100,


              color:Colors.white,


            ),




            const SizedBox(height:25),




            const Text(



              "ParkEasy",



              style:TextStyle(



                color:Colors.white,


                fontSize:40,


                fontWeight:FontWeight.bold,


              ),



            ),




            const SizedBox(height:15),




            const Text(



              "Find & Book Parking Easily",



              style:TextStyle(



                color:Colors.white,


                fontSize:18,


              ),



            ),





            const SizedBox(height:60),





            SizedBox(



              width:250,



              child:ElevatedButton(



                onPressed:(){



                  Navigator.pushReplacement(



                    context,



                    MaterialPageRoute(



                      builder:(context)=>const LoginScreen(),



                    ),



                  );



                },



                style:ElevatedButton.styleFrom(



                  backgroundColor:Colors.white,


                  padding:const EdgeInsets.all(15),



                ),



                child:const Text(



                  "Get Started",



                  style:TextStyle(



                    color:Colors.blue,


                    fontSize:18,


                    fontWeight:FontWeight.bold,


                  ),



                ),



              ),



            )




          ],



        ),



      ),



    );


  }


}