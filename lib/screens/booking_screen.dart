import 'package:flutter/material.dart';
import 'payment_screen.dart';


class BookingScreen extends StatelessWidget {

  final String vehicleNumber;
  final String vehicleType;
  final String parkingSlot;


  const BookingScreen({

    super.key,

    required this.vehicleNumber,

    required this.vehicleType,

    required this.parkingSlot,

  });



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title: const Text(

          "Booking Details",

          style: TextStyle(

            color: Colors.white,

            fontWeight: FontWeight.bold,

          ),

        ),

        backgroundColor: Colors.blue,

        centerTitle: true,

      ),



      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [


            const Text(

              "Confirm Your Booking",

              style: TextStyle(

                fontSize:26,

                fontWeight:FontWeight.bold,

              ),

            ),



            const SizedBox(height:25),



            bookingCard(

              Icons.local_parking,

              "Parking Location",

              "City Mall Parking",

            ),



            bookingCard(

              Icons.event_seat,

              "Parking Slot",

              parkingSlot,

            ),



            bookingCard(

              Icons.directions_car,

              "Vehicle Type",

              vehicleType,

            ),



            bookingCard(

              Icons.confirmation_number,

              "Vehicle Number",

              vehicleNumber,

            ),



            bookingCard(

              Icons.access_time,

              "Duration",

              "1 Hour",

            ),



            bookingCard(

              Icons.currency_rupee,

              "Total Amount",

              "₹30",

            ),



            const Spacer(),



            SizedBox(

              width:double.infinity,

              child:ElevatedButton(


                onPressed:(){


                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder:(context)=>PaymentScreen(


                        vehicleNumber: vehicleNumber,


                        vehicleType: vehicleType,


                        parkingSlot: parkingSlot,


                      ),

                    ),

                  );


                },


                style:ElevatedButton.styleFrom(

                  backgroundColor:Colors.blue,

                  padding:const EdgeInsets.all(15),

                ),



                child:const Text(

                  "Proceed To Payment",

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



  Widget bookingCard(

    IconData icon,

    String title,

    String value,

  ){

    return Card(

      elevation:3,

      margin:const EdgeInsets.only(bottom:12),

      child:ListTile(

        leading:Icon(

          icon,

          color:Colors.blue,

        ),


        title:Text(

          title,

          style:const TextStyle(

            fontWeight:FontWeight.bold,

          ),

        ),


        subtitle:Text(value),


      ),

    );


  }


}