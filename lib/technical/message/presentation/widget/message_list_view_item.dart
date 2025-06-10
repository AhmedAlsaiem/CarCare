import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class MessageListViewItem extends StatelessWidget {
  const MessageListViewItem({
    super.key,
    required this.message,
    required this.createdon,
  });

  final String message;
  final String createdon;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(createdon);
    String formattedDate = DateFormat("yyyy-MM-dd hh:mm a").format(dateTime);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Card(
        elevation: .5,
        color: Colors.grey[100],
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 120,
          ),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    message,
                    style: StylesManager.textStylewmedium20maincolor.
                    copyWith(color: Colors.black),
                  ),
                ),
                Align(             
                  alignment: Alignment.bottomRight,
                  child: Text(formattedDate),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}