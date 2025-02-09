import 'package:flutter/material.dart';
import 'package:splash_app/core/widgets/custom_app_bar.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/choose_acount_type_body.dart';

class ChooseAcountType extends StatelessWidget {
  const ChooseAcountType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: const ChooseAcountTypeBody(),
    );
  }
}
