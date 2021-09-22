import 'package:flutter/material.dart';
import 'package:guerrilla_mail/services/master_detail_bloc.dart';
import 'package:guerrilla_mail/widgets/account_bottom_bar/account_bottom_bar.dart';
import 'package:guerrilla_mail/widgets/account_bottom_bar/bottom_sheet_grabbing.dart';
import 'package:guerrilla_mail/widgets/api_refresh_indicator.dart';
import 'package:guerrilla_mail/widgets/message_list/message_list_tile.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

const kBottomSheetGrabbingHeight = 48.0;

class MessageListView extends StatefulWidget {
  final MasterDetailMessageListState state;

  const MessageListView(this.state, {Key? key}) : super(key: key);

  @override
  State<MessageListView> createState() => _MessageListViewState();
}

class _MessageListViewState extends State<MessageListView> {
  final _controller = SnappingSheetController();
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      controller: _controller,
      child: ApiRefreshIndicator(
        child: Material(
          color: Colors.transparent,
          child: ListView.builder(
            itemBuilder: (context, index) => MessageListTile(
                key: ValueKey(widget.state.items[index].id),
                message: widget.state.items[index]),
            itemCount: widget.state.items.length,
          ),
        ),
      ),
      snappingPositions: const [
        SnappingPosition.pixels(positionPixels: kBottomSheetGrabbingHeight / 2),
        SnappingPosition.factor(positionFactor: .25),
        SnappingPosition.factor(positionFactor: .6),
        SnappingPosition.factor(positionFactor: .9),
      ],
      grabbing: const BottomSheetGrabbing(),
      grabbingHeight: kBottomSheetGrabbingHeight,
      sheetBelow: SnappingSheetContent(
        childScrollController: _scrollController,
        draggable: true,
        child: AccountBottomBar(controller: _scrollController),
      ),
    );
  }
}
