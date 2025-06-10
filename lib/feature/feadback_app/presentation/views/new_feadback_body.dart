import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/font_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_cubit.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_state.dart';
import 'package:splash_app/feature/feadback_app/presentation/widget/feadback_handle_state.dart';
import 'package:splash_app/feature/feadback_app/presentation/widget/google_play_widget.dart';

class NewFeadbackBody extends StatefulWidget {
  const NewFeadbackBody({super.key});
  @override
  State<NewFeadbackBody> createState() => _NewFeadbackBodyState();
}

class _NewFeadbackBodyState extends State<NewFeadbackBody> {
  final GlobalKey<FormState> formKeyFeadback = GlobalKey();
  void _setRating(double rating, BuildContext context) {
    setState(() {
      context.read<FeadbackCubit>().rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeadbackCubit, FeadbackState>(
      listener: (context, state) {
        feadbackHandleState(state, context);
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      // color: ColorsManager.white,
                      height: AppHeight.h250,
                      AssetsManager.rating,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ],
                ),
                const GooglePlayWidget(),
                SizedBox(
                  height: AppHeight.h10,
                ),
                Text(
                  'Your opinion matters to us!',
                  style: StylesManager.textStyleBold24
                      .copyWith(color: ColorsManager.mainColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppHeight.h20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Appwidth.w4),
                  child: Text(
                    'We work super hard to serve you better '
                    'and\nwould love to know how you would\n rate our app?',
                    style: TextStyle(fontSize: FontSize.s16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: AppHeight.h40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      // onTap: () => context.read<FeadbackCubit>().rating,
                      onTap: () => _setRating(index + 1, context),
                      child: Icon(
                        index < context.read<FeadbackCubit>().rating
                            ? Icons.star
                            : Icons.star_border,
                        size: 40,
                        color: index < context.read<FeadbackCubit>().rating
                            ? ColorsManager.mainColor
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
                SizedBox(height: AppHeight.h40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Appwidth.w20),
                  child: TextFormField(
                  
                    cursorColor: ColorsManager.mainColor,
                      controller: context.read<FeadbackCubit>().commentFeadback,
                      decoration: InputDecoration(
                          hintText: 'enter you comment',
                          labelStyle: const TextStyle(color: Colors.black),
                          labelText: 'your comment',
                          focusColor: ColorsManager.red,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorsManager.mainColor, width: 2.0),
                              borderRadius: BorderRadius.circular(12)),
                          border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: ColorsManager.balck),
                              borderRadius: BorderRadius.circular(12)))),
                ),
                SizedBox(height: AppHeight.h40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ColorsManager.mainColor, // Background color
                    foregroundColor: Colors.white, // Text color
                    minimumSize: const Size(300, 60), // Width and height
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSize.s12), // Border radius
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<FeadbackCubit>(context).createFeadback();
                    context.read<FeadbackCubit>().commentFeadback.clear();
                    context.read<FeadbackCubit>().rating = 0.0;
                  },
                  child: Text(
                    'Send',
                    style: StylesManager.textStyleBold24,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
