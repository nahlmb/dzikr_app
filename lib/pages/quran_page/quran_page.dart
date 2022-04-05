import 'package:dzikr_app/core/config/size_config.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_model.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_result_model.dart';
import 'package:dzikr_app/pages/quran_page/quran_state.dart';
import 'package:dzikr_app/widgets/appbar_widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuranState>(
        create: (context) => QuranState(),
        builder: (context, child) {
          Provider.of<QuranState>(context, listen: false).getQuranPage();

          return Scaffold(
            //appBar: AppBarWidget.getAppbar(context, title: "AlQuran"),
            body: SafeArea(
                child: Consumer<QuranState>(builder: (context, state, child) {
              return Center(
                child: state.pages.isEmpty
                    ? const Text('Loading Quran data ...')
                    : PageView(
                        controller: PageController(),
                        reverse: true,
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
