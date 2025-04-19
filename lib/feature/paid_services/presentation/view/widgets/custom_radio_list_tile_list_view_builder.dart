import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_app/feature/paid_services/presentation/view/widgets/cusotm_radio_list_tile.dart';

import '../../manager/service_request_manual_cubit/service_request_manual_cubit.dart';

class CustomRadioListtileListViewBuilder extends StatefulWidget {
  const CustomRadioListtileListViewBuilder(
      {super.key, required this.selectedOption, required this.options});
  final String selectedOption;
  final List<Map<String, String>> options;

  @override
  State<CustomRadioListtileListViewBuilder> createState() =>
      _CustomRadioListtileListViewBuilderState();
}

class _CustomRadioListtileListViewBuilderState
    extends State<CustomRadioListtileListViewBuilder> {
  String? selectedOption = '';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.options.length,
          itemBuilder: (context, index) {
            return CustomRadioListTile(
              onchange: (value) {
                if (selectedOption == null) {
                  selectedOption = value;
                  context.read<ServiceRequestManualCubit>().typeOfService =
                      selectedOption!;
                } else if (value == widget.options[index]['title']!) {
                  selectedOption = value!;
                  context.read<ServiceRequestManualCubit>().typeOfService =
                      selectedOption!;
                  context.read<ServiceRequestManualCubit>().price =
                      double.parse(widget.options[index]['price']!);

                  print('selected value $selectedOption');
                }
                setState(() {});
              },
              selectedOption: selectedOption!,
              title: widget.options[index]['title']!,
              subtitle: widget.options[index]['description']!,
              price: widget.options[index]['price']!,
            );
          }),
    );
  }
}
