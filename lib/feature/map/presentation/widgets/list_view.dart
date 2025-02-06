import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/map/model/service_location.dart';

class RestaurantList extends StatelessWidget {
  final List<ServiceLocation> restaurants;
  final Function(LatLng) onRestaurantSelected;

  const RestaurantList({
    super.key,
    required this.restaurants,
    required this.onRestaurantSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return ListTile(
          title: Text(
            restaurant.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:const  TextStyle(color: ColorsManager.mainColor),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(restaurant.address),
              Text(
                'Travel time: ${restaurant.travelTime ~/ 60} minutes',
              ),
              const Divider(),
            ],
          ),
          onTap: () {
            onRestaurantSelected(restaurant.location);
          },
        );
      },
    );
  }
}