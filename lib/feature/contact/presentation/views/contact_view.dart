import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/contact/presentation/views/widgets/contact_view_body.dart';
import 'package:splash_app/feature/contact/presentation/views/widgets/contect_app_bar.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      appBar: contactAppBar(context),
      body: const ContactViewBody(),
    );
  }
}
