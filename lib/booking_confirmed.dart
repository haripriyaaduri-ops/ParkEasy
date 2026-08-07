import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'screens/home_screen.dart';
import 'screens/rating_screen.dart';
import 'receipt.dart';
import 'booking_data.dart';


class BookingConfirmed extends StatefulWidget {


  final String parkingName;
  final String vehicleNumber;
  final String vehicleType;
  final String parkingSlot;
  final String duration;
  final int amount;



  const BookingConfirmed({

    super.key,

    required this.parkingName,
    required this.vehicleNumber,
    required this.vehicleType,
    required this.parkingSlot,
    required this.duration,
    required this.amount,

  });



  @override
  State<BookingConfirmed> createState() => _BookingConfirmedState();

}



class _BookingConfirmedState extends State<BookingConfirmed> {


  late String bookingId;
  late String bookingDate;



  @override
  void initState() {

    super.initState();


    bookingId =
        "PE${DateTime.now()
            .millisecondsSinceEpoch
            .toString()
            .substring(7)}";


    bookingDate =
        "${DateTime.now().day}-"
        "${DateTime.now().month}-"
        "${DateTime.now().year}";



    BookingData.history.add({

      "parking": widget.parkingName,
      "slot": widget.parkingSlot,
      "vehicle": widget.vehicleNumber,
      "type": widget.vehicleType,
      "duration": widget.duration,
      "amount": "₹${widget.amount}",
      "date": bookingDate,
      "status": "Confirmed",

    });



    saveBooking();

  }






  Future<void> saveBooking() async {


    print("BOOKING PARKING = ${widget.parkingName}");



    await FirebaseFirestore.instance
        .collection("bookings")
        .add({


      "bookingId": bookingId,


      "parking": widget.parkingName,


      "slot": widget.parkingSlot,


      "vehicleNumber": widget.vehicleNumber,


      "vehicleType": widget.vehicleType,


      "duration": widget.duration,


      "amount": widget.amount,


      "date": bookingDate,


      "status": "Confirmed",


      "createdAt": Timestamp.now(),


    });


  }






  Future<void> cancelBooking() async {


    // latest booking cancel


    QuerySnapshot query =
    await FirebaseFirestore.instance
        .collection("bookings")
        .where(
        "bookingId",
        isEqualTo: bookingId
    )
        .get();



    for(var doc in query.docs){


      await doc.reference.update({


        "status":"Cancelled",


      });


    }



    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
            "Booking Cancelled"
        ),

      ),

    );

  }







  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(


        title: const Text(

          "Booking Confirmed",

          style: TextStyle(

            color: Colors.white,

          ),

        ),


        backgroundColor: Colors.blue,

        centerTitle:true,


      ),




      body:SingleChildScrollView(


        padding:
        const EdgeInsets.all(20),


        child:Column(


          children:[


            const Icon(

              Icons.check_circle,

              color:Colors.green,

              size:100,

            ),



            const SizedBox(height:20),



            const Text(

              "Booking Successful!",

              style:TextStyle(

                fontSize:28,

                fontWeight:FontWeight.bold,

              ),

            ),




            const SizedBox(height:20),




            Card(


              child:Column(


                children:[


                  details(
                      "Booking ID",
                      bookingId
                  ),


                  details(
                      "Parking",
                      widget.parkingName
                  ),


                  details(
                      "Slot",
                      widget.parkingSlot
                  ),


                  details(
                      "Vehicle",
                      widget.vehicleNumber
                  ),


                  details(
                      "Vehicle Type",
                      widget.vehicleType
                  ),


                  details(
                      "Duration",
                      widget.duration
                  ),


                  details(
                      "Amount",
                      "₹${widget.amount}"
                  ),


                  details(
                      "Status",
                      "Confirmed"
                  ),



                ],

              ),

            ),






            const SizedBox(height:20),





            QrImageView(


              data:

              """
ParkEasy Booking

ID:$bookingId

Parking:${widget.parkingName}

Slot:${widget.parkingSlot}

Vehicle:${widget.vehicleNumber}

Amount:${widget.amount}

Status:Confirmed

""",


              size:220,

            ),






            const SizedBox(height:20),





            SizedBox(

              width:double.infinity,


              child:ElevatedButton.icon(


                icon:
                const Icon(Icons.cancel),


                label:
                const Text(
                    "Cancel Booking"
                ),


                onPressed:cancelBooking,


                style:ElevatedButton.styleFrom(

                  backgroundColor:Colors.red,

                  foregroundColor:Colors.white,

                ),


              ),

            ),






            const SizedBox(height:15),






            SizedBox(

              width:double.infinity,


              child:ElevatedButton.icon(


                icon:
                const Icon(Icons.download),


                label:
                const Text(
                    "Receipt"
                ),



                onPressed:(){


                  Navigator.push(


                    context,


                    MaterialPageRoute(


                      builder:(context)=>

                          ReceiptPage(


                            bookingId: bookingId,

                            vehicleNumber:
                            widget.vehicleNumber,

                            vehicleType:
                            widget.vehicleType,

                            date:
                            bookingDate,

                            duration:
                            widget.duration,

                            amount:
                            widget.amount,


                          ),


                    ),


                  );


                },


              ),


            ),







            const SizedBox(height:15),





            SizedBox(


              width:double.infinity,


              child:ElevatedButton.icon(


                icon:
                const Icon(Icons.star),


                label:
                const Text(
                    "Rate Parking"
                ),



                onPressed:(){


                  Navigator.push(


                    context,


                    MaterialPageRoute(


                     builder:(context)=> RatingScreen(
  parkingName: widget.parkingName,
),

                    ),


                  );


                },


              ),


            ),







            const SizedBox(height:15),






            SizedBox(


              width:double.infinity,


              child:ElevatedButton.icon(


                icon:
                const Icon(Icons.home),


                label:
                const Text(
                    "Home"
                ),



                onPressed:(){


                  Navigator.pushAndRemoveUntil(


                    context,


                    MaterialPageRoute(


                      builder:(context)=>

                      const HomeScreen(),


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

        style:
        const TextStyle(

          fontWeight:
          FontWeight.bold,

        ),

      ),


    );


  }


}