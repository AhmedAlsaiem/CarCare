import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';

import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/mecanical_view_body.dart';

import 'text_form_in_parking_view.dart';

class ParkingCarViewBody extends StatefulWidget {
  const ParkingCarViewBody({super.key});

  @override
  State<ParkingCarViewBody> createState() => _ParkingCarViewBodyState();
}

class _ParkingCarViewBodyState extends State<ParkingCarViewBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding:
              const EdgeInsets.all(16.0), // Add padding for better spacing.
          children: [
            const TextformFieldInParkingView(
              title: StringsManager.lengthofcar,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextformFieldInParkingView(
              title: StringsManager.widthofcar,
            ),
            const SizedBox(
              height: 20,
            ),
            const TextformFieldInParkingView(
              title: StringsManager.howtime,
            ),
            SizedBox(
              height: context.screenHeight * .42,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        backgroundColor: ColorsManager.mainColor,
                        content: Text(StringsManager.formisvalid)),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  MecanicalViewBody()));
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: Appwidth.w24),
                //    padding: EdgeInsets.symmetric(horizontal: Appwidth.w50),
                height: 50,
                width: context.screenWidth,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  color: ColorsManager.mainColor,
                ),
                child: Center(
                  child: Text(
                    StringsManager.request,
                    style: StylesManager.textStyleBold24
                        .copyWith(color: ColorsManager.balck),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
