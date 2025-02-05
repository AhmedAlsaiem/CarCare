import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/domain/entity/service_entities/service_entitiy.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/get_all_services_cubit/get_all_services_cubit.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/get_all_services_cubit/get_all_services_state.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_circular_progress_indector.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_logo_auth.dart';
import 'package:splash_app/feature/authentaction/presentation/view/widgets/custom_service_item_list_view.dart';

class ServiceTypeViewBody extends StatefulWidget {
  const ServiceTypeViewBody({super.key});

  @override
  State<ServiceTypeViewBody> createState() => _ServiceTypeViewBodyState();
}

class _ServiceTypeViewBodyState extends State<ServiceTypeViewBody> {
  @override
  void initState() {
    getAllService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllServicesCubit, GetAllServicesState>(
      builder: (context, state) {
        if (state is GetAllServicesSuccessState) {
          List<ServiceEntitiy> serviceList = state.servicesList;
          return Column(
            children: [
              CustomLogoAuth(
                title: StringsManager.selectService,
                height: context.screenHeight * 0.15,
              ),
              const SizedBox(height: AppSize.s20),
              Column(
                children: [
                  // const CustomCircularProgressIndicator(),

                  CustomServiceItemListView(servicesList: serviceList)
                ],
              )
            ],
          );
        } else if (state is GetAllServicesFaildState) {
          return Text(state.erorrMessage);
        } else if (state is GetAllServicesIsLoadingState) {
          return const CustomCircularProgressIndicator();
        } else {
          return Container();
        }
      },
    );
  }

  Future<void> getAllService() async {
    BlocProvider.of<GetAllServicesCubit>(context).getAllServices();
  }
}
