import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/get_techinical_cubit/get_all_techincal_cubit.dart';
import 'custom_get_all_techinical_buttom_section.dart';
import 'custom_get_all_techinical_filter_section.dart';

class SelectTechincalViewBody extends StatefulWidget {
  const SelectTechincalViewBody({super.key});

  @override
  State<SelectTechincalViewBody> createState() =>
      _SelectTechincalViewBodyState();
}

class _SelectTechincalViewBodyState extends State<SelectTechincalViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllTechincalCubit>(context)
        .getAlltechinicalOrderedByDistanceAndRate(serviceId: 5);
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomGetAllTechinicalFilterSection(),
        CustomGetAllTechinacalButtomSection(),
      ],
    );
  }
}
