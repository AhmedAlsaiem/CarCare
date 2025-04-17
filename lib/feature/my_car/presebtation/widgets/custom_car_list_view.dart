
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_state.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/custom_car_item_skeltonizer_loading.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/my_car_item.dart';

class CustomCarListView extends StatefulWidget {
  const CustomCarListView({super.key});

  @override
  State<CustomCarListView> createState() => _CustomCarListViewState();
}

class _CustomCarListViewState extends State<CustomCarListView> {
  @override
  void initState() {
    BlocProvider.of<CarCubit>(context).getAllCarsForSepecificUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<CarEntity> carList = [];

    return BlocBuilder<CarCubit, CarState>(
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
    );
  }
}
