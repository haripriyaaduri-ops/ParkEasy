import 'package:flutter/material.dart';
import '../payment_page.dart';


class BookingScreen extends StatelessWidget {


  final String parkingName;
  final String vehicleNumber;
  final String vehicleType;
  final String parkingSlot;
  final String duration;
  final int amount;



  const BookingScreen({


    super.key,


    required this.parkingName,

    required this.vehicleNumber,

    required this.vehicleType,

    required this.parkingSlot,

    required this.duration,

    required this.amount,


  });



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(


        title: const Text(

          "Booking Details",

          style: TextStyle(

            color: Colors.white,

          ),

        ),


        backgroundColor: Colors.blue,

        centerTitle:true,


      ),




      body:Padding(


        padding:const EdgeInsets.all(20),



        child:Column(


          crossAxisAlignment:
          CrossAxisAlignment.start,


          children:[



            Text(


              parkingName,


              style:const TextStyle(


                fontSize:26,


                fontWeight:
                FontWeight.bold,


              ),



            ),




            const SizedBox(height:25),





            bookingCard(

              Icons.local_parking,

              "Parking Location",

              parkingName,

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

              duration,

            ),





            bookingCard(

              Icons.currency_rupee,

              "Total Amount",

              "₹$amount",

            ),





            const Spacer(),




            SizedBox(


              width:double.infinity,


              child:ElevatedButton(




                onPressed:(){



                  Navigator.push(



                    context,



                    MaterialPageRoute(



                      builder:(context)=>

                          PaymentPage(



                            parkingName:
                            parkingName,


                            vehicleNumber:
                            vehicleNumber,


                            vehicleType:
                            vehicleType,


                            parkingSlot:
                            parkingSlot,


                            duration:
                            duration,


                            amount:
                            amount,


                          ),



                    ),



                  );



                },




                style:ElevatedButton.styleFrom(


                  backgroundColor:
                  Colors.blue,


                  padding:
                  const EdgeInsets.all(15),


                ),



                child:const Text(


                  "Proceed To Payment",


                  style:TextStyle(


                    color:Colors.white,


                    fontSize:18,


                  ),


                ),



              ),



            )




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


      margin:
      const EdgeInsets.only(bottom:12),



      child:ListTile(


        leading:Icon(

          icon,

          color:Colors.blue,

        ),



        title:Text(


          title,


          style:const TextStyle(

            fontWeight:
            FontWeight.bold,

          ),


        ),



        subtitle:Text(value),



      ),



    );

  }


}