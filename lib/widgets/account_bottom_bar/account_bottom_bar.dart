import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';

class AccountBottomBar extends StatefulWidget {
  final ScrollController? controller;
  const AccountBottomBar({Key? key, this.controller}) : super(key: key);

  @override
  State<AccountBottomBar> createState() => _AccountBottomBarState();
}

class _AccountBottomBarState extends State<AccountBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterDetailBloc, MasterDetailState>(
      builder: (context, state) {
        // TODO(TheOneWithTheBraid): Migrate to snappy bottom sheet
        return ListView(
          controller: widget.controller,
          children: [
            Tooltip(
              message: 'Tap to copy',
              child: ListTile(
                title: Text(state.email?.emailAddress ?? '...'),
                subtitle: const Text('Your disposable address'),
                onTap: () => _copyAddress(state.email?.emailAddress),
              ),
            ),
          ],
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
