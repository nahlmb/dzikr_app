import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_result_model.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_provider/quran_data_provider.dart';

class QuranTools {
  QuranDataProvider quranDataProvider =
      QuranDataProvider(assetPath: 'assets/quran');

  Future<List<QuranPageResultModel>> getQuranPages() async {
    return await quranDataProvider.getCompleteResultQuranData();
  }
}
