import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:guerrilla_mail/hive/hive_boxes.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';
import 'package:guerrilla_mail_api/guerrilla_mail_api.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageBody extends StatefulWidget {
  final Message message;

  const MessageBody({Key? key, required this.message}) : super(key: key);

  @override
  State<MessageBody> createState() => _MessageBodyState();
}

class _MessageBodyState extends State<MessageBody> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Message>>(
      valueListenable: HiveBoxes.messages.listenable(),
      builder: (context, snapshot, w) {
        late Message message;
        final id = widget.message.id;
        if (HiveBoxes.messages.containsKey(id)) {
          // using cached message
          message = HiveBoxes.messages.get(id)!;
        } else {
          // falling back to incomplete message
          message = widget.message;
          BlocProvider.of<MasterDetailBloc>(context)
              .client
              .fetchEmail(id)
              .then((value) => HiveBoxes.messages.put(id, value));
        }

        return Padding(
          padding: const EdgeInsets.all(8),
          child: HtmlWidget(
            message.body ?? message.excerpt,
            onTapUrl: _launchUrl,
          ),
        );
      },
    );
  }

  Future<bool> _launchUrl(String url) async {
    // TODO(TheOneWithTheBraid): Allow to skip dialog
    final response = await showModal(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Confirm to launch URL'),
              content: Text(url),
              actions: [
                TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text('Launch')),
              ],
            ));
    if (response == true) launch(url);
    return response == true;
  }
}
