import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';

import 'message_list_view.dart';
import 'message_view_bottom.dart';
import 'no_messages_found.dart';

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  late MasterDetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<MasterDetailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterDetailBloc, MasterDetailState>(
      builder: (context, state) {
        if (state is MasterDetailNoItemsState) {
          return const NoMessagesFound();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: MessageListView(state as MasterDetailMessageListState)),
            const MessageViewBottom(),
          ],
        );
      },
    );
  }
}
