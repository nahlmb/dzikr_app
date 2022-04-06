import 'package:dzikr_app/core/class/state_class.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_result_model.dart';
import 'package:dzikr_app/package/dzikr/tools/quran_tool/quran_tool.dart';
import 'package:flutter/material.dart';

class QuranState extends StateClass {
  // Data
  List<QuranPageResultModel> pages = [];
  int activeQuranPageIndex = 0;
  bool isUsingPageMode = true;
  bool isShowToolbar = true;

  // Controller
  PageController quranPageController = PageController();
  PageController quranIndicatorPageController =
      PageController(viewportFraction: 0.1, initialPage: 0);

  setActiveQuranPageViaIndicator(int page) {
    quranPageController.jumpToPage(page);
    activeQuranPageIndex = page;
    notifyListeners();
  }

  setActiveQuranPageViaQuranPage(int page) {
    quranIndicatorPageController.animateToPage(page,
        duration: const Duration(milliseconds: 250), curve: Curves.linear);
    activeQuranPageIndex = page;
    notifyListeners();
  }

  toogleQuranMode() {
    isUsingPageMode = !isUsingPageMode;
    notifyListeners();
  }

  toogleIsShowToolbar() {
    isShowToolbar = !isShowToolbar;
    notifyListeners();
  }

  getQuranPage() async {
    var quranTools = QuranTools();
    pages = await quranTools.getQuranPages();
    notifyListeners();
  }
}
