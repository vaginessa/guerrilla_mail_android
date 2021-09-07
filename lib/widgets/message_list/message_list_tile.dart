import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';
import 'package:guerrilla_mail_api/guerrilla_mail_api.dart';

class MessageListTile extends StatefulWidget {
  final Message message;

  const MessageListTile({Key? key, required this.message}) : super(key: key);

  @override
  State<MessageListTile> createState() => _MessageListTileState();
}

class _MessageListTileState extends State<MessageListTile> {
  late final MasterDetailBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<MasterDetailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.message.subject),
      subtitle: Text(widget.message.from),
      onTap: _showMessage,
    );
  }

  void _showMessage() {
    _bloc.add(MasterDetailShowItem(widget.message));
  }
}
