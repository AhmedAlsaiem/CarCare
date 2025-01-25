import 'package:flutter/material.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/service_item.dart';

class ServicesHomeView extends StatefulWidget {
  const ServicesHomeView({
    super.key,
  
  });

  @override
  State<ServicesHomeView> createState() => _ServicesHomeViewState();
}

class _ServicesHomeViewState extends State<ServicesHomeView> {
  // final List<ServiceItem> itemsSevice;
  final List<ServiceItem> itemsSevice = [
    const ServiceItem(
      title: StringsManager.winch,
      subTitle: StringsManager.describationOfWinch,
      imagePath: AssetsManager.winsh,
      pageNavigate: AppRoutes.wichCarView,
    ),
    const ServiceItem(
      title: StringsManager.tires,
      subTitle: StringsManager.describationOfTires,
      imagePath: AssetsManager.tair,
      pageNavigate: AppRoutes.tireCarView,
    ),
    const ServiceItem(
      title: StringsManager.fuel,
      subTitle: StringsManager.describationOfFuel,
      imagePath: AssetsManager.fuel,
      pageNavigate: AppRoutes.fuelCarView,
    ),
    const ServiceItem(
      title: StringsManager.batteries,
      subTitle: StringsManager.describationOfBatteries,
      imagePath: AssetsManager.battery,
      pageNavigate: AppRoutes.batteriesCarView,
    ),
    const ServiceItem(
      title: StringsManager.oil,
      subTitle: StringsManager.describationOfOil,
      imagePath: AssetsManager.oil,
      pageNavigate: AppRoutes.oilCarView,
    ),
    const ServiceItem(
      title: StringsManager.washing,
      subTitle: StringsManager.describationOfWashing,
      imagePath: AssetsManager.washing,
      pageNavigate: AppRoutes.washingCarView,

      //imagePath: 'assets/images/test.png',
    ),
    const ServiceItem(
      title: StringsManager.parking,
      subTitle: StringsManager.describationOfParking,
      imagePath: AssetsManager.parking,
      pageNavigate: AppRoutes.parkingCarView,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          mainAxisSpacing: 16,
          crossAxisSpacing: 0,
          childAspectRatio: .8, // Adjust aspect ratio as needed
        ),
        itemCount: itemsSevice.length,
        itemBuilder: (context, index) {
          return itemsSevice[index];
        },
      ),
    );
  }
}
