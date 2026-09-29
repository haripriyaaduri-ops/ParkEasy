
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'parking_details_screen.dart';
import 'search_screen.dart';
import 'profile_screen.dart';
import 'history_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ParkEasy",
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
              "Hello, Driver 👋",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
              },

              child: Container(
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: const Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.blue,
                    ),

                    SizedBox(width: 10),

                    Text(
                      "Search Parking",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Available Parking",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("parkings")
                    .snapshots(),

                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: Text(
                        "Unable to load parking",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }

                  if (!snapshot.hasData ||
                      snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Parking Available",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }

                  final parkingDocs = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: parkingDocs.length,

                    itemBuilder: (context, index) {
                      final parking =
                          parkingDocs[index].data()
                              as Map<String, dynamic>;

                      final String name =
                          parking["name"]?.toString() ?? "";

                      final String slots =
                          "${parking["slots"] ?? 0} Slots Available";

                      final String price =
                          "₹${parking["price"] ?? 0}/hour";

                      final String latitude =
                          parking["latitude"]?.toString() ?? "";

                      final String longitude =
                          parking["longitude"]?.toString() ?? "";

                      return parkingCard(
                        context,
                        name,
                        slots,
                        price,
                        latitude,
                        longitude,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],

        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HistoryScreen(),
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          }
        },
      ),
    );
  }

  static Widget parkingCard(
    BuildContext context,
    String name,
    String slots,
    String price,
    String latitude,
    String longitude,
  ) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 15),

      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,

          child: Icon(
            Icons.local_parking,
            color: Colors.white,
          ),
        ),

        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(slots),

        trailing: Text(
          price,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),

        onTap: () {
          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) => ParkingDetails(
                name: name,
                slots: slots,
                price: price,
                latitude: latitude,
                longitude: longitude,
              ),
            ),
          );
        },
      ),
    );
  }
}

