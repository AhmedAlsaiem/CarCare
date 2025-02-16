
import 'package:flutter/material.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/my_car_item.dart';

class MycarViewBody extends StatelessWidget {
  const MycarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return const MyCarItem();
    } , itemCount: 10,);
  }
}

