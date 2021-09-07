// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_detail_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension MasterDetailNoItemsStateCopyWith on MasterDetailNoItemsState {
  MasterDetailNoItemsState copyWith({
    GetEmailAddressResponse? email,
    bool? loading,
  }) {
    return MasterDetailNoItemsState(
      email: email ?? this.email,
      loading: loading ?? this.loading,
    );
  }
}

extension MasterDetailMessageListStateCopyWith on MasterDetailMessageListState {
  MasterDetailMessageListState copyWith({
    GetEmailAddressResponse? email,
    List<Message>? items,
    bool? loading,
    Message? shown,
  }) {
    return MasterDetailMessageListState(
      email: email ?? this.email,
      items: items ?? this.items,
      loading: loading ?? this.loading,
      shown: shown ?? this.shown,
    );
  }
}

extension MasterDetailSelectedItemsStateCopyWith
    on MasterDetailSelectedItemsState {
  MasterDetailSelectedItemsState copyWith({
    GetEmailAddressResponse? email,
    List<Message>? items,
    bool? loading,
    List<Message>? selected,
    Message? shown,
  }) {
    return MasterDetailSelectedItemsState(
      email: email ?? this.email,
      items: items ?? this.items,
      loading: loading ?? this.loading,
      selected: selected ?? this.selected,
      shown: shown ?? this.shown,
    );
  }
}
