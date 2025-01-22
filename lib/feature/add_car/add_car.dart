import 'package:flutter/material.dart';
import 'package:splash_app/feature/add_car/presentation/pages/add_car_body.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/appar_title_text.dart';
import 'package:splash_app/feature/add_car/presentation/widgets/float_action_button_widget.dart';

class AddCar extends StatelessWidget {
  const AddCar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton:const FloatActionButtonWidget(),
      
        appBar: AppBar(
          title: const AppbarTitle(),
        ),
        body: const AddCarBody(),
      ),
    );
  }
}

