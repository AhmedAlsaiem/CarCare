import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/technical/technical_setting/presentation/manger/tecnical_profile/tecnical_profile_cubit.dart';
import 'package:splash_app/technical/technical_setting/presentation/manger/tecnical_profile/tecnical_profile_state.dart';
import 'package:splash_app/technical/technical_setting/presentation/widget/profile_tecnical_item.dart';

class ProfileTecnicalViewBody extends StatefulWidget {
  const ProfileTecnicalViewBody({super.key});

  @override
  State<ProfileTecnicalViewBody> createState() =>
      _ProfileTecnicalViewBodyState();
}

// BlocProvider.of<OrderCubit>(context).getAllrequestPinding();

class _ProfileTecnicalViewBodyState extends State<ProfileTecnicalViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TecnicalProfileCubit>(context).getTecicalProfile();
 //   BlocProvider.of<UpdateProfileCubit>(context).updateProfile();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<TecnicalProfileCubit, TecnicalProfileState>(
          listener: (context, state) {
            if (state is FaliureTecnicalProfileState) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                customShowSnackBar(context, state.errorMessage);
              });
            }
          },
          child: BlocBuilder<TecnicalProfileCubit, TecnicalProfileState>(
            builder: (context, state) {
              if (state is IsLoadingTecnicalProfileState) {
                return  const Center(child: CircularProgressIndicator(color: ColorsManager.mainColor,));
              } else if (state is SuccessTecnicalProfileState) {
                //List<OrderEntity> orders = applyFilter(state.orders);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     PrfileTecnicalitem(
                      text: state.tecnicalEntity.fullName,
                      iconData: Icons.person,
                    ),
                     SizedBox(
                      height: AppHeight.h10,
                    ),
                     PrfileTecnicalitem(
                      text: state.tecnicalEntity.phoneNumber,
                      iconData: Icons.phone,
                    ),
                     SizedBox(
                      height: AppHeight.h10,
                      
                    ),
                     PrfileTecnicalitem(
                      // ignore: unnecessary_string_interpolations
                      text: '${state.tecnicalEntity.email}',
                      iconData: Icons.email,
                    ),
                     SizedBox(
                      height: AppHeight.h10,
                      
                    ),
                     PrfileTecnicalitem(
                      text: 'service type =  ${state.tecnicalEntity.serviceName}',
                      iconData: Icons.type_specimen,
                    ),
                    SizedBox(
                      height: AppHeight.h10,

                    ),
                     PrfileTecnicalitem(
                      text: 'you rate =   ${state.tecnicalEntity.techRate}',
                      iconData: Icons.star,
                    ),
                  SizedBox(
                      height: AppHeight.h10,
                      
                    ),
                     PrfileTecnicalitem(
                      text: 'completedRequestes = ${state.tecnicalEntity.completedRequestes}',
                      iconData: Icons.check,
                    ),
                    SizedBox(
                      height: AppHeight.h10,
                      
                    ),
                     PrfileTecnicalitem(
                      text: 'total profit = ${state.tecnicalEntity.profit.toInt()}  egp',
                      iconData: Icons.money_off_csred_sharp,
                    ),
                    SizedBox(
                      height: AppHeight.h10,
                      
                    ),
                  ],
                );
              } else if (state is FaliureTecnicalProfileState) {
                return const Center(child: Text('Error loading feedback.'));
              } else {
                return const Center(
                    child: Text('Waiting for feedback data...'));
              }
            },
          ),
        ),
     
        // ),
      ),
    );
  }
}
