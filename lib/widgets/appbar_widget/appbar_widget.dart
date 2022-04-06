import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:flutter/material.dart';

class AppBarWidget {
  static getAppbar(BuildContext context,
      {String? title, List<Widget>? actions, Color? backgroundColor}) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: colorSchame(context).onBackground),
      centerTitle: true,
      title: title != null
          ? Text(
              title,
              style: textTheme(context).headline2,
            )
          : Column(
              children: [
                MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? Image.asset(
                        'assets/images/im_dzikr_logo_white.png',
                        height: 47,
                      )
                    : Image.asset(
                        'assets/images/im_dzikr_logo.png',
                        height: 47,
                      ),
                const SizedBox(
                  height: SizeConfig.s12,
                )
              ],
            ),
      actions: [
        if (actions != null)
          for (var actionIndex = 0;
              actionIndex < actions!.length;
              actionIndex++)
            actions[actionIndex],
        const SizedBox(
          width: SizeConfig.s14,
        )
      ],
      flexibleSpace: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.surface)))),
      elevation: 0,
    );
  }
}
