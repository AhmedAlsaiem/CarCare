// import 'package:flutter/material.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:splash_app/feature/map/model/api.dart';
// import 'package:splash_app/feature/map/presentation/widgets/current_location.dart';
// import 'package:splash_app/feature/map/model/service_location.dart';
// import 'package:splash_app/feature/map/presentation/widgets/map_servce.dart';

// class RestaurantListScreen extends StatefulWidget {
//   const RestaurantListScreen({super.key });

//   @override
//   _RestaurantListScreenState createState() => _RestaurantListScreenState();
// }

// class _RestaurantListScreenState extends State<RestaurantListScreen> {
//   List<ServiceLocation> restaurants = [];
//   bool isLoading = true;
//   String errorMessage = '';
//   LatLng? userLocation;
//   LatLng? selectedRestaurantLocation;
  

//   final MapService _mapService = MapService();
//   final ApiService _apiService = ApiService();
//   final CurrentLocation _locationService = CurrentLocation();

//   @override
//   void initState() {
//     super.initState();
//     _initializeLocationAndFetchRestaurants();
//   }

//   Future<void> _initializeLocationAndFetchRestaurants() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = '';
//     });

//     try {
//       userLocation = await _locationService.getCurrentLocation();
//       if (userLocation == null) {
//         throw Exception('Unable to fetch user location.');
//       }

//       final fetchedRestaurants =
//           await _apiService.fetchNearbyRestaurants(userLocation!);
//       setState(() {
//         restaurants = fetchedRestaurants;
//       });
//     } catch (e) {
//       setState(() {
//         errorMessage = e.toString();
//       });
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   void _onRestaurantSelected(LatLng destination) async {
//     setState(() {
//       selectedRestaurantLocation = destination;
//       _mapService.routeCoordinates = []; // Clear previous route
//     });

//     // Fetch route using OpenRouteService
//     List<LatLng> newRoute =
//         await _apiService.fetchRoute(userLocation!, destination);

//     setState(() {
//       _mapService.routeCoordinates = newRoute; // Update route polyline
//     });

//     // Move the map to show the selected location
//     _mapService.moveToLocation(destination, 15.0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Nearby Restaurants'),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : errorMessage.isNotEmpty
//               ? Center(child: Text(errorMessage))
//               : Column(
//                   children: [
//                     Expanded(
//                       flex: 2,
//                       child: _mapService.buildMapLayer(userLocation,
//                           restaurants, selectedRestaurantLocation),
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: restaurants.isEmpty
//                           ? const Center(
//                               child: Text('No restaurants found nearby.'))
//                           : ListView.builder(
//                               itemCount: restaurants.length,
//                               itemBuilder: (context, index) {
//                                 final restaurant = restaurants[index];
//                                 return ListTile(
//                                   title: Text(
//                                     restaurant.name,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(color: Colors.blue),
//                                   ),
//                                   subtitle: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(restaurant.address),
//                                       Text(
//                                         'Travel time: ${restaurant.travelTime ~/ 60} minutes',
//                                       ),
//                                       const Divider(),
//                                     ],
//                                   ),
//                                   onTap: () {
//                                     _onRestaurantSelected(restaurant.location);
//                                   },
//                                 );
//                               },
//                             ),
//                     ),
//                   ],
//                 ),
//     );
//   }
// }
