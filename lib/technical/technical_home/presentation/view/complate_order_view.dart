import 'package:flutter/material.dart';
import 'package:splash_app/technical/technical_home/presentation/view/complate_order_view_body.dart';

class ComplateOrderView extends StatelessWidget {
  const ComplateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      //appBar:  customMyCarAppBar(title: 'title'),
      body: ComplateOrderViewBody(),
    );
  }
}
