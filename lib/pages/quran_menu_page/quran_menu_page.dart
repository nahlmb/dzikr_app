import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/config/theme_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:dzikr_app/widgets/list_tile_widget/list_tile_widget.dart';
import 'package:dzikr_app/widgets/minus_divider_widget/minus_divider_widget.dart';
import 'package:dzikr_app/widgets/next_button_widget/next_button_widget.dart';
import 'package:dzikr_app/widgets/opacity_pressed_widget/opacity_pressed_widget.dart';
import 'package:flutter/material.dart';

class QuranMenuPage extends StatelessWidget {
  const QuranMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppbar(context, title: "AlQuran"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(SizeConfig.pagePaddingNum),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Surah List",
                  style: textTheme(context).headline3,
                ),
                const Text("Open Quran by begining of surah"),
              ],
            ),
          ),
          const SizedBox(
            height: paddingS,
          ),
          Container(
            decoration: BoxDecoration(color: colorSchame(context).surface),
            child: ListView(
              padding: SizeConfig.pageHorizontalPadding,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                ListTileWidget(
                  content: Row(
                    children: [
                      Container(
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                            color: colorSchame(context).primary,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                            child: Text(
                          '1',
                          style: textTheme(context).headline6?.copyWith(
                                color: colorSchame(context).onPrimary,
                              ),
                        )),
                      ),
                      const SizedBox(
                        width: paddingL,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Al Fatihah",
                              style: textTheme(context).headline5,
                            ),
                            Text("Makiyah, 7 Verse")
                          ],
                        ),
                      ),
                      NextButtonWidget(
                        onPress: () {},
                        isSmall: true,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
