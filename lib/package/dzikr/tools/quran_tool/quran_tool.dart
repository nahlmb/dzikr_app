import 'package:dzikr_app/package/dzikr/core/utils/quran_utils.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_chapter_model.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_result_model.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_provider/quran_data_provider.dart';

class QuranTool {
  QuranDataProvider quranDataProvider =
      QuranDataProvider(assetPath: 'assets/quran');

  QuranTool._();

  static QuranTool init() {
    QuranTool quranTool = QuranTool._();
    return quranTool;
  }

  Future<List<QuranPageResultModel>> getQuranPages() async {
    return await quranDataProvider.getCompleteResultQuranData();
  }

  static Future<Chapters> getQuranChapterByNum(int chapterNum) async {
    return await QuranUtils.getSurahByNumber(chapterNum);
  }

  Future<int> getLastOpenedPageIndex() async {
    return await quranDataProvider.getLastOpenedPageIndex();
  }

  Future setLastOpenedPageIndex(int page) async {
    return await quranDataProvider.setLastOpenedPageIndex(page);
  }
}
