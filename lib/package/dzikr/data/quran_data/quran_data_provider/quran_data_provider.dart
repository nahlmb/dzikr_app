import 'dart:convert';

import 'package:dzikr_app/package/dzikr/core/class/dzikr_provider_class.dart';
import 'package:dzikr_app/package/dzikr/core/config/dzikr_network_config.dart';
import 'package:dzikr_app/package/dzikr/core/utils/quran_utils.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_chapter_model.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_model.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_result_model.dart';
import 'package:flutter/services.dart';

class QuranDataProvider extends DzikrProviderClass {
  QuranDataProvider({required this.assetPath})
      : super(networkConfig: DzikrNetworkConfig(baseUrl: ''));

  final String assetPath;

  Future<QuranChapterModel> getSurahList() async {
    return QuranChapterModel.fromJson(await jsonDecode(
        await rootBundle.loadString('$assetPath/chapters.json')));
  }

  Future<List<QuranPageModel>> getCompleteQuranAsset() async {
    return [
      QuranPageModel.fromJson(
          await jsonDecode(await rootBundle.loadString('$assetPath/1.json'))),
      QuranPageModel.fromJson(
          await jsonDecode(await rootBundle.loadString('$assetPath/2.json'))),
      QuranPageModel.fromJson(
          await jsonDecode(await rootBundle.loadString('$assetPath/3.json'))),
      QuranPageModel.fromJson(
          await jsonDecode(await rootBundle.loadString('$assetPath/4.json'))),
      QuranPageModel.fromJson(
          await jsonDecode(await rootBundle.loadString('$assetPath/5.json'))),
      QuranPageModel.fromJson(
          await jsonDecode(await rootBundle.loadString('$assetPath/6.json'))),
      QuranPageModel.fromJson(
          await jsonDecode(await rootBundle.loadString('$assetPath/7.json'))),
      QuranPageModel.fromJson(
          await jsonDecode(await rootBundle.loadString('$assetPath/8.json'))),
      QuranPageModel.fromJson(
          await jsonDecode(await rootBundle.loadString('$assetPath/9.json'))),
      QuranPageModel.fromJson(
          await jsonDecode(await rootBundle.loadString('$assetPath/10.json'))),
    ];
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
        if ((lineIndex != lines.length - 1) && pageNumber == 1) {
          // surah begining
          lines[lineIndex].isSurahBegining = true;
        }
        if (lines[lineIndex].words.isEmpty) {
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
            55) {
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
