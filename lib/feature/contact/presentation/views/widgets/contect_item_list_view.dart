import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/feature/contact/domain/entities/contact_entity.dart';
import 'package:splash_app/feature/contact/presentation/manager/contact_cubit/contact_cubit.dart';
import 'package:splash_app/feature/contact/presentation/manager/contact_cubit/contact_state.dart';
import 'package:splash_app/feature/contact/presentation/views/widgets/custom_contact_item.dart';
import 'package:splash_app/feature/my_car/presebtation/widgets/custom_car_item_skeltonizer_loading.dart';

class ContactItemListView extends StatelessWidget {
  const ContactItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      bloc: ContactCubit()..getAllContacts(),
      builder: (context, state) {
        if (state is SuccessContactState) {
          return ContactListView(contactList: state.contectList);
        } else if (state is FailedContactState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is IsLoadingContactState) {
          return const CustomCarItemSkeltonizerLoading();
        } else {
          return Container();
        }
      },
    );
  }
}

class ContactListView extends StatelessWidget {
  const ContactListView({
    super.key,
    required this.contactList,
  });
  final List<ContactEntity> contactList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppSize.s12, right: AppSize.s12, top: AppSize.s12),
      child: SizedBox(
        child: ListView.builder(
          itemCount: contactList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return CustomContactItem(contactItem: contactList[index]);
          },
        ),
      ),
    );
  }
}
