import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppbar(context, title: "Calendar"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(SizeConfig.s12),
              decoration: BoxDecoration(
                  color: colorSchame(context).surface,
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                Icons.hourglass_top_rounded,
                color: colorSchame(context).primary,
                size: SizeConfig.s64,
              ),
            ),
            const SizedBox(
              height: SizeConfig.s14,
            ),
            Text(
              "Please stay tuned \nComing soon",
              textAlign: TextAlign.center,
              style: textTheme(context).headline2,
            ),
          ],
        ),
      ),
    );
  }
}
