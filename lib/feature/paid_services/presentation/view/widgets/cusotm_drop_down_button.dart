import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/get_techinical_cubit/get_all_techincal_cubit.dart'
    show GetAllTechincalCubit;

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String selectedValue = 'Distance';
  List<String> options = [
    'Distance',
    'Rate',
  ];
  Color color = Colors.white;
  bool count = true;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        padding: const EdgeInsets.only(top: 5, right: 20),
        isDense: true,
        dropdownColor: ColorsManager.darkGrey,
        style:
            StylesManager.textStyleBold17.copyWith(color: ColorsManager.white),
        borderRadius: BorderRadius.circular(12),
        iconDisabledColor: ColorsManager.white,
        iconEnabledColor: ColorsManager.white,
        alignment: Alignment.center,
        value: selectedValue,
        onChanged: (newValue) {
          setState(() {
            selectedValue = newValue!;
            if (newValue == 'Distance') {
              BlocProvider.of<GetAllTechincalCubit>(context)
                  .getAlltechinicalOrderedByDistance(serviceId: 5);
            } else {
              BlocProvider.of<GetAllTechincalCubit>(context)
                  .getAlltechinicalOrderedByDistanceAndRate(serviceId: 5);
            }
          });
        },
        items: options.map((option) {
          return DropdownMenuItem(
            alignment: Alignment.center,
            value: option,
            child: Text(
              option,
              style:
                  StylesManager.textStyleBold17.copyWith(color: Colors.white),
            ),
          );
        }).toList());
  }
}
