import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';

class CustomAddCarBotton extends StatelessWidget {
  const CustomAddCarBotton({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s30),
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSize.s50),
        child: CustomButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                BlocProvider.of<CarCubit>(context).createCar();
              }
            },
            bottonName: StringsManager.submmit),
      ),
    );
  }
}
