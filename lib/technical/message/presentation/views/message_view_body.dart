import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/technical/message/presentation/manger/message_cubit.dart';
import 'package:splash_app/technical/message/presentation/manger/message_state.dart';
import 'package:splash_app/technical/message/presentation/widget/message_list_view_item.dart';
import 'package:splash_app/technical/technical_home/presentation/widget/shamer_loading.dart';

class MessageViewBody extends StatefulWidget {
  const MessageViewBody({super.key});

  @override
  State<MessageViewBody> createState() => _MessageViewBodyState();
}

class _MessageViewBodyState extends State<MessageViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MessageCubit>(context).getMessage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessageCubit, MessageState>(
      listener: (context, state) {
        if (state is FaliureMessageState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            customShowSnackBar(context, state.errorMessage);
          });
        }
      },
      child: BlocBuilder<MessageCubit, MessageState>(
        builder: (context, state) {
          if (state is IsLoadingMessageState) {
            return const ShimmerLoading();
          } else if (state is SuccessMessageState) {
            return ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  return MessageListViewItem(message: state.messages[ state.messages.length-1-index].message, createdon: state.messages[index].createdOn,);
                });
          } else if (state is FaliureMessageState) {
            return const Center(
              child: Text('No message.'),
            );
          } else {
            return const Center(child: Text('Waiting for  data...'));
          }
        },
      ),
    );
  }
}
