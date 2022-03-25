import 'package:dzikr_app/core/config/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color? backgroundColor;
  final TextStyle? buttonTextStyle;
  final bool isFull;
  final Icon? icon;
  final bool isSmall;

  final bool splitColor;
  final bool isLoading;
  final bool isSymetricPadding;

  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onTap,
      this.backgroundColor,
      this.buttonTextStyle,
      this.isFull = false,
      this.icon,
      this.isSmall = false,
      this.isLoading = false,
      this.splitColor = false,
      this.isSymetricPadding = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: (isLoading) ? null : onTap,
      child: Container(
        width: (isFull) ? double.infinity : null,
        padding: EdgeInsets.symmetric(
            vertical: (isSmall) ? SizeConfig.s10 : SizeConfig.s16,
            horizontal: (isSmall)
                ? (isSymetricPadding)
                    ? SizeConfig.s8
                    : SizeConfig.s10
                : SizeConfig.s18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.s12),
          border: (splitColor)
              ? Border.all(
                  color: ((backgroundColor == null)
                      ? Theme.of(context).colorScheme.primary
                      : backgroundColor)!)
              : null,
          color: (splitColor)
              ? Colors.transparent
              : (backgroundColor == null)
                  ? Theme.of(context).colorScheme.surface.withOpacity(0.15)
                  : backgroundColor,
        ),
        child: (isLoading)
            ? Center(
                child: SizedBox(
                    height: SizeConfig.s18,
                    width: SizeConfig.s18,
                    child: CircularProgressIndicator(
                        strokeWidth: SizeConfig.s2 * 1.5,
                        color: splitColor ? backgroundColor : Colors.white)))
            : (icon != null)
                ? icon
                : Text(
                    text,
                    textAlign: TextAlign.center,
                    style: (buttonTextStyle == null)
                        ? Theme.of(context).textTheme.bodyText1?.copyWith(
                            //fontWeight: FontWeight.normal,
                            color: splitColor
                                ? backgroundColor
                                : Theme.of(context).colorScheme.onSecondary)
                        : buttonTextStyle,
                  ),
      ),
    );
  }
}
