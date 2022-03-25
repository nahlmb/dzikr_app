import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:dzikr_app/widgets/button_widget/button_widget.dart';
import 'package:dzikr_app/widgets/page_standart_divider_widget/page_standart_divider_widget.dart';
import 'package:flutter/material.dart';

class PrayerPage extends StatelessWidget {
  const PrayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getAppbar(context, title: "Prayer Time"),
      body: ListView(
        padding: SizeConfig.pagePadding,
        children: [
          Column(
            children: [
              const SizedBox(
                height: SizeConfig.pagePaddingDivider,
              ),
              Text(
                "12 Sya'ban 1443",
                style: textTheme(context).headline3,
              ),
              const Text(
                "23 Maret 2022",
                style: TextStyle(fontSize: SizeConfig.s16),
              ),
              const SizedBox(
                height: SizeConfig.pagePaddingDivider,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(SizeConfig.s20),
                decoration: BoxDecoration(
                    color: const Color(0xffC9E8FF),
                    borderRadius: SizeConfig.radius),
                child: Column(
                  children: [
                    Text("Dzhur",
                        style: textTheme(context)
                            .headline1
                            ?.copyWith(color: Colors.black)),
                    Text("12:00",
                        style: textTheme(context).headline1?.copyWith(
                            fontSize: SizeConfig.s42,
                            height: 1,
                            color: Colors.black)),
                    const SizedBox(
                      height: SizeConfig.s4,
                    ),
                    Text(
                      '3 Minutes to Dzhur',
                      style: textTheme(context)
                          .bodyText1
                          ?.copyWith(color: Colors.black),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: SizeConfig.pagePaddingDivider * 1.5,
              ),
              getPrayerTile(context,
                  icon: Icons.flare_rounded,
                  prayer: "Fajr",
                  time: "4:40 (WIB)"),
              getPrayerTile(context,
                  icon: Icons.light_mode_rounded,
                  prayer: "Dzuhur",
                  time: "4:40 (WIB)"),
              getPrayerTile(context,
                  icon: Icons.wb_sunny_rounded,
                  prayer: "Ashr",
                  time: "4:40 (WIB)"),
              getPrayerTile(context,
                  icon: Icons.brightness_4_rounded,
                  prayer: "Maghrib",
                  time: "4:40 (WIB)"),
              getPrayerTile(context,
                  icon: Icons.dark_mode_rounded,
                  prayer: "Isya",
                  time: "4:40 (WIB)"),
              ButtonWidget(
                text: "Lihat jadwal bulan ini",
                onTap: () {},
                isFull: true,
                backgroundColor: colorSchame(context).primary,
              ),
              const SizedBox(
                height: SizeConfig.pagePaddingDivider * 2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column getPrayerTile(BuildContext context,
      {required IconData icon, required String prayer, required String time}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(
                  width: SizeConfig.s12,
                ),
                Text(
                  prayer,
                  style: textTheme(context).headline1,
                ),
              ],
            ),
            Text(
              time,
              style: textTheme(context).bodyText1?.copyWith(fontSize: 18),
            ),
          ],
        ),
        const PageStandartDividerWidget(),
      ],
    );
  }
}
