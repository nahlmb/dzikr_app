import 'package:dzikr/dzikr.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({Key? key, this.listener, this.initialPage})
      : super(key: key);
  final int? initialPage;
  final Function(int pageChange)? listener;

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  String mode = QuranPageMode.page;

  @override
  Widget build(BuildContext context) {
    return QuranPageReader(
      initialPage: widget.initialPage,
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
      config: QuranPageReaderConfig(
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
