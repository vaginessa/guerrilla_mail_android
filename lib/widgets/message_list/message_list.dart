import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';
import 'package:guerrilla_mail/widgets/api_refresh_indicator.dart';

import 'message_list_view.dart';
import 'no_messages_found.dart';

class MessageList extends StatelessWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterDetailBloc, MasterDetailState>(
      builder: (context, state) {
        late Widget child;
        if (state is MasterDetailNoItemsState) {
          if (state.loading) {
            child = Container();
          } else {
            child = const NoMessagesFound();
          }
        } else {
          child = MessageListView(state as MasterDetailMessageListState);
        }

        return ApiRefreshIndicator(
          child: child,
        );
      },
    );
  }
}
