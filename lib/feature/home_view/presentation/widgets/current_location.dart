// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';


// class CurrentLocation extends StatefulWidget {
//   const CurrentLocation({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _CurrentLocationState createState() => _CurrentLocationState();
// }

// class _CurrentLocationState extends State<CurrentLocation> {
//   GoogleMapController? _mapController;
//   LatLng? _userLocation;
//   final Location _locationService = Location();

//   @override
//   void initState() {
//     super.initState();
//     getUserLocation();
//   }

//   /// Get user’s current location
//   Future<void> getUserLocation() async {
//     bool serviceEnabled = await _locationService.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await _locationService.requestService();
//       if (!serviceEnabled) return;
//     }

//     PermissionStatus permission = await _locationService.hasPermission();
//     if (permission == PermissionStatus.denied) {
//       permission = await _locationService.requestPermission();
//       if (permission != PermissionStatus.granted) return;
//     }

//     final locationData = await _locationService.getLocation();
//     setState(() {
//       _userLocation = LatLng(locationData.latitude!, locationData.longitude!);
//     });

//     // Move camera to user’s location
//     if (_mapController != null) {
//       _mapController!.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(target: _userLocation!, zoom: 15.0),
//         ),
//       );
//     }
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//     if (_userLocation != null) {
//       _mapController!.animateCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(target: _userLocation!, zoom: 15.0),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Google Maps - Current Location')),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _userLocation ?? const LatLng(37.7749, -122.4194), // Default to SF
//           zoom: 14.0,
//         ),
//         markers: _userLocation != null
//             ? {
//                 Marker(
//                   markerId: const MarkerId('currentLocation'),
//                   position: _userLocation!,
//                   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//                   infoWindow: const InfoWindow(title: 'You are here'),
//                 )
//               }
//             : {},
//         myLocationEnabled: true, // Shows blue dot for user's location
//         myLocationButtonEnabled: true, // Enables "My Location" button
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (_userLocation != null) {
//             _mapController!.animateCamera(
//               CameraUpdate.newCameraPosition(
//                 CameraPosition(target: _userLocation!, zoom: 15.0),
//               ),
//             );
//           }
//         },
//         child: const Icon(Icons.my_location),
//       ),
//     );
//   }
// }
