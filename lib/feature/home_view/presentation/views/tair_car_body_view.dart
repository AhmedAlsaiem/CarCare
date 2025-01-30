import 'package:flutter/material.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/choise_amount.dart';
import 'package:splash_app/feature/home_view/presentation/widgets/request_button.dart';

class TairCarBodyView extends StatefulWidget {
  const TairCarBodyView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TairCarBodyViewState createState() => _TairCarBodyViewState();
}

class _TairCarBodyViewState extends State<TairCarBodyView> {
  String? selectedOption;
  
  final List<Map<String, String>> options = [
    {
      'title': 'Small Cars',
      'description': ' 13 to 16 inches (e.g., 185/65R15)', 
      'price' :'2500'
    },
    {
      'title': 'Sedans and Hatchbacks',
      'description': ' 15 to 18 inches (e.g., 205/55R16)',
      'price' :'3000'

    },
    {
      'title': 'SUVs and Trucks',
      'description': ' 17 to 22 inches (e.g., 265/70R17)',
      'price' :'6000'

    },
    {
      'title': 'Sports Cars',
      'description': ' 18 to 20 inches with low-profile tires (e.g., 225/40R18)',
      'price' :'4500'

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
              StringsManager.choosehetiretype,
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
      ),
    );
  }
}

