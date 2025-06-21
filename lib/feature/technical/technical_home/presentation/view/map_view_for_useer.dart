import 'package:flutter/material.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/custom_my_car_app_bar.dart';

class MapViewForUseer extends StatelessWidget {
  const MapViewForUseer({super.key});

//   const MapViewForUseer({super.key, required this.latude, required this.longtide});
// final double latude;
// final double longtide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customMyCarAppBar(title:'Location'),
    // body:MapViewForUserBody( latitude: latude, longitude: longtide,), 
    );
  }
}
