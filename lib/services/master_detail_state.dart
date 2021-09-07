part of 'master_detail_bloc.dart';

abstract class MasterDetailState extends Equatable {
  final bool loading;
  final GetEmailAddressResponse? email;

  const MasterDetailState({required this.loading, this.email});
}

@CopyWith()
class MasterDetailNoItemsState extends MasterDetailState {
  const MasterDetailNoItemsState(
      {bool loading = false, GetEmailAddressResponse? email})
      : super(loading: loading, email: email);

  @override
  List<Object> get props => [loading];
}

@CopyWith()
class MasterDetailMessageListState extends MasterDetailState {
  final List<Message> items;
  final Message? shown;

  const MasterDetailMessageListState(
      {required this.items,
      this.shown,
      bool loading = false,
      GetEmailAddressResponse? email})
      : super(loading: loading, email: email);

  @override
  List<Object?> get props => [items, shown, loading];
}

@CopyWith()
class MasterDetailSelectedItemsState extends MasterDetailMessageListState {
  final List<Message> selected;

  const MasterDetailSelectedItemsState(
      {required this.selected,
      required List<Message> items,
      Message? shown,
      bool loading = false,
      GetEmailAddressResponse? email})
      : super(items: items, shown: shown, loading: loading, email: email);

  @override
  List<Object?> get props => [selected, items, shown, loading];
}
