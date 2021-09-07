part of 'master_detail_bloc.dart';

abstract class MasterDetailEvent extends Equatable {
  const MasterDetailEvent();
}

class MasterDetailInitialization extends MasterDetailEvent {
  final String? language;
  final Uri? endpoint;
  final String? sessionId;

  const MasterDetailInitialization(
      {this.language, this.endpoint, this.sessionId});
  @override
  List<Object?> get props => [language, endpoint, sessionId];
}

class MasterDetailReload extends MasterDetailEvent {
  const MasterDetailReload();
  @override
  List<Object?> get props => [];
}

class MasterDetailAddItems extends MasterDetailEvent {
  final List<Message> items;

  const MasterDetailAddItems(this.items);
  @override
  List<Object> get props => [items];
}

class MasterDetailRemoveItems extends MasterDetailEvent {
  final List<Message> items;

  const MasterDetailRemoveItems(this.items);
  @override
  List<Object> get props => [items];
}

class MasterDetailSelectItems extends MasterDetailEvent {
  final List<Message> items;

  const MasterDetailSelectItems(this.items);
  @override
  List<Object> get props => [items];
}

class MasterDetailUnSelectItems extends MasterDetailEvent {
  final List<Message> items;

  const MasterDetailUnSelectItems(this.items);
  @override
  List<Object> get props => [items];
}

class MasterDetailResetSelection extends MasterDetailEvent {
  @override
  List<Object> get props => [];
}

class MasterDetailShowItem extends MasterDetailEvent {
  final Message item;

  const MasterDetailShowItem(this.item);
  @override
  List<Object> get props => [item];
}

class MasterDetailUnShow extends MasterDetailEvent {
  @override
  List<Object> get props => [];
}

// TODO(TheOneWithTheBraid): Add to favorites
// TODO(TheOneWithTheBraid): Store offline
// TODO(TheOneWithTheBraid): Mark as persistent
