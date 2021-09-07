import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';
import 'package:guerrilla_mail/widgets/message_list/message_list.dart';
import 'package:guerrilla_mail/widgets/message_view/message_view.dart';

const _kAnimationDuration = Duration(milliseconds: 250);

class HandheldLayout extends StatefulWidget {
  const HandheldLayout({Key? key}) : super(key: key);

  @override
  State<HandheldLayout> createState() => _HandheldLayoutState();
}

class _HandheldLayoutState extends State<HandheldLayout> {
  final _controller = PageController();
  late final MasterDetailBloc _bloc;
  late final StreamSubscription<MasterDetailState> _subscription;

  @override
  void initState() {
    _bloc = BlocProvider.of<MasterDetailBloc>(context);
    // manually handling events to correspondingly update the controller
    _subscription = _bloc.stream.listen(_handleEvent);

    _controller.addListener(_controllerChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterDetailBloc, MasterDetailState>(
      builder: (context, state) {
        return PageView(
          controller: _controller,
          physics: state is MasterDetailMessageListState && state.shown != null
              ? null
              : const NeverScrollableScrollPhysics(),
          children: [
            const MessageList(),
            WillPopScope(
              onWillPop: _handleMobilePop,
              child: const MessageView(),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _handleEvent(MasterDetailState state) {
    if (state is MasterDetailMessageListState && state.shown != null) {
      _controller.animateToPage(1,
          curve: Curves.ease, duration: _kAnimationDuration);
    } else {
      _controller.animateToPage(0,
          curve: Curves.ease, duration: _kAnimationDuration);
    }
  }

  void _controllerChange() {
    if (_controller.page == 0) _bloc.add(MasterDetailUnShow());
  }

  Future<bool> _handleMobilePop() async {
    _controller.animateToPage(0,
        curve: Curves.ease, duration: _kAnimationDuration);
    return false;
  }
}
