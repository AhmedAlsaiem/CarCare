import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

import '../../manager/service_request_manual_cubit/service_request_manual_cubit.dart';

class ChoiseAmount extends StatelessWidget {
  const ChoiseAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceRequestCubit(),
      child: Padding(
        padding: EdgeInsets.all(AppSize.s12.r),
        child: Row(
          children: [
            Text(
              '   Quntity',
              style: StylesManager.textStyleBold20black,
            ),
            SizedBox(
              width: Appwidth.w8,
            ),
            SizedBox(
              width: Appwidth.w50,
              // height: 4,
              child: TextFormField(
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    context.read<ServiceRequestCubit>().serviceQuantity =
                        int.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '0',
                  border: chooseAmountBorder(),
                  errorBorder: chooseAmountBorder(),
                  enabledBorder: chooseAmountBorder(),
                  disabledBorder: chooseAmountBorder(),
                  focusedErrorBorder: chooseAmountBorder(),
                  focusedBorder: chooseAmountBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder chooseAmountBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
      borderRadius: BorderRadius.circular(AppSize.s40),
    );
  }
}
