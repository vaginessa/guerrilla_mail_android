import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';
import 'package:guerrilla_mail/widgets/api_refresh_indicator.dart';

class NoMessagesFound extends StatefulWidget {
  const NoMessagesFound({Key? key}) : super(key: key);

  @override
  State<NoMessagesFound> createState() => _NoMessagesFoundState();
}

class _NoMessagesFoundState extends State<NoMessagesFound> {
  @override
  Widget build(BuildContext context) {
    return ApiRefreshIndicator(
      child: Center(
        child: ListTile(
          leading: const Icon(Icons.info),
          title: const Text('No messages found.'),
          trailing: OutlinedButton(
            child: const Text('Reload'),
            onPressed: _reload,
          ),
        ),
      ),
    );
  }

  void _reload() {
    BlocProvider.of<MasterDetailBloc>(context).add(const MasterDetailReload());
  }
}
