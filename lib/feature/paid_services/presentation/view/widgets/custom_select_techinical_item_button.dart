import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/paid_services/domain/enties/get_techincal_entity.dart';
import '../../manager/service_request_manual_cubit/service_request_manual_cubit.dart';

class CustomSelectTechinicalItemButton extends StatelessWidget {
  const CustomSelectTechinicalItemButton({
    super.key,
    required this.techincal,
  });

  final GetTechincalEntity techincal;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if (ServiceRequestCubit.requestEntity == null) {
            context.read<ServiceRequestCubit>().techId = techincal.id;
            BlocProvider.of<ServiceRequestCubit>(context)
                .handleAllRequestManualFunctions(requestType: 0);
          } else {
            context.read<ServiceRequestCubit>().techId = techincal.id;
            BlocProvider.of<ServiceRequestCubit>(context).updateTechincal(
                orderId: ServiceRequestCubit.requestEntity!.id.toString());
        }
        },
        style: TextButton.styleFrom(
          backgroundColor: ColorsManager.mainColor,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Select',
          style: StylesManager.textStyleRegular14.copyWith(
            color: ColorsManager.white,
          ),
        ));
  }
}
