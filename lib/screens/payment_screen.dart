import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../booking_confirmed.dart';
import '../booking_data.dart';

class PaymentScreen extends StatefulWidget {
  final String vehicleNumber;
  final String vehicleType;
  final String parkingSlot;
  final String parkingName;
  final String parkingPrice;

  const PaymentScreen({
    super.key,
    required this.vehicleNumber,
    required this.vehicleType,
    required this.parkingSlot,
    required this.parkingName,
    required this.parkingPrice,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String paymentMethod = "UPI";

  String getCurrentDate() {
    DateTime now = DateTime.now();

    return "${now.day}-${now.month}-${now.year}";
  }

  Future<void> makePayment() async {
    try {
      final bookingId =
          "PE${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}";

      final bookingDate = getCurrentDate();

      await FirebaseFirestore.instance.collection("bookings").add({
        "bookingId": bookingId,
        "parking": widget.parkingName,
        "slot": widget.parkingSlot,
        "vehicleNumber": widget.vehicleNumber,
        "vehicleType": widget.vehicleType,
        "duration": "1 Hour",
        "amount": widget.parkingPrice,
        "date": bookingDate,
        "status": "Confirmed",
        "paymentMethod": paymentMethod,
        "createdAt": FieldValue.serverTimestamp(),
      });

      BookingData.history.add({
        "parking": widget.parkingName,
        "slot": widget.parkingSlot,
        "vehicle": widget.vehicleNumber,
        "type": widget.vehicleType,
        "amount": widget.parkingPrice,
        "date": bookingDate,
        "status": "Confirmed",
      });

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookingConfirmed(
            bookingId: bookingId,
            parkingName: widget.parkingName,
            parkingPrice: widget.parkingPrice,
            bookingDate: bookingDate,
            vehicleNumber: widget.vehicleNumber,
            vehicleType: widget.vehicleType,
            parkingSlot: widget.parkingSlot,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Booking failed: $e"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Payment",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Payment Method",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

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
              width: double.infinity,
              child: ElevatedButton(
                onPressed: makePayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  "Pay Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentOption(String title, IconData icon) {
    return Card(
      child: RadioListTile(
        value: title,
        groupValue: paymentMethod,
        onChanged: (value) {
          setState(() {
            paymentMethod = value.toString();
          });
        },
        title: Text(title),
        secondary: Icon(
          icon,
          color: Colors.blue,
        ),
      ),
    );
  }
}