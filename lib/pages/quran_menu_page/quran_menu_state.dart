import 'package:dzikr/data/quran_data/quran_data_model/quran_chapter_model.dart';
import 'package:dzikr/data/quran_data/quran_data_model/quran_juzs_model.dart';
import 'package:dzikr/tools/quran_tool/quran_tool.dart';
import 'package:dzikr_app/core/class/state_class.dart';

class QuranMenuState extends StateClass {
  QuranTool quranTool = QuranTool.init();
  QuranJuzsModel juzs = QuranJuzsModel(juzs: []);
  QuranChapterModel surah = QuranChapterModel(chapters: []);

  init() {
    getJuzs();
    getSurah();
  }

  getSurah() async {
    surah = await quranTool.getQuranChapter();
    notifyListeners();
  }

  getJuzs() async {
    juzs = await quranTool.getQuranJuzs();
    notifyListeners();
  }
}
