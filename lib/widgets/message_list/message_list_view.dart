import 'package:flutter/material.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';
import 'package:guerrilla_mail/widgets/api_refresh_indicator.dart';
import 'package:guerrilla_mail/widgets/message_list/message_list_tile.dart';

class MessageListView extends StatelessWidget {
  final MasterDetailMessageListState state;

  const MessageListView(this.state, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ApiRefreshIndicator(
      child: Material(
        color: Colors.transparent,
        child: ListView.builder(
          itemBuilder: (context, index) => MessageListTile(
              key: ValueKey(state.items[index].id),
              message: state.items[index]),
          itemCount: state.items.length,
        ),
      ),
    );
  }
}
