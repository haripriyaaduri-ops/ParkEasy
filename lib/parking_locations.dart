class ParkingLocation {
  final String city;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final int slots;
  final int price;

  ParkingLocation({
    required this.city,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.slots,
    required this.price,
  });
}

final List<ParkingLocation> parkingLocations = [

  // ================= HYDERABAD =================

  ParkingLocation(
    city: "Hyderabad",
    name: "Charminar Parking",
    address: "Charminar, Hyderabad",
    latitude: 17.3616,
    longitude: 78.4747,
    slots: 120,
    price: 40,
  ),

  ParkingLocation(
    city: "Hyderabad",
    name: "HITEC City Parking",
    address: "HITEC City, Hyderabad",
    latitude: 17.4435,
    longitude: 78.3772,
    slots: 180,
    price: 60,
  ),

  ParkingLocation(
    city: "Hyderabad",
    name: "Gachibowli Parking",
    address: "Gachibowli, Hyderabad",
    latitude: 17.4401,
    longitude: 78.3489,
    slots: 150,
    price: 50,
  ),

  // ================= VIJAYAWADA =================

  ParkingLocation(
    city: "Vijayawada",
    name: "Railway Station Parking",
    address: "Railway Station, Vijayawada",
    latitude: 16.5183,
    longitude: 80.6203,
    slots: 100,
    price: 40,
  ),

  ParkingLocation(
    city: "Vijayawada",
    name: "PNBS Parking",
    address: "PNBS Bus Stand, Vijayawada",
    latitude: 16.5069,
    longitude: 80.6488,
    slots: 120,
    price: 30,
  ),

  // ================= VISAKHAPATNAM =================

  ParkingLocation(
    city: "Visakhapatnam",
    name: "RK Beach Parking",
    address: "RK Beach Road, Visakhapatnam",
    latitude: 17.7147,
    longitude: 83.3237,
    slots: 90,
    price: 40,
  ),

  ParkingLocation(
    city: "Visakhapatnam",
    name: "Visakhapatnam Railway Parking",
    address: "Railway Station, Visakhapatnam",
    latitude: 17.7220,
    longitude: 83.3061,
    slots: 130,
    price: 50,
  ),

  // ================= BENGALURU =================

  ParkingLocation(
    city: "Bengaluru",
    name: "MG Road Parking",
    address: "MG Road, Bengaluru",
    latitude: 12.9758,
    longitude: 77.6055,
    slots: 180,
    price: 60,
  ),

  ParkingLocation(
    city: "Bengaluru",
    name: "Majestic Parking",
    address: "Majestic Bus Stand, Bengaluru",
    latitude: 12.9784,
    longitude: 77.5720,
    slots: 220,
    price: 70,
  ),

  // ================= CHENNAI =================

  ParkingLocation(
    city: "Chennai",
    name: "Chennai Central Parking",
    address: "Chennai Central Railway Station",
    latitude: 13.0827,
    longitude: 80.2707,
    slots: 200,
    price: 50,
  ),

];