import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:guerrilla_mail/pages/home_page/horizontal_layout.dart';

import '../../widgets/guerrilla_app_bar/guerrilla_app_bar.dart';
import 'handheld_layout.dart';

const kDesktopBreakpoint = 786;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GuerrillaAppBar(),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          late Widget child;
          if (constraints.maxWidth >= kDesktopBreakpoint) {
            child =
                const HorizontalLayout(key: ValueKey(Orientation.landscape));
          } else {
            child = const HandheldLayout(key: ValueKey(Orientation.portrait));
          }
          return PageTransitionSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation, secondaryAnimation) {
              return SharedAxisTransition(
                  child: child,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.scaled);
            },
            layoutBuilder: PageTransitionSwitcher.defaultLayoutBuilder,
            child: child,
          );
        },
      ),
    );
  }
}
