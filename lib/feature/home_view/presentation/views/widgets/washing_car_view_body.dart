import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

import 'request_button.dart';


class WashingCarViewBody extends StatefulWidget {
  const WashingCarViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WashingCarViewBodyState createState() => _WashingCarViewBodyState();
}

class _WashingCarViewBodyState extends State<WashingCarViewBody> {
  String? selectedOption;

  final List<Map<String, String>> options = [
    {
      'title': ' Hand Wash',
      'description': ' Washing the car manually using water'
    },
    {
      'title': ' Automatic Car Wash',
      'description':
          '  A drive-through machine washes your car using rotating brushes'
    },
    {
      'title': ' Touchless Car Wash',
      'description':
          ' Uses high-pressure water jets and chemicals without physical'
    },
    {
      'title': ' Self-Service Car Wash',
      'description':
          ' You use a self-service car wash station with high-pressure hoses'
    },
    {
      'title': ' Waterless Car Wash',
      'description':
          ' Uses specialized cleaning products that don’t require water.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(title: Text('Choose an Option')),
      body: Column(
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
              StringsManager.choosehewashingtype,
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
          // const ChoiseAmount(),
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
      ),
    );
  }
}
