import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/rating_screen.dart';
import 'receipt.dart';
import 'package:qr_flutter/qr_flutter.dart';


class BookingConfirmed extends StatelessWidget {


  final String vehicleNumber;
  final String vehicleType;
  final String parkingSlot;



  const BookingConfirmed({

    super.key,

    required this.vehicleNumber,

    required this.vehicleType,

    required this.parkingSlot,

  });



  @override
  Widget build(BuildContext context) {


    final bookingId =
        "PE${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}";


    final bookingDate =
        "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";



    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.blue,

        centerTitle: true,

        title: const Text(

          "Booking Confirmed",

          style: TextStyle(

            color: Colors.white,

          ),

        ),

      ),



      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [


            const Icon(

              Icons.check_circle,

              color: Colors.green,

              size:100,

            ),



            const SizedBox(height:15),



            const Text(

              "Booking Successful!",

              style:TextStyle(

                fontSize:28,

                fontWeight:FontWeight.bold,

              ),

            ),



            const SizedBox(height:20),



            Card(

              elevation:4,

              child:Padding(

                padding:const EdgeInsets.all(15),

                child:Column(

                  children:[


                    details("Booking ID", bookingId),

                    details("Date", bookingDate),

                    details("Parking", "City Mall Parking"),

                    details("Slot", parkingSlot),

                    details("Vehicle Number", vehicleNumber),

                    details("Vehicle Type", vehicleType),

                    details("Amount", "₹30"),

                    details("Status", "Confirmed"),


                  ],

                ),

              ),

            ),


            const SizedBox(height:25),
                        QrImageView(

              data: """

ParkEasy Booking

Booking ID: $bookingId
Parking: City Mall Parking
Slot: $parkingSlot
Vehicle: $vehicleNumber
Vehicle Type: $vehicleType
Date: $bookingDate
Amount: ₹30
Status: Confirmed

""",

              version:QrVersions.auto,

              size:220,

            ),



            const SizedBox(height:10),



            const Text(

              "Show this QR at Parking Entry",

              style:TextStyle(

                fontWeight:FontWeight.bold,

                color:Colors.grey,

              ),

            ),



            const SizedBox(height:25),



            // Download Receipt Button

            SizedBox(

              width:double.infinity,

              child:ElevatedButton.icon(

                icon:const Icon(Icons.download),

                label:const Text(
                  "Download Receipt",
                ),

                style:ElevatedButton.styleFrom(

                  backgroundColor:Colors.green,

                  foregroundColor:Colors.white,

                  padding:const EdgeInsets.symmetric(
                    vertical:15,
                  ),

                ),


                onPressed:(){


                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder:(context)=>ReceiptPage(

                        bookingId:bookingId,

                        vehicleNumber:vehicleNumber,

                        vehicleType:vehicleType,

                        date:bookingDate,

                      ),

                    ),

                  );


                },

              ),

            ),



            const SizedBox(height:15),



            // ⭐ Rate Parking Button

            SizedBox(

              width:double.infinity,

              child:ElevatedButton.icon(

                icon:const Icon(Icons.star),

                label:const Text(
                  "Rate Parking",
                ),

                style:ElevatedButton.styleFrom(

                  backgroundColor:Colors.orange,

                  foregroundColor:Colors.white,

                  padding:const EdgeInsets.symmetric(
                    vertical:15,
                  ),

                ),


                onPressed:(){


                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder:(context)=>const RatingScreen(),

                    ),

                  );


                },

              ),

            ),



            const SizedBox(height:15),



            // Home Button

            SizedBox(

              width:double.infinity,

              child:ElevatedButton.icon(

                icon:const Icon(Icons.home),

                label:const Text(
                  "Go Home",
                ),


                style:ElevatedButton.styleFrom(

                  backgroundColor:Colors.blue,

                  foregroundColor:Colors.white,

                  padding:const EdgeInsets.symmetric(
                    vertical:15,
                  ),

                ),



                onPressed:(){


                  Navigator.pushAndRemoveUntil(

                    context,

                    MaterialPageRoute(

                      builder:(context)=>const HomeScreen(),

                    ),

                    (route)=>false,

                  );


                },

              ),

            ),


          ],

        ),

      ),

    );


  }



  Widget details(String title,String value){


    return ListTile(

      title:Text(title),


      trailing:Text(

        value,

        style:const TextStyle(

          fontWeight:FontWeight.bold,

        ),

      ),

    );


  }


}