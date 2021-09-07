import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:guerrilla_mail/tools/debug_labels.dart';
import 'package:guerrilla_mail_api/guerrilla_mail_api.dart';

part 'master_detail_bloc.g.dart';
part 'master_detail_event.dart';
part 'master_detail_state.dart';

class MasterDetailBloc extends Bloc<MasterDetailEvent, MasterDetailState> {
  MasterDetailBloc() : super(const MasterDetailNoItemsState(loading: true));

  late GuerrillaMailApi client;
  final List<Message> _messages = [];
  Message? _shown;
  final List<Message> _selected = [];
  bool _loading = true;
  GetEmailAddressResponse? _email;

  @override
  Stream<MasterDetailState> mapEventToState(
    MasterDetailEvent event,
  ) async* {
    log('Got event $event', name: DebugLabels.masterDetailBloc);
    // handling events
    // UI actions first
    if (event is MasterDetailAddItems) {
      _messages.addAll(event.items);
    } else if (event is MasterDetailRemoveItems) {
      for (var message in event.items) {
        _messages.remove(message);
      }
    } else if (event is MasterDetailSelectItems) {
      _selected.addAll(event.items);
    } else if (event is MasterDetailUnSelectItems) {
      for (var message in event.items) {
        _selected.remove(message);
      }
    } else if (event is MasterDetailResetSelection) {
      _selected.clear();
    } else if (event is MasterDetailShowItem) {
      _shown = event.item;
    } else if (event is MasterDetailUnShow) {
      _shown = null;
    }
    // now API calls
    else if (event is MasterDetailInitialization) {
      _loading = true;
      yield _sendState();
      _clearAll();
      client = GuerrillaMailApi();
      _email = await client.getEmailAddress();
      final response = await client.getEmailList();
      _messages.addAll(response.list);
      _loading = false;
    } else if (event is MasterDetailReload) {
      _loading = true;
      yield _sendState();
      int latestId = 0;
      for (var i in _messages) {
        if (i.id > 0) latestId = i.id;
      }
      final response = await client.checkEmail(latestId);
      _messages.addAll(response.list);
      _loading = false;
    } else {
      log('Got unexpected type ${event.runtimeType}.',
          name: DebugLabels.masterDetailBloc);
    }

    // finally responding
    yield _sendState();
  }

  void _clearAll() {
    _loading = true;
    _messages.clear();
    _selected.clear();
    _shown = null;
  }

  MasterDetailState _sendState() {
    _messages.sort((a, b) => b.timestamp.millisecondsSinceEpoch);

    late MasterDetailState state;
    if (_messages.isEmpty) {
      state = MasterDetailNoItemsState(loading: _loading, email: _email);
    } else {
      if (_selected.isNotEmpty) {
        state = MasterDetailSelectedItemsState(
            selected: _selected,
            items: _messages,
            shown: _shown,
            loading: _loading,
            email: _email);
      } else {
        state = MasterDetailMessageListState(
            items: _messages, shown: _shown, loading: _loading, email: _email);
      }
    }
    log('Sending state $state.', name: DebugLabels.masterDetailBloc);
    return state;
  }
}
