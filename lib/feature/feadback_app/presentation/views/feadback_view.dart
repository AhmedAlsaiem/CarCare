import 'package:flutter/material.dart';
import 'package:splash_app/feature/feadback_app/presentation/views/feadback_opation.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/custom_my_car_app_bar.dart';

class FeadbackView extends StatelessWidget {
 const  FeadbackView({super.key});

  @override
  Widget build(  BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   iconTheme: const IconThemeData(color: ColorsManager.white),
      //   title: const Text(
      //     'Choise Type Of Rating',
      //     style: TextStyle(color: ColorsManager.white),
      //   ),
      // ),
      appBar:  customMyCarAppBar(title: 'Choise Type Of Rating'),
      body:const FeadbackOpation(),
    );
  }
}
