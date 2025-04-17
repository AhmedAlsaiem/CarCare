import 'package:flutter/material.dart';
import 'package:splash_app/technical/technical_home/presentation/view/inprogress_order_view_body.dart';

class InprogressOrderView extends StatelessWidget {
  const InprogressOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar:  customMyCarAppBar(title: 'title'),
      body: InprogressOrderViewBody(),
    );
  }
}
