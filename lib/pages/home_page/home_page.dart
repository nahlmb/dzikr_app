import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/config/theme_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/widgets/minus_divider_widget/minus_divider_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Column(
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
          flexibleSpace: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: Theme.of(context).colorScheme.surface)))),
          elevation: 0,
        ),
        body: SafeArea(
          child: ListView(
            padding: SizeConfig.pagePadding,
            children: [
              Container(
                padding: const EdgeInsets.all(SizeConfig.s20),
                decoration: BoxDecoration(
                    color: const Color(0xffC9E8FF),
                    borderRadius: SizeConfig.radius),
                child: Column(
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
                      '3 Menit menuju Dzhur',
                      style: textTheme(context)
                          .bodyText1
                          ?.copyWith(color: Colors.black),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: SizeConfig.s22,
              ),
              const MinusDividerWidget(
                  left: SizeConfig.s16, right: SizeConfig.s16),
              const SizedBox(
                height: SizeConfig.s22,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const SizedBox(
                  width: SizeConfig.s4,
                ),
                Expanded(
                    flex: 2,
                    child: getHeadlineIconItem(context,
                        icon: Icon(
                          Icons.auto_stories_rounded,
                          size: SizeConfig.s32,
                          color: ThemeConfig.sweetGreen,
                        ),
                        text: "Quran")),
                const Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: SizeConfig.s16,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: getHeadlineIconItem(context,
                        icon: Icon(
                          Icons.auto_awesome_rounded,
                          size: SizeConfig.s32,
                          color: ThemeConfig.sweetOrange,
                        ),
                        text: "Doa-Dzikir")),
                const Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: SizeConfig.s16,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: getHeadlineIconItem(context,
                        icon: Icon(
                          Icons.calendar_today_rounded,
                          size: SizeConfig.s32,
                          color: ThemeConfig.sweetPurple,
                        ),
                        text: "Kalendar")),
                const Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: SizeConfig.s16,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: getHeadlineIconItem(context,
                        icon: Icon(
                          Icons.schedule_rounded,
                          size: SizeConfig.s32,
                          color: ThemeConfig.sweetRed,
                        ),
                        text: "Quran")),
                const SizedBox(
                  width: SizeConfig.s4,
                ),
              ]),
              const SizedBox(
                height: SizeConfig.s22,
              ),
              const MinusDividerWidget(
                  left: SizeConfig.s16, right: SizeConfig.s16)
            ],
          ),
        ));
  }

  Widget getHeadlineIconItem(BuildContext context,
      {required Icon icon, required String text}) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                color: colorSchame(context).surface.withOpacity(0.05),
                borderRadius: SizeConfig.radius),
            child: Center(
              child: icon,
            ),
          ),
        ),
        const SizedBox(
          height: SizeConfig.s10,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style:
              textTheme(context).bodyText1?.copyWith(fontSize: SizeConfig.s12),
        )
      ],
    );
  }
}
