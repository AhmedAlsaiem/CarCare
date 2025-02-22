import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/app_bar_functions/custom_add_car_app_bar.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'widgets/add_car_view_body.dart';

class AddCar extends StatefulWidget {
  const AddCar({super.key});

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightGrey,
      appBar: customAddCarAppBar(context: context),
      body: AddCarViewBody(formKey: _formKey),
    );
  }
}
