import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_cubit.dart';
import 'package:splash_app/feature/setting/presentation/widgets/dialog_widget.dart';

class MyCarItem extends StatelessWidget {
  const MyCarItem({super.key, required this.car});
  final CarEntity car;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: AppHeight.h16, left: AppHeight.h16, right: AppHeight.h16),
      child: Card(
        color: Colors.grey[190],
        elevation: 5,
        child: SizedBox(
          height: AppSize.s150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  size: AppSize.s28,
                  color: ColorsManager.darkgreen,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.car_crash_rounded,
                    size: AppSize.s40,
                    color: ColorsManager.darkgreen,
                  ),
                  const SizedBox(
                    width: AppSize.s10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .60,
                    child: ListTile(
                      title: Text(car.plateNumber,
                          style: StylesManager.textStyleBold20black),
                      subtitle: Text(car.model,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: StylesManager.textStyleRegular14
                              .copyWith(color: ColorsManager.balck)),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showConfirmationDialog(
                          context: context,
                          title: 'Delete Car',
                          desc: 'Are you sure you want to Delete Car?',
                          snackbarText: 'Delete Car successfully!',
                          onConfirm: () {
                            BlocProvider.of<CarCubit>(context)
                                .deleteCarById(id: car.id);
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 34,
                        color: ColorsManager.darkgreen,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
