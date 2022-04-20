import 'package:dzikr/dzikr.dart';
import 'package:dzikr_app/core/class/state_class.dart';

class QuranMenuState extends StateClass {
  QuranTool quranTool = QuranTool.init();
  QuranJuzs juzs = QuranJuzs(juzs: []);
  QuranChapters surah = QuranChapters(chapters: []);

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
