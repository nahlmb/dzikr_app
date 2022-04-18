import 'package:dzikr/data/book_data/book_data_model/book_data_model.dart';
import 'package:dzikr/data/prayer_time_data/prayer_time_data_model/prayer_response_model.dart';
import 'package:dzikr/tools/book_tool/book_tool.dart';
import 'package:dzikr/tools/prayer_time_tool/prayer_time_tool.dart';
import 'package:dzikr/tools/quran_tool/quran_tool.dart';
import 'package:dzikr_app/core/class/state_class.dart';

class HomeState extends StateClass {
  // Tools
  QuranTool quranTool = QuranTool.init();

  // Data
  PrayerResponseModel? prayer;
  List<Book> books = [];
  int lastPageRead = 0;

  init() {
    getLastPageRead();
    getPrayerTime();
    getBooks();
  }

  getLastPageRead() async {
    lastPageRead = await quranTool.getLastOpenedPageIndex() + 1;
    notifyListeners();
  }

  setLastPageRead(int pageIndex) {
    lastPageRead = pageIndex + 1;
    notifyListeners();
  }

  getPrayerTime() async {
    PrayerTimeTool prayerTimeTool = await PrayerTimeTool.init();
    prayer = prayerTimeTool.prayer;
    notifyListeners();
  }

  getBooks() async {
    BookTool bookTool = await BookTool.init();
    books = bookTool.plainData;
    notifyListeners();
  }
}
