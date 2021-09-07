import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';

const _kRefreshDuration = 60;

class ReloadCountdown extends StatefulWidget {
  const ReloadCountdown({Key? key}) : super(key: key);

  @override
  _ReloadCountdownState createState() => _ReloadCountdownState();
}

class _ReloadCountdownState extends State<ReloadCountdown>
    with SingleTickerProviderStateMixin {
  late AnimationController _animation;
  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
        vsync: this,
        duration: const Duration(seconds: _kRefreshDuration),
        upperBound: _kRefreshDuration.toDouble(),
        lowerBound: 1);
    _animate();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      child:
     Text('Reload in: ${_animation.value.round()}') ,
    )
        ;
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  void _reload() {
    BlocProvider.of<MasterDetailBloc>(context).add(const MasterDetailReload());
    _animate();
  }

  void _animate() {
    _animation.value = _kRefreshDuration.toDouble();
    _animation.animateBack(1).then((value) => _reload());
    _animation.addListener(() => setState(() {}));
  }
}
