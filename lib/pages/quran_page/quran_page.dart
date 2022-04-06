import 'package:carousel_slider/carousel_slider.dart';
import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/core/utils/theme_utils.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_model.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_result_model.dart';
import 'package:dzikr_app/pages/quran_page/quran_state.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapping_page_scroll/snapping_page_scroll.dart';

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

          return Scaffold(
            appBar: AppBarWidget.getAppbar(context, title: "AlQuran"),
            bottomNavigationBar:
                Consumer<QuranState>(builder: (context, state, child) {
              return Container(
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
                          for (var pageIndex = 0; pageIndex < 10; pageIndex++)
                            getPageMiniIndicatorItem(context,
                                pageNum: pageIndex + 1,
                                isActive:
                                    pageIndex == state.activeQuranPageIndex)
                        ]),
                  )));
            }),
            body: SafeArea(
                child: Consumer<QuranState>(builder: (context, state, child) {
              return Center(
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
                            QuranPageWidget(page: state.pages[pageIndex])
                        ],
                      ),
              );
            })),
          );
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
  const QuranPageWidget({Key? key, required this.page}) : super(key: key);

  final QuranPageResultModel page;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
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
