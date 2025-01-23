import 'package:flutter/material.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/car_vin.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/customize_location_floatactionbutton.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/enter_info_car.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/float_action_button_widget.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/plate_car.dart';

class AddCarBody extends StatefulWidget {
  const AddCarBody({super.key});

  @override
  State<AddCarBody> createState() => _AddCarBodyState();
}

class _AddCarBodyState extends State<AddCarBody> {
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

