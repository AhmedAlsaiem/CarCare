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
          if (ServiceRequestManualCubit.requestEntity == null) {
            context.read<ServiceRequestManualCubit>().techId = techincal.id;
            BlocProvider.of<ServiceRequestManualCubit>(context)
                .handleAllRequestManualFunctions();
          } else {
            context.read<ServiceRequestManualCubit>().techId = techincal.id;
            BlocProvider.of<ServiceRequestManualCubit>(context).updateTechincal(
                orderId:
                    ServiceRequestManualCubit.requestEntity!.id.toString());
            print(
                'Ahmed Update Techincal Succeffly bbbbbbbbbbbrrrrrrrr very good');
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
