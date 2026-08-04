import 'package:flutter/material.dart';
import 'screens/booking_screen.dart';


class SlotSelection extends StatefulWidget {

  final String vehicleNumber;
  final String vehicleType;
  final String duration;
  final int amount;


  const SlotSelection({

    super.key,

    required this.vehicleNumber,

    required this.vehicleType,

    required this.duration,

    required this.amount,

  });


  @override
  State<SlotSelection> createState() => _SlotSelectionState();

}



class _SlotSelectionState extends State<SlotSelection> {


  int? selectedSlot;



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title: const Text(

          "Select Parking Slot",

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

              "City Mall Parking",

              style: TextStyle(

                fontSize:24,

                fontWeight:FontWeight.bold,

              ),

            ),



            const SizedBox(height:10),



            const Text(

              "Choose your parking slot",

              style:TextStyle(

                fontSize:16,

                color:Colors.grey,

              ),

            ),



            const SizedBox(height:25),



            Expanded(

              child: GridView.builder(

                itemCount:12,


                gridDelegate:

                const SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount:3,

                  crossAxisSpacing:15,

                  mainAxisSpacing:15,

                ),



                itemBuilder:(context,index){


                  bool booked = index == 2 || index == 6;


                  bool selected = selectedSlot == index;



                  return GestureDetector(


                    onTap: booked ? null : (){


                      setState((){

                        selectedSlot = index;

                      });


                    },



                    child:Container(


                      decoration:BoxDecoration(


                        color:

                        booked

                        ? Colors.red

                        : selected

                        ? Colors.blue

                        : Colors.green,


                        borderRadius:

                        BorderRadius.circular(15),


                      ),



                      child:Center(


                        child:Text(

                          "A${index+1}",


                          style:const TextStyle(

                            color:Colors.white,

                            fontSize:22,

                            fontWeight:FontWeight.bold,

                          ),

                        ),

                      ),


                    ),


                  );


                },


              ),

            ),



            SizedBox(

              width:double.infinity,


              child:ElevatedButton(


                onPressed:selectedSlot == null

                ? null

                : (){


                  String slotName = "A${selectedSlot! + 1}";



                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder:(context)=>BookingScreen(


                        vehicleNumber: widget.vehicleNumber,


                        vehicleType: widget.vehicleType,


                        parkingSlot: slotName,


                        duration: widget.duration,


                        amount: widget.amount,


                      ),

                    ),

                  );


                },


                style:ElevatedButton.styleFrom(

                  backgroundColor:Colors.blue,

                  padding:const EdgeInsets.all(15),

                ),



                child:const Text(

                  "Confirm Slot",

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