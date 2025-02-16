import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/feature/authentaction/domain/entity/service_entities/service_entitiy.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_service_item.dart';

class CustomServiceItemListView extends StatelessWidget {
  const CustomServiceItemListView({super.key, required this.servicesList});
  final List<ServiceEntitiy> servicesList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.7,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: servicesList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSize.s8, horizontal: AppSize.s14),
              child: CustomServiceItem(
                service: servicesList[index],
              ),
            );
          }),
    );
  }
}
