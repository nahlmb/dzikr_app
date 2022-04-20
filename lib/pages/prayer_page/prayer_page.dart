import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/prayer_response_model.dart';
import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/prayer_time_data_model.dart';
import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:dzikr_app/widgets/button_widget/button_widget.dart';
import 'package:dzikr_app/widgets/closest_prayer_time_card_widget/closest_prayer_time_card_widget.dart';
import 'package:dzikr_app/widgets/page_standart_divider_widget/page_standart_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class PrayerPage extends StatelessWidget {
  const PrayerPage({Key? key, required this.data}) : super(key: key);

  final PrayerResponseModel data;

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
                HijriCalendar.now().toFormat('dd MMMM yyyy'),
                style: textTheme(context).headline3,
              ),
              Text(
                DateFormat("dd MMM yyyy").format(DateTime.now()),
                style: const TextStyle(fontSize: SizeConfig.s16),
              ),
              const SizedBox(
                height: SizeConfig.pagePaddingDivider,
              ),
              ClosestPrayerCard(prayer: data),
              const SizedBox(
                height: SizeConfig.pagePaddingDivider * 1.5,
              ),
              getPrayerTile(context,
                  icon: Icons.flare_rounded,
                  prayer: "Fajr",
                  time: data.todaySchedule.fajr),
              getPrayerTile(context,
                  icon: Icons.light_mode_rounded,
                  prayer: "Dzuhur",
                  time: data.todaySchedule.dzhur),
              getPrayerTile(context,
                  icon: Icons.wb_sunny_rounded,
                  prayer: "Ashr",
                  time: data.todaySchedule.ashar),
              getPrayerTile(context,
                  icon: Icons.brightness_4_rounded,
                  prayer: "Maghrib",
                  time: data.todaySchedule.maghrib),
              getPrayerTile(context,
                  icon: Icons.dark_mode_rounded,
                  prayer: "Isya",
                  time: data.todaySchedule.isya),
              // ButtonWidget(
              //   text: "Lihat jadwal bulan ini",
              //   onTap: () {},
              //   isFull: true,
              //   backgroundColor: colorSchame(context).primary,
              // ),
              // const SizedBox(
              //   height: SizeConfig.pagePaddingDivider * 2,
              // ),
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
