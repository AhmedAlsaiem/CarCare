import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_state.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/get_app_feadback/get_app_feadback_cubit.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/get_app_feadback/get_app_feadback_state.dart';
import 'package:splash_app/feature/feadback_app/presentation/widget/rating_bar_animation.dart';

class GetAppFeadbackBody extends StatefulWidget {
  const GetAppFeadbackBody({super.key});

  @override
  State<GetAppFeadbackBody> createState() => _GetAppFeadbackBodyState();
}

class _GetAppFeadbackBodyState extends State<GetAppFeadbackBody> {
  @override
  void initState() {
    super.initState();
    // Fetch app feedback data when the widget is initialized
    BlocProvider.of<GetAppFeadbackCubit>(context).getappFeadback();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<GetAppFeadbackCubit, GetAppFeadbackState>(
        listener: (context, state) {
          // Handle side effects (e.g., showing snackbars) here
          if (state is FaliureGetAppFeadbackState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              customShowSnackBar(context, state.errorMessage);
            });
          }
        },
        child: BlocBuilder<GetAppFeadbackCubit, GetAppFeadbackState>(
          builder: (context, state) {
            if (state is IsLoadingGetAppFeadbackState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainColor,
                ),
              );
            } else if (state is SuccessGetAppFeadbackState) {
              final feadback = state.getappFeadBackEntities;
      
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Appwidth.w10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: AppHeight.h20),
                      Text(
                        'App Rate = ${feadback.rateing.toStringAsFixed(3)}',
                        style: StylesManager.textStyleBold20black,
                      ),
                      RatingBar(
                        rating: feadback.rateing,
                        filledColor: ColorsManager.mainColor,
                        emptyColor: ColorsManager.grey,
                        starSize: 40,
                        animationDuration: const Duration(milliseconds: 300),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is FaliureFeadbackState) {
              return const Center(child: Text('Error loading feedback.'));
            } else {
              return const Center(child: Text('Waiting for feedback data...'));
            }
          },
        ),
      ),
    );
  }
}
