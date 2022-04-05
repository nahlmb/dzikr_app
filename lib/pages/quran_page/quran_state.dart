import 'package:dzikr_app/core/class/state_class.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_result_model.dart';
import 'package:dzikr_app/package/dzikr/tools/quran_tool/quran_tool.dart';

class QuranState extends StateClass {
  List<QuranPageResultModel> pages = [];

  getQuranPage() async {
    print('hei');
    var quranTools = QuranTools();
    pages = await quranTools.getQuranPages();
    notifyListeners();
  }
}
