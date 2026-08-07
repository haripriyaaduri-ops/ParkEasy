import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HistoryScreen extends StatefulWidget {

  const HistoryScreen({super.key});


  @override
  State<HistoryScreen> createState() =>
      _HistoryScreenState();

}




class _HistoryScreenState extends State<HistoryScreen> {



  Future<void> cancelBooking(String bookingId) async {


    await FirebaseFirestore.instance
        .collection("bookings")
        .doc(bookingId)
        .update({

      "status": "Cancelled",

    });



  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(


        title: const Text(

          "Booking History",

          style: TextStyle(

            color: Colors.white,

          ),

        ),


        backgroundColor: Colors.blue,

        centerTitle: true,


      ),




      body: StreamBuilder<QuerySnapshot>(



        stream: FirebaseFirestore.instance
            .collection("bookings")
            .orderBy(
            "createdAt",
            descending: true
        )
            .snapshots(),





        builder: (context, snapshot) {



          if(snapshot.connectionState ==
              ConnectionState.waiting) {


            return const Center(

              child: CircularProgressIndicator(),

            );


          }





          if(!snapshot.hasData ||
              snapshot.data!.docs.isEmpty) {



            return const Center(


              child: Text(


                "No Booking History",


                style: TextStyle(


                  fontSize:22,

                  fontWeight:
                  FontWeight.bold,

                ),


              ),


            );


          }






          var bookings =
              snapshot.data!.docs;





          return ListView.builder(



            padding:
            const EdgeInsets.all(15),



            itemCount:
            bookings.length,




            itemBuilder:(context,index){



              var booking =
              bookings[index];



              bool cancelled =
                  booking["status"] ==
                      "Cancelled";





              return Card(


                elevation:5,


                margin:
                const EdgeInsets.only(
                    bottom:15
                ),




                child:Padding(



                  padding:
                  const EdgeInsets.all(15),



                  child:Column(



                    crossAxisAlignment:
                    CrossAxisAlignment.start,



                    children:[




                      Text(



                        booking["parking"],



                        style:
                        const TextStyle(



                          fontSize:22,


                          fontWeight:
                          FontWeight.bold,



                        ),



                      ),





                      const SizedBox(
                          height:10
                      ),





                      Text(

                        "Booking ID: ${booking["bookingId"]}",

                      ),





                      Text(

                        "Slot: ${booking["slot"]}",

                      ),





                      Text(

                        "Vehicle Number: ${booking["vehicleNumber"]}",

                      ),





                      Text(

                        "Vehicle Type: ${booking["vehicleType"]}",

                      ),





                      Text(

                        "Duration: ${booking["duration"]}",

                      ),





                      Text(

                        "Amount: ₹${booking["amount"]}",

                      ),





                      Text(

                        "Date: ${booking["date"]}",

                      ),






                      Text(



                        "Status: ${booking["status"]}",



                        style: TextStyle(



                          color:
                          cancelled
                              ? Colors.red
                              : Colors.green,



                          fontWeight:
                          FontWeight.bold,



                        ),



                      ),






                      const SizedBox(
                          height:15
                      ),






                      if(!cancelled)

                        SizedBox(


                          width:
                          double.infinity,



                          child:
                          ElevatedButton(



                            onPressed:() async {



                              await cancelBooking(
                                  booking.id
                              );



                              if(context.mounted){



                                ScaffoldMessenger.of(context)
                                    .showSnackBar(



                                  const SnackBar(



                                    content:
                                    Text(
                                      "Booking Cancelled Successfully",
                                    ),



                                  ),



                                );


                              }



                            },



                            style:
                            ElevatedButton.styleFrom(



                              backgroundColor:
                              Colors.red,



                              foregroundColor:
                              Colors.white,



                            ),



                            child:
                            const Text(
                                "Cancel Booking"
                            ),



                          ),



                        ),





                    ],



                  ),



                ),



              );



            },



          );



        },



      ),



    );


  }


}