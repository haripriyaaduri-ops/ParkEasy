import 'package:flutter/material.dart';
import '../booking_confirmed.dart';
import '../booking_data.dart';


class PaymentScreen extends StatefulWidget {

  final String vehicleNumber;
  final String vehicleType;
  final String parkingSlot;


  const PaymentScreen({

    super.key,

    required this.vehicleNumber,
    required this.vehicleType,
    required this.parkingSlot,

  });


  @override
  State<PaymentScreen> createState() => _PaymentScreenState();

}



class _PaymentScreenState extends State<PaymentScreen> {


  String paymentMethod = "UPI";


  String getCurrentDate(){

    DateTime now = DateTime.now();

    return "${now.day}-${now.month}-${now.year}";

  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.blue,

        centerTitle:true,

        title: const Text(

          "Payment",

          style:TextStyle(

            color:Colors.white,

          ),

        ),

      ),



      body:Padding(

        padding:const EdgeInsets.all(20),

        child:Column(

          crossAxisAlignment:CrossAxisAlignment.start,

          children:[


            const Text(

              "Select Payment Method",

              style:TextStyle(

                fontSize:24,

                fontWeight:FontWeight.bold,

              ),

            ),



            const SizedBox(height:20),



            paymentOption(
              "UPI",
              Icons.account_balance_wallet,
            ),



            paymentOption(
              "Credit / Debit Card",
              Icons.credit_card,
            ),



            paymentOption(
              "Cash",
              Icons.money,
            ),



            const Spacer(),



            SizedBox(

              width:double.infinity,

              child:ElevatedButton(

                onPressed:(){


                  BookingData.history.add({

                    "parking":"City Mall Parking",

                    "slot":widget.parkingSlot,

                    "vehicle":widget.vehicleNumber,

                    "type":widget.vehicleType,

                    "amount":"₹30",

                    "date":getCurrentDate(),

                    "status":"Confirmed",

                  });



                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder:(context)=>BookingConfirmed(

                        vehicleNumber:widget.vehicleNumber,

                        vehicleType:widget.vehicleType,

                        parkingSlot:widget.parkingSlot,

                      ),

                    ),

                  );


                },


                style:ElevatedButton.styleFrom(

                  backgroundColor:Colors.blue,

                  padding:const EdgeInsets.all(15),

                ),



                child:const Text(

                  "Pay Now",

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





  Widget paymentOption(String title, IconData icon){

    return Card(

      child:RadioListTile(

        value:title,

        groupValue:paymentMethod,

        onChanged:(value){

          setState((){

            paymentMethod=value.toString();

          });

        },

        title:Text(title),

        secondary:Icon(

          icon,

          color:Colors.blue,

        ),

      ),

    );

  }


}