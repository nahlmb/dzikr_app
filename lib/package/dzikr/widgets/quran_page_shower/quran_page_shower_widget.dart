import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/package/dzikr/core/utils/quran_utils.dart';
import 'package:dzikr_app/package/dzikr/core/utils/size_utils.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_model.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_result_model.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_shower_config_model.dart';
import 'package:dzikr_app/package/dzikr/widgets/quran_page_shower/quran_page_shower_state.dart';
import 'package:dzikr_app/widgets/minus_divider_widget/minus_divider_widget.dart';
import 'package:dzikr_app/widgets/opacity_pressed_widget/opacity_longpress_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuranPageShower extends StatelessWidget {
  const QuranPageShower({Key? key, required this.config, this.appBar})
      : super(key: key);
  final QuranPageShowerConfig config;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuranPageShowerState>(
        create: (context) => QuranPageShowerState(),
        builder: (context, child) {
          // Start state
          QuranPageShowerState state =
              Provider.of<QuranPageShowerState>(context, listen: false);
          state.init(context);
          state.getQuranPage();

          return Consumer<QuranPageShowerState>(
              builder: (context, state, child) {
            return Scaffold(
              backgroundColor: config.backgroundColor,
              appBar: state.isShowToolbar ? appBar : null,
              bottomNavigationBar: Visibility(
                maintainState: true,
                maintainAnimation: true,
                maintainSize: false,
                visible: state.isShowToolbar && config.isUsingBottomIndicator,
                child: Container(
                    color: config.primaryColor,
                    child: SafeArea(
                        child: SizedBox(
                      height: 64,
                      child: PageView(
                          pageSnapping: true,
                          reverse: true,
                          onPageChanged: (page) {
                            state.setActiveQuranPageViaIndicator(page);
                          },
                          controller: state.quranIndicatorPageController,
                          children: [
                            for (var pageIndex = 0; pageIndex < 10; pageIndex++)
                              getPageMiniIndicatorItem(context,
                                  pageNum: pageIndex + 1,
                                  isActive:
                                      pageIndex == state.activeQuranPageIndex)
                          ]),
                    ))),
              ),
              body: SafeArea(
                  child: GestureDetector(
                onTap: () {
                  state.toogleIsShowToolbar();
                },
                child: Center(
                  child: state.pages.isEmpty
                      ? const Text('Loading Quran data ...')
                      : PageView(
                          controller: state.quranPageController,
                          reverse: true,
                          onPageChanged: (page) {
                            state.setActiveQuranPageViaQuranPage(page);
                          },
                          children: [
                            for (var pageIndex = 0;
                                pageIndex < state.pages.length;
                                pageIndex++)
                              QuranPageWidget(
                                page: state.pages[pageIndex],
                                config: config,
                              )
                          ],
                        ),
                ),
              )),
            );
          });
        });
  }

  Widget getPageMiniIndicatorItem(BuildContext context,
      {required int pageNum, bool isActive = false}) {
    return Center(
      child: Container(
        width: 32,
        height: 42,
        child: Center(
            child: Text(
          '$pageNum',
          style: TextStyle(
              color: isActive ? config.onAccentColor : config.onSurfaceColor),
        )),
        decoration: BoxDecoration(
            color: isActive ? config.accentColor : config.surfaceColor,
            borderRadius: SizeConfig.radius / 4),
      ),
    );
  }
}

class QuranPageWidget extends StatelessWidget {
  const QuranPageWidget({
    Key? key,
    required this.page,
    required this.config,
  }) : super(key: key);

