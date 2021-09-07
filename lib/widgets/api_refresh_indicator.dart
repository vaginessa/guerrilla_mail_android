import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';

class ApiRefreshIndicator extends StatefulWidget {
  final Widget child;

  const ApiRefreshIndicator({Key? key, required this.child}) : super(key: key);

  @override
  State<ApiRefreshIndicator> createState() => _ApiRefreshIndicatorState();
}

class _ApiRefreshIndicatorState extends State<ApiRefreshIndicator> {
  late final MasterDetailBloc _bloc;
  GlobalKey<RefreshIndicatorState> _indicatorState = GlobalKey();

  Completer<void> _completer = Completer<void>();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<MasterDetailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterDetailBloc, MasterDetailState>(
      bloc: _bloc,
      builder: (context, state) {
        if (!state.loading && !_completer.isCompleted) {
          _completer.complete();
          _indicatorState = GlobalKey();
        }
        if (state.loading) {
          _indicatorState.currentState?.show();
        }
        return RefreshIndicator(
          key: _indicatorState,
          onRefresh: _refresh,
          child: widget.child,
        );
      },
    );
  }

  void _reload() {
    _bloc.add(const MasterDetailReload());
  }

  Future<void> _refresh() {
    _completer = Completer<void>();
    _reload();
    return _completer.future;
  }
}
