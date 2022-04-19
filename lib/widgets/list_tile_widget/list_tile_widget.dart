import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/widgets/minus_divider_widget/minus_divider_widget.dart';
import 'package:dzikr_app/widgets/opacity_pressed_widget/opacity_pressed_widget.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {Key? key, required this.onClick, this.title, this.content})
      : super(key: key);

  final Function() onClick;
  final String? title;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: SizeConfig.s18,
        ),
        OpacityPressedWidget(
          onPress: () {
            onClick();
          },
          child: Container(
            color: Colors.transparent,
            child: content ??
                Row(
                  children: [
                    Text(title ?? "A Tile"),
                  ],
                ),
          ),
        ),
        const SizedBox(
          height: SizeConfig.s18,
        ),
        const MinusDividerWidget(
            left: SizeConfig.pagePaddingNum, right: SizeConfig.pagePaddingNum)
      ],
    );
  }
}
