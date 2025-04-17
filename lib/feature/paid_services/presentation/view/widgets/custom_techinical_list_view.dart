import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/helper/extentions.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/custom_car_item_skeltonizer_loading.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/get_techinical_cubit/get_all_techincal_cubit.dart';
import '../../manager/get_techinical_cubit/get_all_techincal_state.dart';
import 'custom_technical_item.dart';

class CustomTechnicalItemListView extends StatelessWidget {
  const CustomTechnicalItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20),
      SizedBox(
        height: context.screenHeight * 0.76,
        child: BlocBuilder<GetAllTechincalCubit, GetAllTechincalState>(
            builder: (context, state) {
          if (state is GetAllTechinicalSucessState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
              child: ListView.builder(
                itemCount: state.techinicalList.length,
                itemBuilder: (context, index) {
                  return CustomtechincalItem(
                    techincal: state.techinicalList[index],
                  );
                },
              ),
            );
          } else if (state is GetAllTechinicalIsLoadinState) {
            return const CustomCarItemSkeltonizerLoading();
          } else if (state is GetAllTechinicalFailedState) {
            return Center(
              child: Text(state.errorMessage.errorMessage),
            );
          } else {
            return const CustomCarItemSkeltonizerLoading();
          }
        }),
      ),
    ]);
  }
}
