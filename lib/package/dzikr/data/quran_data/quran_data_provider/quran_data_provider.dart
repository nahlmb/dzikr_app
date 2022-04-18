import 'dart:convert';

import 'package:dzikr_app/package/dzikr/core/class/dzikr_provider_class.dart';
import 'package:dzikr_app/package/dzikr/core/config/dzikr_network_config.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_chapter_model.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_model.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_result_model.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranDataProvider extends DzikrProviderClass {
  QuranDataProvider({required this.assetPath})
      : super(networkConfig: DzikrNetworkConfig(baseUrl: '')) {}

  final String assetPath;
  final String _lastOpenedPageIndexKey = "last-opened-quran-page-index";

  Future<int> getLastOpenedPageIndex() async {
    return (await SharedPreferences.getInstance())
            .getInt(_lastOpenedPageIndexKey) ??
        0;
  }

  Future setLastOpenedPageIndex(int page) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(_lastOpenedPageIndexKey, page);
  }

  Future<QuranChapterModel> getSurahList() async {
    return QuranChapterModel.fromJson(await jsonDecode(
        await rootBundle.loadString('$assetPath/chapters.json')));
  }

  Future<List<QuranPageModel>> getCompleteQuranAsset() async {
    List<QuranPageModel> list = [];

    for (var i = 1; i <= 100; i++) {
      list.add(QuranPageModel.fromJson(
          await jsonDecode(await rootBundle.loadString('$assetPath/$i.json'))));
    }
    return list;
  }

  Future<List<QuranPageResultModel>> getCompleteResultQuranData() async {
    var pages = await getCompleteQuranAsset();
    List<QuranPageResultModel> resultedPage = [];

    for (var pageIndex = 0; pageIndex < pages.length; pageIndex++) {
      var page = pages[pageIndex];
      List<QuranLineResultModel> lines = [
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
        QuranLineResultModel(words: []),
      ];
      var pageNumber = 0;

      for (var verseIndex = 0; verseIndex < page.verses!.length; verseIndex++) {
        var verse = page.verses![verseIndex];

        for (var wordIndex = 0; wordIndex < verse.words!.length; wordIndex++) {
          // add line word
          lines[verse.words![wordIndex].lineNumber! - 1]
              .words
              .add(verse.words![wordIndex]);

          //set page number
          if (pageNumber == 0) {
            pageNumber = lines[verse.words![wordIndex].lineNumber! - 1]
                .words[wordIndex]
                .pageNumber!;
          }

          //get surah number
          lines[verse.words![wordIndex].lineNumber! - 1].surahNum = int.parse(
              verse.verseKey!.substring(0, (verse.verseKey!.indexOf(':'))));
        }
      }

      for (var lineIndex = 0; lineIndex < lines.length; lineIndex++) {
        // check if begining of surah or not

        // exception
        // Al Fatihah Exception
        if ((lineIndex != lines.length - 1) && pageNumber == 1) {
          // surah begining
          lines[lineIndex].isSurahBegining = true;
        }

        if (lines[lineIndex].words.isEmpty) {
          // For surah with 14 lines, 1st lines basmalah
          if (lineIndex == 0 &&
              lines[lineIndex + 1].words.isNotEmpty &&
              pageNumber != 1) {
            lines[lineIndex].isBasmallah = true;
            lines[lineIndex].isSurahBegining = false;
            lines.insert(lineIndex,
                QuranLineResultModel(words: [], isSurahBegining: true));
          }

          if ((lineIndex != lines.length - 1) &&
              lines[lineIndex + 1].words.isEmpty) {
            // surah begining
            lines[lineIndex].isSurahBegining = true;

            // Set basmalah
            if (pageNumber != 1 || pageNumber != 187) {
              lines[lineIndex + 1].isBasmallah = true;
            }

            // exception
            if (pageNumber == 2 && lineIndex > 2) {
              lines[lineIndex].isSurahBegining = false;
              lines[lineIndex + 1].isBasmallah = false;
            }
            if (pageNumber == 1 && lineIndex > 2) {
              lines[lineIndex].isSurahBegining = false;
              lines[lineIndex + 1].isBasmallah = false;
            }
          }
        }

        //check stretch
        if (lines[lineIndex].words.map((e) => e.qpcUthmaniHafs).join().length <
                55 &&
            lineIndex == (lines.length - 1)) {
          lines[lineIndex].isUsingLineStretch = false;
        }
        if (pageNumber == 1 || pageNumber == 2) {
          lines[lineIndex].isUsingLineStretch = false;
        }

        // get font size
        lines[lineIndex].fontSize = getLineFontSizes(lines[lineIndex].words);
      }

      resultedPage.add(QuranPageResultModel(
          lines: lines,
          pageNumber: pageNumber,
          verses: QuranVersesResultModel(verses: page.verses!)));
    }
    return resultedPage;
  }

  double getLineFontSizes(List<Words> line) {
    if (line.isEmpty) return 0.055;
    List<String?> temp = line.map((e) => e.qpcUthmaniHafs).toList();
    var join = temp.join();
    if (join.length >= 90) return 0.049;
    if (join.length >= 85) return 0.05;
    if (join.length >= 80) return 0.051;
    if (join.length >= 75) return 0.052;
    if (join.length >= 70) return 0.053;
    return 0.053;
  }
}
