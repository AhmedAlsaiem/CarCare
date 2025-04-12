// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:splash_app/core/utils/color_manager.dart';
// import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
// import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_cubit.dart';
// import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_state.dart';
// import 'package:splash_app/feature/feadback_app/presentation/widget/feadback_content.dart';

// class MyFeadbackBody extends StatefulWidget {
//   const MyFeadbackBody({super.key});

//   @override
//   State<MyFeadbackBody> createState() => _MyFeadbackBodyState();
// }

// class _MyFeadbackBodyState extends State<MyFeadbackBody> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<FeadbackCubit>(context).getFeadback();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: BlocBuilder<FeadbackCubit, FeadbackState>(
//         builder: (context, state) {
//           if (state is IsLoadingFeadbackState) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: ColorsManager.mainColor,
//               ),
//             );
//           } else if (state is SuccessFeadbackState) {
//             final feadback = BlocProvider.of<FeadbackCubit>(context).feadback;
//             if (feadback == null) {
//               return const Center(child: Text('No feedback data available.'));
//             }
//             return FeedbackContent(feadback: feadback);
//           } else if (state is FaliureFeadbackState) {
//             customShowSnackBar(context, state.errorMessage);
//             return const Center(child: Text('Error loading feedback.'));
//           } else {
//             return const Center(child: Text('Waiting for feedback data...'));
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_cubit.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_state.dart';
import 'package:splash_app/feature/feadback_app/presentation/widget/feadback_content.dart';

class MyFeadbackBody extends StatefulWidget {
  const MyFeadbackBody({super.key});

  @override
  State<MyFeadbackBody> createState() => _MyFeadbackBodyState();
}

class _MyFeadbackBodyState extends State<MyFeadbackBody> {
  @override
  void initState() {
    super.initState();
    // Fetch feedback data when the widget is initialized
    BlocProvider.of<FeadbackCubit>(context).getFeadback();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<FeadbackCubit, FeadbackState>(
        listener: (context, state) {
          // Handle side effects (e.g., showing snackbars) here
          if (state is FaliureFeadbackState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              customShowSnackBar(context, state.errorMessage);
            });
          }
        },
        child: BlocBuilder<FeadbackCubit, FeadbackState>(
          builder: (context, state) {
            if (state is IsLoadingFeadbackState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainColor,
                ),
              );
            } else if (state is SuccessFeadbackState) {
              final feadback = BlocProvider.of<FeadbackCubit>(context).feadback;
              if (feadback == null) {
                return const Center(child: Text('No feedback data available.'));
              }
              return FeedbackContent(feadback: feadback);
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