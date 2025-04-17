import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/select_techincal_view_body.dart';

class SelectTechinaclView extends StatelessWidget {
  const SelectTechinaclView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSelectTechincalAppBar(context),
      body: const SelectTechincalViewBody(),
    );
  }
}

AppBar customSelectTechincalAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      StringsManager.title,
      style: StylesManager.textStyleSemiBold20
          .copyWith(color: ColorsManager.white),
    ),
    leading: IconButton(
        onPressed: () {
          NavigatorManager.pop(context: context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: ColorsManager.white,
        )),
  );
}
