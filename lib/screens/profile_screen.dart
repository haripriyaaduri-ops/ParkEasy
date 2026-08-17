import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'edit_profile_screen.dart';
import 'login_screen.dart';
import 'admin_add_parking_screen.dart';

import '../user_data.dart';
import '../theme_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();

        if (snapshot.exists) {
          final data = snapshot.data()!;

          UserData.name = data["name"] ?? "";
          UserData.email = data["email"] ?? "";
          UserData.vehicleType = data["vehicleType"] ?? "Car";
          UserData.vehicleNumber = data["vehicleNumber"] ?? "";
        }
      }
    } catch (e) {
      debugPrint("Profile loading error: $e");
    }

    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    UserData.name.isEmpty
                        ? "Driver"
                        : UserData.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  profileItem(
                    Icons.person,
                    "Name",
                    UserData.name.isEmpty
                        ? "Not added"
                        : UserData.name,
                  ),

                  profileItem(
                    Icons.email,
                    "Email",
                    UserData.email,
                  ),

                  profileItem(
                    Icons.directions_car,
                    "Vehicle Type",
                    UserData.vehicleType,
                  ),

                  profileItem(
                    Icons.confirmation_number,
                    "Vehicle Number",
                    UserData.vehicleNumber.isEmpty
                        ? "Not added"
                        : UserData.vehicleNumber,
                  ),

                  Card(
                    elevation: 3,
                    child: SwitchListTile(
                      title: const Text(
                        "Dark Mode",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      secondary: const Icon(
                        Icons.dark_mode,
                        color: Colors.blue,
                      ),

                      value: context
                          .watch<ThemeProvider>()
                          .isDark,

                      onChanged: (value) {
                        context
                            .read<ThemeProvider>()
                            .toggleTheme();
                      },
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const EditProfileScreen(),
                          ),
                        );

                        // Edit Profile nunchi back vachaka
                        // Firebase nunchi latest data load chestundi.
                        await loadProfile();
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(15),
                      ),

                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ADMIN ADD PARKING BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.local_parking,
                      ),

                      label: const Text(
                        "Add Parking (Admin)",
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AdminAddParkingScreen(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        final prefs =
                            await SharedPreferences
                                .getInstance();

                        await prefs.setBool(
                          "isLogin",
                          false,
                        );

                        await FirebaseAuth.instance
                            .signOut();

                        if (!mounted) return;

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LoginScreen(),
                          ),
                        );
                      },

                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget profileItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(
        bottom: 12,
      ),

      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blue,
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          value,
        ),
      ),
    );
  }
}