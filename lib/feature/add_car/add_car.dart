
import 'package:flutter/material.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/car_vin.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/customize_location_floatactionbutton.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/enter_info_car.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/float_action_button_widget.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/plate_car.dart';

class AddCar extends StatefulWidget {
  const AddCar({super.key});

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: const Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EnterInfoCar(),
                  // SizedBox(
                  //   height: AppHeight.h10,
                  // ),
                  CarVin(),

                  EgyptianCarPlateWithFocus(),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: CustomFABLocation(.85, .05),
          floatingActionButton: FloatActionButtonWidget(formKey: _formKey),

          // floatingActionButton:  FloatActionButtonWidget(formKey: _formKey,),
        ),
      ),
    );
  }
}