  final QuranPageResultModel page;
  final QuranPageShowerConfig config;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          config.pageMode == QuranPageMode.page
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.all(MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 12
                      : 10),
                  itemBuilder: (context, index) => SizedBox(
                    width: double.infinity,
                    child: page.lines[index].words.isEmpty
                        ? page.lines[index].isSurahBegining
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: SizeConfig.s12),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: SizeConfig.s4),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(SizeConfig.s6),
                                      color: config.surfaceColor),
                                  child: Center(
                                    child: Text(
                                      'aa',
                                      style: TextStyle(
                                          color: config.onSurfaceColor,
                                          fontSize: DzikrSizeUtils
                                              .adjustQuranTextSizeWithMediaQuery(
                                                  page.lines[index].fontSize,
                                                  context),
                                          fontFamily:
                                              'KFGQPCHAFSUthmanicScriptRegular'),
                                    ),
                                  ),
                                ),
                              )
                            : page.lines[index].isBasmallah
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: SizeConfig.s2),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0),
                                      child: Center(
                                        child: Text(
                                          'بِسْمِ اللّهِ الرَّحْمَنِ الرَّحِيْمِ',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              color: config.onBackgroundColor,
                                              fontSize: DzikrSizeUtils
                                                  .adjustQuranTextSizeWithMediaQuery(
                                                      page.lines[index]
                                                          .fontSize,
                                                      context),
                                              fontFamily:
                                                  'KFGQPCHAFSUthmanicScriptRegular'),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox()
                        : QuranLineWidget(
                            words: page.lines[index].words.reversed.toList(),
                            fontSize: page.lines[index].fontSize,
                            stretch: page.lines[index].isUsingLineStretch,
                            color: config.onBackgroundColor,
                          ),
                  ),
                  itemCount: page.lines.length,
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: SizeConfig.pagePadding,
                  itemCount: page.verses.verses!.length,
                  itemBuilder: ((context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              page.verses.verses![index].words!
                                  .map((e) => "${e.qpcUthmaniHafs} ")
                                  .toList()
                                  .join(),
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: config.onBackgroundColor,
                                  fontSize: 24,
                                  fontFamily:
                                      'KFGQPCHAFSUthmanicScriptRegular')),
                          const SizedBox(
                            height: SizeConfig.s6,
                          ),
                          Text(
                            page.verses.verses![index].words!
                                .map((e) => "${e.transliteration!.text ?? ''} ")
                                .toList()
                                .join(),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color:
                                    config.onBackgroundColor.withOpacity(0.7)),
                          ),
                          const SizedBox(
                            height: SizeConfig.pagePaddingNum,
                          ),
                          const MinusDividerWidget(
                              left: SizeConfig.pagePaddingNum,
                              right: SizeConfig.pagePaddingNum),
                          const SizedBox(
                            height: SizeConfig.pagePaddingNum,
                          ),
                        ],
                      ))),
          SizedBox(
            height: config.pageMode == QuranPageMode.page ? 5 : 0,
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizeConfig.s18, vertical: SizeConfig.s4),
                decoration: BoxDecoration(
                    color: config.onBackgroundColor.withOpacity(0.03),
                    borderRadius: SizeConfig.radius),
                child: Text(
                  '${page.pageNumber}',
                  style: TextStyle(
                    fontSize: 12,
                    color: config.onBackgroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: config.pageMode == QuranPageMode.page
                ? SizeConfig.pagePaddingNum
                : SizeConfig.pagePaddingNum * 3,
          ),
        ],
      ),
    );
  }
}

class QuranLineWidget extends StatelessWidget {
  const QuranLineWidget(
      {Key? key,
      required this.words,
      required this.fontSize,
      required this.stretch,
      this.color})
      : super(key: key);

  final List<Words> words;
  final double fontSize;
  final bool stretch;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          stretch ? MainAxisAlignment.spaceAround : MainAxisAlignment.center,
      children: [
        for (var wordIndex = 0; wordIndex < words.length; wordIndex++)
          OpacityLongpressWidget(
            onPress: () {},
            child: Text(
              "${words[wordIndex].qpcUthmaniHafs}",
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  color: color,
                  fontSize: DzikrSizeUtils.adjustQuranTextSizeWithMediaQuery(
                      fontSize, context),
                  fontFamily: 'KFGQPCHAFSUthmanicScriptRegular'),
            ),
          )
      ],
    );
  }
}
