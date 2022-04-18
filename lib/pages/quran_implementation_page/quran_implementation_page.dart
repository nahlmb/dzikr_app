import 'package:dzikr/data/quran_data/quran_data_model/quran_page_shower_config_model.dart';
import 'package:dzikr/widgets/quran_page_shower/quran_page_shower_widget.dart';
import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:dzikr_app/widgets/opacity_pressed_widget/opacity_pressed_widget.dart';
import 'package:flutter/material.dart';

class QuranImplementationPage extends StatefulWidget {
  const QuranImplementationPage({Key? key, this.listener}) : super(key: key);
  final Function(int pageChange)? listener;

  @override
  State<QuranImplementationPage> createState() =>
      _QuranImplementationPageState();
}

class _QuranImplementationPageState extends State<QuranImplementationPage> {
  String mode = QuranPageMode.page;

  @override
  Widget build(BuildContext context) {
    return QuranPageShower(
      onPageChange: (page) {
        if (widget.listener != null) widget.listener!(page);
      },
      appBar: AppBarWidget.getAppbar(context,
          title: "AlQuran",
          backgroundColor: colorSchame(context).surface,
          actions: [
            OpacityPressedWidget(
              onPress: () {
                setState(() {
                  mode == QuranPageMode.page
                      ? mode = QuranPageMode.list
                      : mode = QuranPageMode.page;
                });
              },
              child: mode == QuranPageMode.page
                  ? const Icon(
                      Icons.segment_rounded,
                      size: SizeConfig.s28,
                    )
                  : const Icon(
                      Icons.menu_book_rounded,
                      size: SizeConfig.s28,
                    ),
            )
          ]),
      config: QuranPageShowerConfig(
          primaryColor: colorSchame(context).surface,
          onPrimaryColor: colorSchame(context).onSurface,
          accentColor: colorSchame(context).primary,
          onAccentColor: colorSchame(context).onPrimary,
          surfaceColor: colorSchame(context).surface,
          onSurfaceColor: colorSchame(context).onSurface,
          backgroundColor: colorSchame(context).background,
          onBackgroundColor: colorSchame(context).onBackground,
          isUsingBottomIndicator: true,
          pageMode: mode),
    );
  }
}
