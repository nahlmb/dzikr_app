import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/widgets/next_button_widget/next_button_widget.dart';
import 'package:flutter/material.dart';

class ClosestPrayerCard extends StatelessWidget {
  const ClosestPrayerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeConfig.s20),
      decoration: BoxDecoration(
          color: const Color(0xffC9E8FF), borderRadius: SizeConfig.radius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                style:
                    textTheme(context).bodyText1?.copyWith(color: Colors.black),
              )
            ],
          ),
          NextButtonWidget(
            onPress: () {},
            iconColor: Colors.black,
          )
        ],
      ),
    );
  }
}
