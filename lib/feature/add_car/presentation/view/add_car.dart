import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/app_bar_functions/custom_add_car_app_bar.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/info_by_machine.dart';
import 'widgets/add_car_view_body.dart';

class AddCar extends StatefulWidget {
  const AddCar({super.key});

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final _formKey = GlobalKey<FormState>();

  void _handleDetectionResults(Map<String, dynamic> results) {
    final cubit = context.read<CarCubit>();

    cubit.model.text = results['car_brand'] ?? '';
    cubit.color.text = results['car_color'] ?? '';

    final rawPlate = results['car_plate'] ?? '';

    // Extract numbers and characters separately
    final plateNumbers =
        RegExp(r'\d').allMatches(rawPlate).map((e) => e.group(0)!).toList();
    final plateChars = RegExp(r'[A-Za-zأ-ي]')
        .allMatches(rawPlate)
        .map((e) => e.group(0)!)
        .toList();

    // Fill number fields
    // ignore: prefer_is_empty
    cubit.plateN1.text = plateNumbers.length > 0 ? plateNumbers[0] : '';
    cubit.plateN2.text = plateNumbers.length > 1 ? plateNumbers[1] : '';
    cubit.plateN3.text = plateNumbers.length > 2 ? plateNumbers[2] : '';

    // Fill character field (join them with space or dash)
    cubit.plateChar.text = plateChars.join(' - ');

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InfoByMachine(
                onDetectionComplete: _handleDetectionResults,
              ),
            ),
          );
        },
        child: const Icon(
          Icons.barcode_reader,
          color: ColorsManager.mainColor,
          size: 30,
        ),
      ),
      backgroundColor: ColorsManager.lightGrey,
      appBar: customAddCarAppBar(context: context),
      body: AddCarViewBody(formKey: _formKey),
    );
  }
}
