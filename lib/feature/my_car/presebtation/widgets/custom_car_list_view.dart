import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/network/app_router.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_state.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/custom_car_item_skeltonizer_loading.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/my_car_item.dart';

class CustomCarListView extends StatefulWidget {
  const CustomCarListView({super.key});

  @override
  State<CustomCarListView> createState() => _CustomCarListViewState();
}

class _CustomCarListViewState extends State<CustomCarListView> {
  @override
  void initState() {
    BlocProvider.of<CarCubit>(context).getAllCarsForSepecificUser();
    super.initState();
  }

  Future<void> onRefresh() async {
    BlocProvider.of<CarCubit>(context).getAllCarsForSepecificUser();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorsManager.mainColor,
      onRefresh: onRefresh,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          BlocBuilder<CarCubit, CarState>(
            builder: (context, state) {
              if (state is SuccessGetCarState) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return MyCarItem(
                      car: state.carList[index],
                    );
                  },
                  itemCount: state.carList.length,
                );
              } else if (state is IsLoadingCarState) {
                return const CustomCarItemSkeltonizerLoading();
              } else {
                return Container();
              }
            },
          ),
          GestureDetector(
            onTap: () {
              NavigatorManager.pushName(
                  context: context, route: AppRoutes.addcar);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: ColorsManager.mainColor,
                ),
                height: 50,
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+ add',
                      textAlign: TextAlign.center,
                      style: StylesManager.textStyleBold17
                          .copyWith(color: ColorsManager.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
