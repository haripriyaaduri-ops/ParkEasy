import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/rating_screen.dart';
import 'receipt.dart';
import 'booking_data.dart';
import 'package:qr_flutter/qr_flutter.dart';



class BookingConfirmed extends StatefulWidget {


  final String vehicleNumber;
  final String vehicleType;
  final String parkingSlot;
  final String duration;
  final int amount;



  const BookingConfirmed({

    super.key,

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
  void initState(){

    super.initState();



    bookingId =
    "PE${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}";



    bookingDate =
    "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";



    // SAVE BOOKING HISTORY

    BookingData.history.add({

      "parking": "City Mall Parking",

      "slot": widget.parkingSlot,

      "vehicle": widget.vehicleNumber,

      "type": widget.vehicleType,

      "duration": widget.duration,

      "amount": "₹${widget.amount}",

      "date": bookingDate,

      "status": "Confirmed",

    });


  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(


        backgroundColor: Colors.blue,


        centerTitle:true,


        title:const Text(


          "Booking Confirmed",


          style:TextStyle(


            color:Colors.white,


          ),


        ),


      ),




      body:SingleChildScrollView(


        padding:const EdgeInsets.all(20),



        child:Column(


          children:[



            const Icon(


              Icons.check_circle,


              color:Colors.green,


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


                    details("Booking ID",bookingId),


                    details("Date",bookingDate),


                    details("Parking","City Mall Parking"),


                    details("Slot",widget.parkingSlot),


                    details("Vehicle Number",widget.vehicleNumber),


                    details("Vehicle Type",widget.vehicleType),


                    details("Duration",widget.duration),


                    details("Amount","₹${widget.amount}"),


                    details("Status","Confirmed"),



                  ],


                ),


              ),


            ),




            const SizedBox(height:25),




            QrImageView(


              data:"""

ParkEasy Booking

Booking ID: $bookingId

Parking: City Mall Parking

Slot: ${widget.parkingSlot}

Vehicle: ${widget.vehicleNumber}

Vehicle Type: ${widget.vehicleType}

Duration: ${widget.duration}

Amount: ₹${widget.amount}

Date: $bookingDate

Status: Confirmed

""",


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


                        vehicleNumber:widget.vehicleNumber,


                        vehicleType:widget.vehicleType,


                        date:bookingDate,


                        duration:widget.duration,


                        amount:widget.amount,


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

