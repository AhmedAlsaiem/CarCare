import 'package:flutter/material.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/cusotm_radio_list_tile.dart';

class CustomRadioListtileListViewBuilder extends StatefulWidget {
  const CustomRadioListtileListViewBuilder({
    super.key,
  });

  @override
  State<CustomRadioListtileListViewBuilder> createState() =>
      _CustomRadioListtileListViewBuilderState();
}

class _CustomRadioListtileListViewBuilderState
    extends State<CustomRadioListtileListViewBuilder> {
  String selectedOption = 'Electric';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return CustomRadioListTile(
              onchange: (value) {
                if (value == options[index]['title']!) {
                  selectedOption = value!;
                  setState(() {});
                }
              },
              selectedOption: selectedOption,
              title: options[index]['title']!,
              subtitle: options[index]['description']!,
              price: options[index]['price']!,
            );
          }),
    );
  }
}

final List<Map<String, String>> options = [
  {
    'title': ' Electric',
    'description': ' Common for smaller vehicles and occasional',
    'price': '500'
  },
  {
    'title': ' Hydraulic',
    'description': ' Better for heavy-duty',
    'price': '1000'
  },
];
