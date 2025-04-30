import 'package:flutter/material.dart';
import 'package:splash_app/feature/checkout/presentation/views/widgets/app_bar.dart';
import 'package:splash_app/feature/checkout/presentation/views/widgets/my_cart_view_body.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Order Details', context: context),
      body:const OrderDetailViewBody(),
    );
  }
}
