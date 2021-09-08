import 'package:flutter/material.dart';
import 'package:guerrilla_mail/widgets/message_list/message_list_view.dart';

class BottomSheetGrabbing extends StatelessWidget {
  const BottomSheetGrabbing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      color: Theme.of(context).backgroundColor,
      child: SizedBox(
        height: kBottomSheetGrabbingHeight,
        child: Center(
          child: Material(
            color: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: Tooltip(
              message: 'Settings',
              child: SizedBox(
                height: 6,
                width: 92,
                child: Container(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
