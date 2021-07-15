import 'package:flutter/material.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SelectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SelectionAppBar({
    Key key,
    this.title,
    this.selection = const Selection.empty(),
    this.function,
    this.deleteFunction,
    this.approvalFunction,
    this.editFunction,
    this.downloadFunction,
  }) : super(key: key);

  final Widget title;
  final Selection selection;
  final Function function;
  final Function deleteFunction;
  final Function approvalFunction;
  final Function editFunction;
  final Function downloadFunction;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: selection.isSelecting
          ? AppBar(
        backgroundColor: Colors.black,
              key: const Key('selecting'),
              titleSpacing: 0,
              leading:  CloseButton(
                onPressed: function),
              title:  NeumorphicText(
                '${selection.amount} item(s) selected',
                style: NeumorphicStyle(
                    depth: 1.00,
                    color: Colors.white
                ),
                textStyle: NeumorphicTextStyle(
                  fontSize: 16.00,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins-Thin',
                ),
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: editFunction,
              child: Icon(
                Icons.edit_outlined,
                color: Colors.white,
                size: 22.00,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: deleteFunction,
              child: Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: 22.00,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: approvalFunction,
              child: Icon(
                Icons.done_outline_sharp,
                color: Colors.white,
                size: 22.00,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: downloadFunction,
              child: Icon(
                Icons.download_outlined,
                color: Colors.white,
                size: 22.00,
              ),
            ),
          ),
        ],
            )
          : AppBar(
              key: const Key('not-selecting'),
              title: title,
            ),
    );
  }
}
