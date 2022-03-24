import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/config/theme_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/widgets/button_widget/button_widget.dart';
import 'package:dzikr_app/widgets/minus_divider_widget/minus_divider_widget.dart';
import 'package:dzikr_app/widgets/opacity_pressed_widget/opacity_pressed_widget.dart';
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
          bottom: false,
          child: ListView(
            children: [
              const SizedBox(
                height: SizeConfig.s22,
              ),
              const Padding(
                padding: SizeConfig.pageHorizontalPadding,
                child: getPrayerCardSection(),
              ),
              const SizedBox(
                height: SizeConfig.s22,
              ),
              const MinusDividerWidget(
                  left: SizeConfig.s16, right: SizeConfig.s16),
              const SizedBox(
                height: SizeConfig.s22,
              ),
              Padding(
                padding: SizeConfig.pageHorizontalPadding,
                child: getMenuSection(context),
              ),
              const SizedBox(
                height: SizeConfig.s22,
              ),
              const MinusDividerWidget(
                  left: SizeConfig.s16, right: SizeConfig.s16),
              const SizedBox(
                height: SizeConfig.s22,
              ),
              Padding(
                padding: SizeConfig.pageHorizontalPadding,
                child: getQuranSection(context),
              ),
              const SizedBox(
                height: SizeConfig.s22,
              ),
              const MinusDividerWidget(
                  left: SizeConfig.s16, right: SizeConfig.s16),
              const SizedBox(
                height: SizeConfig.s22,
              ),
              Padding(
                padding: SizeConfig.pageHorizontalPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dzikir & Doa",
                      style: textTheme(context).headline3,
                    ),
                    const Text("Rekomendasi Dzikir dan Doa"),
                  ],
                ),
              ),
              const SizedBox(
                height: SizeConfig.s14,
              ),
              Container(
                decoration: BoxDecoration(color: colorSchame(context).surface),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  padding: SizeConfig.pageHorizontalPadding,
                  shrinkWrap: true,
                  children: const [
                    SizedBox(
                      height: SizeConfig.s18,
                    ),
                    Text(
                      "Dzikir Pagi",
                      style: TextStyle(fontSize: SizeConfig.s16),
                    ),
                    SizedBox(
                      height: SizeConfig.s18,
                    ),
                    MinusDividerWidget(
                        left: SizeConfig.pagePaddingNum,
                        right: SizeConfig.pagePaddingNum),
                    SizedBox(
                      height: SizeConfig.s18,
                    ),
                    Text(
                      "Dzikir Petang",
                      style: TextStyle(fontSize: SizeConfig.s16),
                    ),
                    SizedBox(
                      height: SizeConfig.s18,
                    ),
                    MinusDividerWidget(
                        left: SizeConfig.pagePaddingNum,
                        right: SizeConfig.pagePaddingNum),
                    SizedBox(
                      height: SizeConfig.s18,
                    ),
                    Text(
                      "Kumpulan Doa dalam Al Quran",
                      style: TextStyle(fontSize: SizeConfig.s16),
                    ),
                    SizedBox(
                      height: SizeConfig.s18,
                    ),
                    MinusDividerWidget(
                        left: SizeConfig.pagePaddingNum,
                        right: SizeConfig.pagePaddingNum),
                  ],
                ),
              ),
              const SizedBox(
                height: SizeConfig.s28,
              ),
            ],
          ),
        ));
  }

  Column getMenuSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                  text: "Sholat")),
          const SizedBox(
            width: SizeConfig.s4,
          ),
        ]),
      ],
    );
  }

  Column getQuranSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Al Quran",
          style: textTheme(context).headline3,
        ),
        const Text("Sudahkah membaca Quran hari ini"),
        const SizedBox(
          height: SizeConfig.s18,
        ),
        Container(
          padding: SizeConfig.pagePadding,
          decoration: BoxDecoration(
              color: ThemeConfig.sweetGreen, borderRadius: SizeConfig.radius),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Continue last Quran reading',
                  style: textTheme(context)
                      .headline5
                      ?.copyWith(color: Colors.white)),
              Text(
                'Page 213',
                style:
                    textTheme(context).bodyText1?.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: SizeConfig.s12,
              ),
              ButtonWidget(
                text: "continue read",
                onTap: () {},
                isFull: true,
                buttonTextStyle:
                    textTheme(context).bodyText1?.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget getHeadlineIconItem(BuildContext context,
      {required Icon icon, required String text}) {
    return OpacityPressedWidget(
      onPress: () {},
      child: Column(
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
            style: textTheme(context)
                .bodyText1
                ?.copyWith(fontSize: SizeConfig.s12),
          )
        ],
      ),
    );
  }
}

class getPrayerCardSection extends StatelessWidget {
  const getPrayerCardSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeConfig.s20),
      decoration: BoxDecoration(
          color: const Color(0xffC9E8FF), borderRadius: SizeConfig.radius),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Dzhur",
              style:
                  textTheme(context).headline1?.copyWith(color: Colors.black)),
          Text("12:00",
              style: textTheme(context).headline1?.copyWith(
                  fontSize: SizeConfig.s42, height: 1, color: Colors.black)),
          const SizedBox(
            height: SizeConfig.s4,
          ),
          Text(
            '3 Menit menuju Dzhur',
            style: textTheme(context).bodyText1?.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
