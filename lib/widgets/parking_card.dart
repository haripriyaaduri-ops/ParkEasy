import 'package:flutter/material.dart';
import '../vehicle_details.dart';


class ParkingCard extends StatelessWidget {

  const ParkingCard({super.key});


  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: const [

          BoxShadow(

            color: Colors.black12,

            blurRadius: 10,

          ),

        ],

      ),


      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [


          const Text(

            "City Mall Parking",

            style: TextStyle(

              fontSize:22,

              fontWeight:FontWeight.bold,

            ),

          ),


          const SizedBox(height:10),


          const Text(

            "Available Slots: 25",

            style:TextStyle(

              fontSize:16,

              color:Colors.grey,

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


                    builder:(context)=>const VehicleDetails(),

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

                "Book Now",

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