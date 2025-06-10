import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/checkout/presentation/views/widgets/app_bar.dart';
import 'package:splash_app/feature/checkout/presentation/views/widgets/my_cart_view_body.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_cubit.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Order Details', context: context),
      body: BlocProvider(
        create: (context) => ServiceRequestCubit(),
        child: const OrderDetailViewBody(),
      ),
    );
  }
}
