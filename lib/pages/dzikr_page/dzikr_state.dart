import 'package:dzikr/dzikr.dart';
import 'package:dzikr_app/core/class/state_class.dart';

class DzikrState extends StateClass {
  BookTool bookTool = BookTool.init();

  List<Book> dzikrBook = [];
  List<Book> duaBook = [];

  init() async {
    duaBook = await bookTool.getDuaBook();
    dzikrBook = await bookTool.getDzikrBook();
    notifyListeners();
  }
}
