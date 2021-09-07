import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';

import 'message_body.dart';
import 'no_message_selected_tile.dart';

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  DateTime? _lastId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterDetailBloc, MasterDetailState>(
      builder: (context, state) {
        late Widget child;
        bool forwards = false;
        if (state is MasterDetailMessageListState && state.shown != null) {
          // checking animation direction
          if (!state.shown!.timestamp.isAfter(_lastId ?? DateTime.now())) {
            forwards = true;
          }
          _lastId = state.shown!.timestamp;

          child = ListView(
            key: ValueKey(state.shown!.id),
            controller: ScrollController(),
            children: [
              ListTile(
                title: Text(state.shown!.subject),
                subtitle: Text(state.shown!.from),
                trailing: Text(state.shown!.date),
              ),
              const Divider(),
              MessageBody(message: state.shown!),
            ],
          );
        } else {
          child = const NoMessageSelectedTile(
            key: ValueKey(null),
          );
        }
        return PageTransitionSwitcher(
          reverse: !forwards,
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation, secondaryAnimation) {
            return SharedAxisTransition(
                child: child,
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.vertical);
          },
          layoutBuilder: PageTransitionSwitcher.defaultLayoutBuilder,
          child: child,
        );
      },
    );
  }
}
