import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';

class MessageViewBottom extends StatefulWidget {
  const MessageViewBottom({Key? key}) : super(key: key);

  @override
  State<MessageViewBottom> createState() => _MessageViewBottomState();
}

class _MessageViewBottomState extends State<MessageViewBottom> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterDetailBloc, MasterDetailState>(
      builder: (context, state) {
        // TODO(TheOneWithTheBraid): Migrate to snappy bottom sheet
        return BottomAppBar(
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
          ),
          color: Theme.of(context).backgroundColor,
          child: Tooltip(
            message: 'Tap to copy',
            child: ListTile(
              title: Text(state.email?.emailAddress ?? '...'),
              subtitle: const Text('Your disposable address'),
              onTap: () => _copyAddress(state.email?.emailAddress),
            ),
          ),
        );
      },
    );
  }

  void _copyAddress(String? email) {
    Clipboard.setData(ClipboardData(text: email));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied mail address to clipboard.'),
      ),
    );
  }
}
