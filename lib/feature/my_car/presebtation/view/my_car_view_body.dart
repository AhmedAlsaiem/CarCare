import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/my_car_item.dart';

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
          return const CustomCircularProgressIndicator();
        } else {
          return Container();
        }
      },
    );
  }
}
