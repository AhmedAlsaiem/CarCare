import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/font_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/feature/feadback_app/domain/entity/feadback_entities.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_cubit.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_state.dart';
import 'package:splash_app/feature/feadback_app/presentation/widget/feadback_handle_state.dart';
import 'package:splash_app/feature/feadback_app/presentation/widget/google_play_widget.dart';

class UpdateFeadbackViewBody extends StatefulWidget {
  const UpdateFeadbackViewBody({super.key});

  @override
  State<UpdateFeadbackViewBody> createState() => _UpdateFeadbackViewBodyState();
}

class _UpdateFeadbackViewBodyState extends State<UpdateFeadbackViewBody> {
  final GlobalKey<FormState> formKeyFeadbackUpdate = GlobalKey();

  FeadbackEntities? feadback;

  //  int ratingg = 0;

  void _setRating(double rating, BuildContext context) {
    setState(() {
      context.read<FeadbackCubit>().updaterating = rating;
    });
  }

@override
void initState() {
  super.initState();
  _initFeadback();
}

void _initFeadback() async {
  feadback = await BlocProvider.of<FeadbackCubit>(context).getFeadback();

  
// setState(() {});
}

 
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeadbackCubit, FeadbackState>(
      listener: (context, state) {


        if(state is SuccessFeadbackState || state is FaliureFeadbackState){
         feadbackHandleState(state, context);
          
        }
      },
      builder: (context, state) {
        
        return SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
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
                    'enter the new rate '
                    //  'and\nwould love to know how you would\n rate our app?',
                    ,
                    style: TextStyle(fontSize: FontSize.s20),
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
                        index < context.read<FeadbackCubit>().updaterating
                            ? Icons.star
                            : Icons.star_border,
                        size: 40,
                        color:
                            index < context.read<FeadbackCubit>().updaterating
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
                      controller: context.read<FeadbackCubit>().updateFeadback,
                      decoration: InputDecoration(
                          hintText: 'enter you comment',
                          labelText: 'your comment',
                          labelStyle:const TextStyle(color: Colors.black),
                          //   hintStyle:t ,
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorsManager.mainColor, width: 2.0),
                              borderRadius: BorderRadius.circular(12)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: ColorsManager.mainColor),
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
              
                    BlocProvider.of<FeadbackCubit>(context).updateFeadBack(id: feadback!.id);
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
