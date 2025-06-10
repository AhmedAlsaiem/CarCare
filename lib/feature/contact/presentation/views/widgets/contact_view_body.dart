import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/contact/presentation/views/widgets/contect_item_list_view.dart';

class ContactViewBody extends StatelessWidget {
  const ContactViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        color: ColorsManager.mainColor,
        child: Container(
            decoration: const BoxDecoration(
              color: ColorsManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: const ContactItemListView()));
  }
}
