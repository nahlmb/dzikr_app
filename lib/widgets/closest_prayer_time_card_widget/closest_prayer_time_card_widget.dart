import 'package:dzikr/dzikr.dart';
import 'package:dzikr_app/pages/prayer_page/prayer_page.dart';
import 'package:dzikr_app/widgets/next_button_widget/next_button_widget.dart';
import 'package:flutter/material.dart';

class ClosestPrayerCard extends StatelessWidget {
  const ClosestPrayerCard(
      {Key? key, required this.prayer, this.pureMode = true})
      : super(key: key);

  final PrayerTime? prayer;
  final bool pureMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeConfig.s20),
      decoration: BoxDecoration(
          color: const Color(0xffC9E8FF), borderRadius: SizeConfig.radius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: pureMode
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                    prayer == null
                        ? "-"
                        : prayer!.todaySchedule.closestPrayer.closestPrayer,
                    style: textTheme(context)
                        .headline1
                        ?.copyWith(color: Colors.black)),
                Text(
                    prayer == null
                        ? "-"
                        : prayer!.todaySchedule.closestPrayer.closestTime
                            .substring(0, 5),
                    style: textTheme(context).headline1?.copyWith(
                        fontSize: SizeConfig.s42,
                        height: 1,
                        color: Colors.black)),
                const SizedBox(
                  height: SizeConfig.s4,
                ),
                Text(prayer == null ? '-' : '${prayer!.placeName}',
                    style: textTheme(context)
                        .bodyText1
                        ?.copyWith(color: Colors.black)),
                Text(
                  prayer == null
                      ? "-"
                      : "${PrayerTimeTool.findClosestPrayerTime(prayer!).todaySchedule.closestPrayer.durationToClosestPrayer.inMinutes} Minute to ${prayer!.todaySchedule.closestPrayer.closestPrayer}",
                  style: textTheme(context)
                      .bodyText1
                      ?.copyWith(color: Colors.black),
                )
              ],
            ),
          ),
          pureMode
              ? const SizedBox()
              : NextButtonWidget(
                  onPress: () {
                    if (prayer != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrayerPage(
                                    data: prayer!,
                                  )));
                    }
                  },
                  iconColor: Colors.black,
                )
        ],
      ),
    );
  }
}
