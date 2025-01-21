import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/service_item.dart';

class ServicesHomeView extends StatefulWidget {
  const ServicesHomeView({
    super.key,
    // required this.itemsSevice,
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
    ),
    const ServiceItem(
      title: StringsManager.tires,
      subTitle: StringsManager.describationOfTires,
      imagePath: AssetsManager.tair,
    ),
    const ServiceItem(
      title: StringsManager.fuel,
      subTitle: StringsManager.describationOfFuel,
      imagePath: AssetsManager.fuel,
    ),
    const ServiceItem(
      title: StringsManager.batteries,
      subTitle: StringsManager.describationOfBatteries,
      imagePath: AssetsManager.battery,
    ),
    const ServiceItem(
      title: StringsManager.oil,
      subTitle: StringsManager.describationOfOil,
      imagePath:AssetsManager.oil,
    ),
    const ServiceItem(
      title: StringsManager.washing,
      subTitle: StringsManager.describationOfWashing,
      imagePath:AssetsManager.washing,
    ),
    const ServiceItem(
      title: StringsManager.parking,
      subTitle: StringsManager.describationOfParking,
      imagePath: AssetsManager.parking,
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
