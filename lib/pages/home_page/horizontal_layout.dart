import 'package:flutter/material.dart';
import 'package:guerrilla_mail/widgets/message_list/message_list.dart';
import 'package:guerrilla_mail/widgets/message_view/message_view.dart';

const double _kMaxWidth = 1024 + 512;
const double _kMaxHeight = 786;

final _borderRadius = BorderRadius.circular(16);

class HorizontalLayout extends StatelessWidget {
  const HorizontalLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final child = Row(
          children: [
            const SizedBox(
              width: 256 + 128,
              child: MessageList(),
            ),
            SizedBox(
              width: 2,
              child: Material(
                color: Theme.of(context).backgroundColor,
                child: Container(),
              ),
            ),
            const Expanded(child: MessageView()),
          ],
        );
        if (constraints.maxWidth > _kMaxWidth ||
            constraints.maxHeight > _kMaxHeight) {
          return Container(
            alignment: Alignment.center,
            color: Theme.of(context).backgroundColor,
            child: Container(
              constraints: const BoxConstraints(
                  maxWidth: _kMaxWidth, maxHeight: _kMaxHeight),
              child: Material(
                borderRadius: _borderRadius,
                elevation: 4,
                child: ClipRRect(
                  borderRadius: _borderRadius,
                  child: child,
                ),
              ),
            ),
          );
        } else {
          return child;
        }
      },
    );
  }
}
