import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/app_bar_functions/handle_add_car_state.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_state.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/car_vin.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/enter_info_car.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/plate_car.dart';

import 'custom_add_car_botton.dart';

class AddCarViewBody extends StatelessWidget {
  const AddCarViewBody({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarCubit, CarState>(
      listener: (context, state) {
        handleAddCarState(state, context);
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                
                const EnterInfoCar(),
                const CarVin(),
                EgyptianCarPlateWithFocus(globalKey: _formKey),
                CustomAddCarBotton(formKey: _formKey)
              ],
            ),
          ),
        );
      },
    );
  }

}
