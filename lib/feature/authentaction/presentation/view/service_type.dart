import 'package:flutter/material.dart';
import 'package:splash_app/core/widgets/custom_app_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/service_type_view_body.dart';

class ServiceTypeView extends StatelessWidget {
  const ServiceTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: const ServiceTypeViewBody(),
    );
  }
}
