import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_state.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/my_car_item.dart';

import '../widgets/custom_car_item_skeltonizer_loading.dart';

class MycarViewBody extends StatefulWidget {
  const MycarViewBody({super.key});

  @override
  State<MycarViewBody> createState() => _MycarViewBodyState();
}

class _MycarViewBodyState extends State<MycarViewBody> {
  List<CarEntity> carList = [];
  @override
  void initState() {
    BlocProvider.of<CarCubit>(context).getAllCarsForSepecificUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.mainColor,
      child: Container(
        decoration: const BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BlocBuilder<CarCubit, CarState>(
          builder: (context, state) {
            if (state is SuccessCarState) {
              carList = BlocProvider.of<CarCubit>(context).userCarList;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return MyCarItem(
                    car: carList[index],
                  );
                },
                itemCount: carList.length,
              );
            } else if (state is IsLoadingCarState) {
              return const CustomCarItemSkeltonizerLoading();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
