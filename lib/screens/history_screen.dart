import 'package:flutter/material.dart';
import '../booking_data.dart';


class HistoryScreen extends StatefulWidget {

  const HistoryScreen({super.key});


  @override
  State<HistoryScreen> createState() => _HistoryScreenState();

}



class _HistoryScreenState extends State<HistoryScreen> {


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

        centerTitle:true,


      ),



      body: BookingData.history.isEmpty


          ? const Center(


              child: Text(


                "No Booking History",


                style: TextStyle(


                  fontSize:22,


                  fontWeight:FontWeight.bold,


                ),


              ),


            )



          : ListView.builder(


              padding:const EdgeInsets.all(15),


              itemCount:BookingData.history.length,


              itemBuilder:(context,index){


                var booking = BookingData.history[index];



                bool cancelled =
                    booking["status"] == "Cancelled";



                return Card(


                  elevation:5,


                  margin:const EdgeInsets.only(bottom:15),



                  child:Padding(


                    padding:const EdgeInsets.all(15),



                    child:Column(


                      crossAxisAlignment:CrossAxisAlignment.start,


                      children:[



                        Text(


                          booking["parking"] ?? "",


                          style:const TextStyle(


                            fontSize:20,


                            fontWeight:FontWeight.bold,


                          ),


                        ),



                        const SizedBox(height:10),



                        Text(

                          "Slot: ${booking["slot"] ?? ""}",

                        ),



                        Text(

                          "Vehicle: ${booking["vehicle"] ?? ""}",

                        ),



                        Text(

                          "Type: ${booking["type"] ?? ""}",

                        ),



                        Text(

                          "Amount: ${booking["amount"] ?? ""}",

                        ),



                        const Text(

                          "Payment Method: UPI",

                        ),



                        Text(

                          "Date: ${booking["date"] ?? ""}",

                        ),



                        Text(

                          "Status: ${booking["status"] ?? ""}",


                          style:TextStyle(


                            color: cancelled

                                ? Colors.red

                                : Colors.green,


                            fontWeight:FontWeight.bold,


                          ),

                        ),




                        const SizedBox(height:15),




                        Row(


                          mainAxisAlignment:
                          MainAxisAlignment.end,


                          children:[



                            if(!cancelled)

                            ElevatedButton.icon(


                              onPressed:(){


                                setState((){


                                  BookingData.history[index]
                                  ["status"] =

                                  "Cancelled";


                                });


                              },


                              icon:const Icon(

                                Icons.cancel,

                              ),


                              label:const Text(

                                "Cancel",

                              ),


                              style:ElevatedButton.styleFrom(


                                backgroundColor:Colors.red,


                                foregroundColor:Colors.white,


                              ),


                            ),




                            const SizedBox(width:10),




                            IconButton(


                              icon:const Icon(


                                Icons.delete,


                                color:Colors.red,


                              ),



                              onPressed:(){


                                setState((){


                                  BookingData.history
                                  .removeAt(index);


                                });


                              },

                            ),



                          ],


                        )



                      ],


                    ),


                  ),


                );


              },


            ),



    );


  }


}