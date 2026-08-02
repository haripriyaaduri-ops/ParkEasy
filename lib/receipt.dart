import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


class ReceiptPage extends StatelessWidget {

  final String bookingId;
  final String vehicleNumber;
  final String vehicleType;
  final String date;


  const ReceiptPage({

    super.key,

    required this.bookingId,
    required this.vehicleNumber,
    required this.vehicleType,
    required this.date,

  });



  Future<void> generatePDF() async {

    final pdf = pw.Document();


    pdf.addPage(

      pw.Page(

        build: (context) {

          return pw.Column(

            crossAxisAlignment: pw.CrossAxisAlignment.start,

            children: [

              pw.Text(
                "ParkEasy Receipt",
                style: pw.TextStyle(
                  fontSize: 24,
                ),
              ),


              pw.SizedBox(height: 20),


              pw.Text("Booking ID: $bookingId"),
              pw.Text("Date: $date"),
              pw.Text("Parking: City Mall Parking"),
              pw.Text("Slot: A1"),
              pw.Text("Vehicle Number: $vehicleNumber"),
              pw.Text("Vehicle Type: $vehicleType"),
              pw.Text("Amount: Rs 30"),
              pw.Text("Status: Confirmed"),

            ],

          );

        },

      ),

    );


    await Printing.layoutPdf(

      onLayout: (format) async {

        return pdf.save();

      },

    );


  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.blue,

        title: const Text(

          "Receipt",

          style: TextStyle(

            color: Colors.white,

          ),

        ),

      ),


      body: Center(

        child: ElevatedButton.icon(

          icon: const Icon(Icons.download),

          label: const Text(

            "Download Receipt",

          ),

          onPressed: generatePDF,

        ),

      ),

    );

  }

}