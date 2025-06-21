import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/authentaction/presentation/view/custom_show_snack_bar.dart';
import 'package:splash_app/feature/technical/message/presentation/manger/message_cubit.dart';
import 'package:splash_app/feature/technical/message/presentation/manger/message_state.dart';
import 'package:splash_app/feature/technical/message/presentation/widget/message_list_view_item.dart';
import 'package:splash_app/feature/technical/technical_home/presentation/widget/shamer_loading.dart';

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
          return RefreshIndicator(
            color: ColorsManager.mainColor, 
            onRefresh: () async {
              await BlocProvider.of<MessageCubit>(context).getMessage();
            },
            child: state is IsLoadingMessageState
                ? const ShimmerLoading()
                : state is SuccessMessageState
                    ? ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          final message = state.messages[index];
                          return MessageListViewItem(
                            message: message.message,
                            createdon: message.createdOn,
                          );
                        },
                      )
                    : const Center(child: Text('No messages available.')),
          );
        },
      ),
    );
  }
}
