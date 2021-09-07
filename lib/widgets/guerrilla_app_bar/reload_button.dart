import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';

class ReloadButton extends StatefulWidget {
  const ReloadButton({Key? key}) : super(key: key);

  @override
  State<ReloadButton> createState() => _ReloadButtonState();
}

class _ReloadButtonState extends State<ReloadButton>
    with TickerProviderStateMixin {
  late AnimationController _animation;
  @override
  void initState() {
    super.initState();
    _animation =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Transform.rotate(
        angle: _animation.value * 2 * pi,
        child: const Icon(Icons.refresh),
      ),
      tooltip: 'Reload',
      onPressed: _reload,
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  void _reload() {
    _animation.animateTo(1).then((value) => _animation.value = 0);
    BlocProvider.of<MasterDetailBloc>(context).add(const MasterDetailReload());
  }
}
