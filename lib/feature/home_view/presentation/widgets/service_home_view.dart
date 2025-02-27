import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/service_item.dart';
import 'package:splash_app/feature/map/map_view.dart';

class ServicesHomeView extends StatefulWidget {
  const ServicesHomeView({
    super.key,
  });

  @override
  State<ServicesHomeView> createState() => _ServicesHomeViewState();
}

class _ServicesHomeViewState extends State<ServicesHomeView> {
  @override
  Widget build(BuildContext context) {
    final List<ServiceItem> itemsSevice = [
      ServiceItem(
        title: StringsManager.winch,
        subTitle: StringsManager.describationOfWinch,
        imagePath: 'assets/images/test4.png',
        ontap: () {
          NavigatorManager.pushName(
            context: context,
            route: AppRoutes.wichCarView,
          );
        },
      ),
      ServiceItem(
        title: StringsManager.tires,
        subTitle: StringsManager.describationOfTires,
        imagePath: 'assets/images/test3.png',
        ontap: () {
          NavigatorManager.pushName(
            context: context,
            route: AppRoutes.tireCarView,
          );
        },
      ),
      ServiceItem(
        title: StringsManager.fuel,
        subTitle: StringsManager.describationOfFuel,
        imagePath: 'assets/images/test2.png',
        ontap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MapView(nameOfServce: 'fuel')));
        },
      ),
      ServiceItem(
        title: StringsManager.batteries,
        subTitle: StringsManager.describationOfBatteries,
        imagePath: 'assets/images/test1.png',
        ontap: () {
          NavigatorManager.pushName(
            context: context,
            route: AppRoutes.batteriesCarView,
          );
        },
      ),
      ServiceItem(
        title: StringsManager.oil,
        subTitle: StringsManager.describationOfOil,
        imagePath: 'assets/images/test5.png',
        ontap: () {
          NavigatorManager.pushName(
            context: context,
            route: AppRoutes.oilCarView,
          );
        },
      ),
      ServiceItem(
        title: StringsManager.washing,
        subTitle: StringsManager.describationOfWashing,
        imagePath: 'assets/images/test4.png',
        ontap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MapView(nameOfServce: 'car_wash')));
        },
      ),
      ServiceItem(
        title: StringsManager.parking,
        subTitle: StringsManager.describationOfParking,
        imagePath: AssetsManager.parking,
        ontap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MapView(nameOfServce: 'parking')));
        },
      ),
      ServiceItem(
        title: StringsManager.mechanic,
        subTitle: StringsManager.describationOfMechanic,
        imagePath: 'assets/images/test6.png',
        ontap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MapView(nameOfServce: 'car_repair')));
        },
      ),
    ];

    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          mainAxisSpacing: 12,
          crossAxisSpacing: 2,
          childAspectRatio: 0.88, // Adjust aspect ratio as needed
        ),
        itemCount: itemsSevice.length,
        itemBuilder: (context, index) {
          return itemsSevice[index];
        },
      ),
    );
  }
}
