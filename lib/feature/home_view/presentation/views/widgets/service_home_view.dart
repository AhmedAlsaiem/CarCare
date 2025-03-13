import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/authentaction/domain/entity/service_entities/service_entitiy.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/get_all_services_cubit/get_all_services_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/get_all_services_cubit/get_all_services_state.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/service_item.dart';

import 'custom_service_shimmer.dart';

class ServicesHomeView extends StatefulWidget {
  const ServicesHomeView({
    super.key,
  });

  @override
  State<ServicesHomeView> createState() => _ServicesHomeViewState();
}

class _ServicesHomeViewState extends State<ServicesHomeView> {
  List<void Function()?> ontapList = [
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
    () {},
  ];
  List<ServiceEntitiy>? serviceList;
  @override
  void initState() {
    BlocProvider.of<GetAllServicesCubit>(context).getAllServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllServicesCubit, GetAllServicesState>(
      builder: (context, state) {
        if (state is GetAllServicesIsLoadingState) {
          return const CustomLoadingShimmerService();
        } else if (state is GetAllServicesSuccessState) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                mainAxisSpacing: 12,
                crossAxisSpacing: 2,
                childAspectRatio: 0.88, // Adjust aspect ratio as needed
              ),
              itemCount: state.servicesList.length,
              itemBuilder: (context, index) {
                return ServiceItem(
                  service: state.servicesList[index],
                  ontap: ontapList[index],
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
