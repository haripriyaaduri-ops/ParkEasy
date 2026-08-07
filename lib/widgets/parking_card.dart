import 'package:flutter/material.dart';

import '../screens/parking_details_screen.dart';



class ParkingCard extends StatelessWidget {


  final String name;
  final String slots;
  final String price;
  final String latitude;
  final String longitude;



  const ParkingCard({


    super.key,


    required this.name,

    required this.slots,

    required this.price,

    required this.latitude,

    required this.longitude,


  });





  @override
  Widget build(BuildContext context) {


    return Container(


      padding: const EdgeInsets.all(20),


      margin: const EdgeInsets.only(bottom:15),



      decoration: BoxDecoration(


        color: Colors.white,


        borderRadius: BorderRadius.circular(20),


        boxShadow: const [


          BoxShadow(


            color: Colors.black12,


            blurRadius:10,


          ),


        ],


      ),





      child: Column(


        crossAxisAlignment: CrossAxisAlignment.start,


        children: [



          Text(


            name,


            style: const TextStyle(


              fontSize:22,


              fontWeight:FontWeight.bold,


            ),


          ),




          const SizedBox(height:10),




          Text(


            slots,


            style: const TextStyle(


              fontSize:16,


              color:Colors.grey,


            ),


          ),





          const SizedBox(height:10),




          Text(


            price,


            style: const TextStyle(


              fontSize:18,


              color:Colors.green,


              fontWeight:FontWeight.bold,


            ),


          ),





          const SizedBox(height:20),






          SizedBox(


            width:double.infinity,



            child:ElevatedButton(



              onPressed:(){



                Navigator.push(



                  context,



                  MaterialPageRoute(



                    builder:(context)=>ParkingDetails(



                      name:name,



                      slots:slots,



                      price:price,



                      latitude:latitude,



                      longitude:longitude,



                    ),



                  ),



                );



              },



              style:ElevatedButton.styleFrom(


                backgroundColor:Colors.blue,


                padding:const EdgeInsets.symmetric(


                  vertical:15,


                ),


                shape:RoundedRectangleBorder(


                  borderRadius:BorderRadius.circular(15),


                ),


              ),




              child:const Text(


                "View Details",



                style:TextStyle(


                  color:Colors.white,


                  fontSize:18,


                  fontWeight:FontWeight.bold,


                ),



              ),



            ),



          ),



        ],



      ),



    );


  }


}