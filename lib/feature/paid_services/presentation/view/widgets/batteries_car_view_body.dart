import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

import 'choise_amount.dart';
import 'request_button.dart';

class BatteriesCarViewBody extends StatefulWidget {
  const BatteriesCarViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BatteriesCarViewBodyState createState() => _BatteriesCarViewBodyState();
}

class _BatteriesCarViewBodyState extends State<BatteriesCarViewBody> {
  String? selectedOption;

  final List<Map<String, String>> options = [
    {
      'title': ' Flooded',
      'description': ' Affordable and widely available',
      'price': '1000'
    },
    {
      'title': ' AGM',
      'description': ' Provides better performance and durabilit',
      'price': '12000'
    },
    {
      'title': ' EFB',
      'description': ' Handles frequent charging and discharging cycle',
      'price': '4500'
    },
    {
      'title': ' Gel Cell',
      'description': ' Resistant to vibration and deep discharge',
      'price': '16000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppHeight.h16,
        ),
        Padding(
          padding: EdgeInsets.only(
              right: Appwidth.w20, top: AppHeight.h12, left: Appwidth.w12),
          child: Text(
            // padd: EdgeInsets.all(20),
            StringsManager.choosehebatteriestype,
            style: StylesManager.textStyleBold20black,
          ),
        ),
        Expanded(
          child: ListView(
            children: options.map((option) {
              return RadioListTile<String>(
                activeColor: ColorsManager.mainColor,
                title: Text(
                  option['title']!,
                  style: TextStyle(
                    color: selectedOption == option['title']
                        ? ColorsManager.mainColor
                        : ColorsManager.balck,
                    fontWeight: selectedOption == option['title']
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                secondary: Text(
                  '${option['price']!} EGP',
                ),
                subtitle: Text(
                  option['description']!,
                ), // Add description here
                value: option['title']!,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              );
            }).toList(),
          ),
        ),
        const ChoiseAmount(),
        SizedBox(
          height: context.screenHeight * .2,
        ),
        RequesButton(
          selectedOption: selectedOption ?? ' ',
        ),
        SizedBox(
          height: AppHeight.h30,
        )
      ],
    );
  }
}
