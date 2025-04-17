import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

import 'choise_amount.dart';
import 'request_button.dart';

class OilCarViewBody extends StatefulWidget {
  const OilCarViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OilCarViewBodyState createState() => _OilCarViewBodyState();
}

class _OilCarViewBodyState extends State<OilCarViewBody> {
  String? selectedOption;
  
  final List<Map<String, String>> options = [
    {
      'title': ' Engine Oil',
      'description': '  The primary type of oil used in cars.',
      'price' : '1000'
    },
    {
      'title': ' Synthetic Oil',
      'description': '  Chemically engineered for better performance',
      'price' : '300'

    },
    {
      'title': 'Synthetic Blend Oil',
      'description': ' A mix of synthetic and conventional oil.',
      'price' : '1200'

    },
    {
      'title': ' High-Mileage Oil',
      'description': ' Designed for cars with over 75,000 miles',
      'price' : '650'

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
            padding:  EdgeInsets.only(right: Appwidth.w20, top: AppHeight.h12, left: Appwidth.w12),
            child: Text(
              // padd: EdgeInsets.all(20),
            StringsManager.chooseheoiltype,
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
                   '${ option['price']!} EGP' ,
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
        
            selectedOption: selectedOption??' ',
          ),
          SizedBox(
            height: AppHeight.h30,
          )
        ],
    
    );
  }
}

