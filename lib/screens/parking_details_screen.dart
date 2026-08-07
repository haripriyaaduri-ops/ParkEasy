import 'package:flutter/material.dart';

import '../vehicle_details.dart';
import 'map_screen.dart';



class ParkingDetails extends StatelessWidget {


  final String name;
  final String slots;
  final String price;
  final String latitude;
  final String longitude;



  const ParkingDetails({

    super.key,

    required this.name,

    required this.slots,

    required this.price,

    required this.latitude,

    required this.longitude,

  });



  void openMap(BuildContext context) {


    Navigator.push(

      context,

      MaterialPageRoute(

        builder:(context)=>MapScreen(

          parkingName:name,

          latitude:double.parse(latitude),

          longitude:double.parse(longitude),

          address:"Vijayawada",

          slots:slots,

          price:price,

        ),

      ),

    );


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        backgroundColor:Colors.blue,

        centerTitle:true,

        title:const Text(

          "Parking Details",

          style:TextStyle(

            color:Colors.white,

            fontWeight:FontWeight.bold,

          ),

        ),

      ),



      body:Padding(

        padding:const EdgeInsets.all(20),


        child:Column(


          crossAxisAlignment:CrossAxisAlignment.start,


          children:[



            Container(

              height:180,

              width:double.infinity,


              decoration:BoxDecoration(

                color:Colors.blue.shade100,

                borderRadius:BorderRadius.circular(20),

              ),



              child:const Icon(

                Icons.local_parking,

                size:100,

                color:Colors.blue,

              ),


            ),




            const SizedBox(height:25),



            Text(

              name,

              style:const TextStyle(

                fontSize:28,

                fontWeight:FontWeight.bold,

              ),

            ),




            const SizedBox(height:15),




            Text(

              slots,

              style:const TextStyle(

                fontSize:18,

              ),

            ),




            const SizedBox(height:10),




            Text(

              price,

              style:const TextStyle(

                fontSize:22,

                color:Colors.green,

                fontWeight:FontWeight.bold,

              ),

            ),




            const SizedBox(height:25),





            SizedBox(

              width:double.infinity,


              child:ElevatedButton.icon(



                onPressed:(){

                  openMap(context);

                },



                icon:const Icon(Icons.map),



                label:const Text(

                  "Open Map",

                ),



                style:ElevatedButton.styleFrom(

                  backgroundColor:Colors.green,

                  foregroundColor:Colors.white,

                  padding:const EdgeInsets.all(15),

                ),


              ),


            ),





            const Spacer(),





            SizedBox(

              width:double.infinity,



              child:ElevatedButton(



                onPressed:(){


                  Navigator.push(


                    context,


                    MaterialPageRoute(


                      builder:(context)=>VehicleDetails(


                        parkingName:name,


                      ),


                    ),


                  );


                },



                style:ElevatedButton.styleFrom(


                  backgroundColor:Colors.blue,


                  padding:const EdgeInsets.all(15),


                ),



                child:const Text(


                  "Book Now",


                  style:TextStyle(


                    color:Colors.white,


                    fontSize:18,


                  ),


                ),


              ),


            ),


          ],


        ),

      ),


    );


  }


}