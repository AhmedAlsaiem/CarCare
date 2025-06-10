import 'package:flutter/material.dart';

import 'widgets/custom_select_techinical_app_bar.dart';
import 'widgets/select_techincal_view_body.dart';

class SelectTechinaclView extends StatelessWidget {
  const SelectTechinaclView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSelectTechincalAppBar(context),
      body: const SelectTechincalViewBody(),
    );
  }
}
