import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/widgets/opacity_pressed_widget/opacity_pressed_widget.dart';
import 'package:flutter/material.dart';

class NextButtonWidget extends StatelessWidget {
  const NextButtonWidget(
      {Key? key,
      required this.onPress,
      this.iconColor,
      this.backgroundColor,
      this.isSmall = false})
      : super(key: key);

  final Function() onPress;
  final Color? iconColor, backgroundColor;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return OpacityPressedWidget(
      onPress: onPress,
      child: Container(
        padding: const EdgeInsets.all(SizeConfig.s6),
        decoration: BoxDecoration(
            color: backgroundColor ?? colorSchame(context).surface,
            borderRadius: SizeConfig.radius),
        child: Icon(
          Icons.chevron_right_rounded,
          size: isSmall ? SizeConfig.s24 : SizeConfig.s30,
          color: iconColor,
        ),
      ),
    );
  }
}
