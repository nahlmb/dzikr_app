import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_model.dart';

class QuranPageResultModel {
  QuranPageResultModel({required this.lines, required this.pageNumber});
  List<QuranLineResultModel> lines;
  int pageNumber;
}

class QuranLineResultModel {
  QuranLineResultModel(
      {required this.words,
      this.isUsingLineStretch = true,
      this.isBasmallah = false,
      this.isSurahBegining = false,
      this.surahNum = 0,
      this.fontSize = 0.054});
  List<Words> words;
  bool isUsingLineStretch;
  bool isBasmallah;
  bool isSurahBegining;
  int surahNum;
  double fontSize;
}
