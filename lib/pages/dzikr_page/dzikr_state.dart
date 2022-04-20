import 'package:dzikr/data/book_data/book_data_model/book_data_model.dart';
import 'package:dzikr/tools/book_tool/book_tool.dart';
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
