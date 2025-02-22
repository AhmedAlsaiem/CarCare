import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_state.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/car_vin.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/enter_info_car.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/plate_car.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';

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
        if (state is SuccessCarState) {
          NavigatorManager.pushWithReplacement(
              context: context, route: AppRoutes.homeView);
        } else if (state is FaliureCarState) {
          customShowSnackBar(context, state.errorMessage);
        }
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s30),
                  child: CustomButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<CarCubit>(context).createCar();
                        }
                      },
                      bottonName: StringsManager.submmit),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
