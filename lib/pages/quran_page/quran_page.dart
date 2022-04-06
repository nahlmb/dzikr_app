import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_model.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_result_model.dart';
import 'package:dzikr_app/pages/quran_page/quran_state.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:dzikr_app/widgets/minus_divider_widget/minus_divider_widget.dart';
import 'package:dzikr_app/widgets/opacity_pressed_widget/opacity_pressed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuranState>(
        create: (context) => QuranState(),
        builder: (context, child) {
          // Start state
          QuranState state = Provider.of<QuranState>(context, listen: false);
          state.getQuranPage();

          return Consumer<QuranState>(builder: (context, state, child) {
            return Scaffold(
              appBar: state.isShowToolbar
                  ? AppBarWidget.getAppbar(context,
                      title: "AlQuran",
                      backgroundColor: colorSchame(context).surface,
                      actions: [
                          OpacityPressedWidget(
                            onPress: () {
                              state.toogleQuranMode();
                            },
                            child: state.isUsingPageMode
                                ? const Icon(
                                    Icons.segment_rounded,
                                    size: SizeConfig.s28,
                                  )
                                : const Icon(
                                    Icons.menu_book_rounded,
                                    size: SizeConfig.s28,
                                  ),
                          )
                        ])
                  : null,
              bottomNavigationBar: state.isShowToolbar
                  ? Container(
                      color: colorSchame(context).surface,
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
                              for (var pageIndex = 0;
                                  pageIndex < 10;
                                  pageIndex++)
                                getPageMiniIndicatorItem(context,
                                    pageNum: pageIndex + 1,
                                    isActive:
                                        pageIndex == state.activeQuranPageIndex)
                            ]),
                      )))
                  : const SizedBox(),
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
                                isPageMode: state.isUsingPageMode,
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
              color: isActive
                  ? colorSchame(context).onPrimary
                  : colorSchame(context).onSurface),
        )),
        decoration: BoxDecoration(
            color: isActive
                ? colorSchame(context).primary
                : colorSchame(context).surface,
            borderRadius: SizeConfig.radius / 4),
      ),
    );
  }
}

class QuranPageWidget extends StatelessWidget {
  const QuranPageWidget({
    Key? key,
    required this.page,
    this.isPageMode = true,
  }) : super(key: key);

  final QuranPageResultModel page;
  final bool isPageMode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Expanded(
            child: isPageMode
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: SizeConfig.pagePadding,
                    itemBuilder: (context, index) => SizedBox(
                      width: double.infinity,
                      child: page.lines[index].words.isEmpty
                          ? const SizedBox()
                          : QuranLineWidget(
                              words: page.lines[index].words.reversed.toList(),
                              fontSize: page.lines[index].fontSize,
                              stretch: page.lines[index].isUsingLineStretch,
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
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontFamily:
                                        'KFGQPCHAFSUthmanicScriptRegular')),
                            const SizedBox(
                              height: SizeConfig.s6,
                            ),
                            Text(
                              page.verses.verses![index].words!
                                  .map((e) =>
                                      "${e.transliteration!.text ?? ''} ")
                                  .toList()
                                  .join(),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: colorSchame(context)
                                      .onBackground
                                      .withOpacity(0.7)),
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
          ),
          SizedBox(
            height: isPageMode ? 5 : 0,
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: SizeConfig.s18, vertical: SizeConfig.s4),
                decoration: BoxDecoration(
                    color: colorSchame(context).surface.withOpacity(0.03),
                    borderRadius: SizeConfig.radius),
                child: Text(
                  '${page.pageNumber}',
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: isPageMode
                ? SizeConfig.pagePaddingNum
                : SizeConfig.pagePaddingNum * 2,
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
      required this.stretch})
      : super(key: key);

  final List<Words> words;
  final double fontSize;
  final bool stretch;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          stretch ? MainAxisAlignment.spaceAround : MainAxisAlignment.center,
      children: [
        for (var wordIndex = 0; wordIndex < words.length; wordIndex++)
          Text(
            "${words[wordIndex].qpcUthmaniHafs}",
            textDirection: TextDirection.rtl,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * fontSize,
                fontFamily: 'KFGQPCHAFSUthmanicScriptRegular'),
          )
      ],
    );
  }
}
