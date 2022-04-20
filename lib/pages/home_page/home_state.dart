import 'package:dzikr/dzikr.dart';
import 'package:dzikr_app/core/class/state_class.dart';

class HomeState extends StateClass {
  // Tools
  QuranTool quranTool = QuranTool.init();

  // Data
  PrayerTime? prayer;
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
    BookTool bookTool = BookTool.init();
    books = await bookTool.getAllBook();
    notifyListeners();
  }
}
