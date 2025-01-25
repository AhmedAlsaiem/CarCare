import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/choise_amount.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/request_button.dart';

class FuelCarViewBody extends StatefulWidget {
  const FuelCarViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FuelCarViewBodyState createState() => _FuelCarViewBodyState();
}

class _FuelCarViewBodyState extends State<FuelCarViewBody> {
  String? selectedOption;
  
  final List<Map<String, String>> options = [
    {
      'title': ' Regular benzine',
      'description': '  vehicles with low to mid-performance .'
    },
    {
      'title': ' Mid-Grade benzine',
      'description': '  fuel with a higher octane'
    },
    {
      'title': 'Premium Gasoline benzine',
      'description': ' High-performance or luxury cars'
    },
    {
      'title': ' Gas',
      'description': ' Retrofitted passenger cars'
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
            padding:  EdgeInsets.only(right: Appwidth.w20, top: AppHeight.h12, left: Appwidth.w12),
            child: Text(
              // padd: EdgeInsets.all(20),
              StringsManager.choosehefueltype,
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
      ),
    );
  }
}

