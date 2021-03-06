import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/config/theme_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/pages/calendar_page/calendar_page.dart';
import 'package:dzikr_app/pages/dzikr_detail_page/dzikr_detail_page.dart';
import 'package:dzikr_app/pages/dzikr_page/dzikr_page.dart';
import 'package:dzikr_app/pages/home_page/home_state.dart';
import 'package:dzikr_app/pages/prayer_page/prayer_page.dart';
import 'package:dzikr_app/pages/quran_menu_page/quran_menu_page.dart';
import 'package:dzikr_app/pages/quran_page/quran_page.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:dzikr_app/widgets/button_widget/button_widget.dart';
import 'package:dzikr_app/widgets/closest_prayer_time_card_widget/closest_prayer_time_card_widget.dart';
import 'package:dzikr_app/widgets/minus_divider_widget/minus_divider_widget.dart';
import 'package:dzikr_app/widgets/next_button_widget/next_button_widget.dart';
import 'package:dzikr_app/widgets/opacity_pressed_widget/opacity_pressed_widget.dart';
import 'package:dzikr_app/widgets/page_standart_divider_widget/page_standart_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeState>(
        create: (context) => HomeState(),
        builder: (context, child) {
          HomeState state = Provider.of<HomeState>(context, listen: false);

          state.init();
          return Scaffold(
              appBar: AppBarWidget.getAppbar(context),
              body: SafeArea(
                bottom: false,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: SizeConfig.pagePaddingDivider,
                    ),
                    Padding(
                      padding: SizeConfig.pageHorizontalPadding,
                      child: getPrayerCardSection(context),
                    ),
                    const PageStandartDividerWidget(),
                    Padding(
                      padding: SizeConfig.pageHorizontalPadding,
                      child: getMenuSection(
                        context,
                      ),
                    ),
                    getQuranSection(context, (page) async {
                      await state.setLastPageRead(page);
                    }),
                    const PageStandartDividerWidget(),
                    getDzikrAndDuaSection(context),
                    const SizedBox(
                      height: SizeConfig.s28,
                    ),
                  ],
                ),
              ));
        });
  }

  Column getDzikrAndDuaSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: SizeConfig.pageHorizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dzikir & Dua",
                    style: textTheme(context).headline3,
                  ),
                  const Text("Dzikir and Dua recomendation"),
                ],
              ),
              NextButtonWidget(
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DzikrPage()));
                },
              )
            ],
          ),
        ),
        const SizedBox(
          height: SizeConfig.s20,
        ),
        Consumer<HomeState>(builder: (context, state, child) {
          return Container(
            decoration: BoxDecoration(color: colorSchame(context).surface),
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              padding: SizeConfig.pageHorizontalPadding,
              shrinkWrap: true,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Column(
                children: [
                  const SizedBox(
                    height: SizeConfig.s18,
                  ),
                  OpacityPressedWidget(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  DzikrDetailPage(book: state.books[index]))));
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Text(
                            state.books[index].title!,
                            style: TextStyle(fontSize: SizeConfig.s16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: SizeConfig.s18,
                  ),
                  const MinusDividerWidget(
                      left: SizeConfig.pagePaddingNum,
                      right: SizeConfig.pagePaddingNum),
                ],
              ),
            ),
          );
        }),
      ],
    );
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
              child: getHeadlineIconItem(context, onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuranMenuPage()));
              },
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
              child: getHeadlineIconItem(context, onPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DzikrPage()));
              },
                  icon: Icon(
                    Icons.auto_awesome_rounded,
                    size: SizeConfig.s32,
                    color: ThemeConfig.sweetOrange,
                  ),
                  text: "Dua-Dzikir")),
          const Flexible(
            flex: 1,
            child: SizedBox(
              width: SizeConfig.s16,
            ),
          ),
          Expanded(
              flex: 2,
              child: getHeadlineIconItem(context, onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalendarPage()));
              },
                  icon: Icon(
                    Icons.calendar_today_rounded,
                    size: SizeConfig.s32,
                    color: ThemeConfig.sweetPurple,
                  ),
                  text: "Calendar")),
          const Flexible(
            flex: 1,
            child: SizedBox(
              width: SizeConfig.s16,
            ),
          ),
          Expanded(
            flex: 2,
            child: Consumer<HomeState>(builder: ((context, state, child) {
              return getHeadlineIconItem(context, onPress: () {
                if (state.prayer != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PrayerPage(
                                data: state.prayer!,
                              )));
                }
              },
                  icon: Icon(
                    Icons.schedule_rounded,
                    size: SizeConfig.s32,
                    color: ThemeConfig.sweetRed,
                  ),
                  text: "Prayer");
            })),
          ),
          const SizedBox(
            width: SizeConfig.s4,
          ),
        ]),
      ],
    );
  }

  Widget getQuranSection(
      BuildContext context, Function(int page) onPageChange) {
    return Consumer<HomeState>(builder: (context, state, child) {
      return state.lastPageRead == 0
          ? const SizedBox()
          : Column(
              children: [
                const PageStandartDividerWidget(),
                Padding(
                  padding: SizeConfig.pageHorizontalPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Al Quran",
                        style: textTheme(context).headline3,
                      ),
                      const Text("Have you read quran today"),
                      const SizedBox(
                        height: SizeConfig.s18,
                      ),
                      Container(
                        padding: SizeConfig.pagePadding,
                        decoration: BoxDecoration(
                            color: ThemeConfig.sweetGreen,
                            borderRadius: SizeConfig.radius),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Continue last Quran reading',
                                style: textTheme(context)
                                    .headline5
                                    ?.copyWith(color: Colors.white)),
                            Text(
                              'Page ${state.lastPageRead}',
                              style: textTheme(context)
                                  .bodyText1
                                  ?.copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              height: SizeConfig.s12,
                            ),
                            ButtonWidget(
                              text: "Continue read",
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QuranPage(
                                              listener: onPageChange,
                                            )));
                              },
                              isFull: true,
                              isSmall: true,
                              buttonTextStyle: textTheme(context)
                                  .bodyText1
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
    });
  }

  Widget getPrayerCardSection(BuildContext context) {
    return Consumer<HomeState>(builder: ((context, state, child) {
      return ClosestPrayerCard(
        pureMode: false,
        prayer: state.prayer,
      );
    }));
  }

  Widget getHeadlineIconItem(BuildContext context,
      {required Icon icon, required String text, required Function() onPress}) {
    return OpacityPressedWidget(
      onPress: onPress,
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
