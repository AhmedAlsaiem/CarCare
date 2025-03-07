
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/my_car_item.dart';

class CustomCarItemSkeltonizerLoading extends StatelessWidget {
  const CustomCarItemSkeltonizerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        containersColor: ColorsManager.lightGrey,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return const MyCarItem(
              car: CarEntity(
                  model: '',
                  id: 0,
                  color: '',
                  year: 0,
                  vinNumber: '',
                  plateNumber: ''),
            );
          },
          itemCount: 10,
        ));
  }
}
