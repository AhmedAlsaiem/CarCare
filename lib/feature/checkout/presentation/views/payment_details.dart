import 'package:flutter/material.dart';
import 'package:splash_app/feature/checkout/presentation/views/widgets/app_bar.dart';
import 'package:splash_app/feature/checkout/presentation/views/widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details', context: context),
      body: const PaymentDetailsViewBody(),
    );
  }
}
