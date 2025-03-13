import 'package:flutter/material.dart';

import 'slide_transition_builder.dart';

PageRouteBuilder<dynamic> pageRouteBuilderMethod(
      {required Widget Function(
              BuildContext, Animation<double>, Animation<double>)
          pageBuilder}) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: slideTransitionBuilder,
      pageBuilder: pageBuilder,
    );
  }