import 'package:flutter/material.dart';

import 'reload_button.dart';
import 'reload_countdown.dart';

class GuerrillaAppBar extends StatefulWidget implements PreferredSizeWidget {
  const GuerrillaAppBar({Key? key}) : super(key: key);

  @override
  State<GuerrillaAppBar> createState() => _GuerrillaAppBarState();

  @override
  final Size preferredSize = const Size.fromHeight(56);
}

class _GuerrillaAppBarState extends State<GuerrillaAppBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Guerrilla Mail'),
      actions: const [
        ReloadCountdown(),
        ReloadButton(),
      ],
    );
  }
}
