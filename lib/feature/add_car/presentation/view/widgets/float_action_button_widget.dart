
// import 'package:flutter/material.dart';
// import 'package:splash_app/core/utils/color_manager.dart';
// import 'package:splash_app/core/utils/string_manager.dart';
// import 'package:splash_app/core/utils/styles_manager.dart';
// import 'package:splash_app/feature/home_view/home_view.dart';

// class FloatActionButtonWidget extends StatelessWidget {
//   const FloatActionButtonWidget({
//     super.key,
//     required GlobalKey<FormState> formKey,
//   }) : _formKey = formKey;

//   final GlobalKey<FormState> _formKey;

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
     
      
//       // shape: CircleBorder(),
//       backgroundColor: ColorsManager.mainColor,
//       onPressed: () {
//         if (_formKey.currentState!.validate()) {
//           // If the form is valid, display a success message
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 backgroundColor: ColorsManager.mainColor,
//                 content: Text('Form is valid!')),
//           );
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const HomeView()));
//         }
//       },
    
//       // shape: CircleBorder(),
//       child: Center(
//         child: Text(
//           StringsManager.add,
//           style: StylesManager.textStyleBold20black,
//         ),
//       ),
//     );
//   }
// }
