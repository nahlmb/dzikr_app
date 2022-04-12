import 'package:dzikr_app/core/class/state_class.dart';
import 'package:dzikr_app/package/dzikr/data/quran_data/quran_data_model/quran_page_result_model.dart';
import 'package:dzikr_app/package/dzikr/tools/quran_tool/quran_tool.dart';
import 'package:flutter/material.dart';

class QuranPageShowerState extends StateClass {
  // Data
  List<QuranPageResultModel> pages = [];
  int activeQuranPageIndex = 0;
  bool isUsingPageMode = true;
  bool isShowToolbar = true;

  // Controller
  late PageController quranPageController;
  late PageController quranIndicatorPageController;

  init(BuildContext context, {int? initialPage}) {
    activeQuranPageIndex = initialPage ?? activeQuranPageIndex;
    quranPageController = PageController(initialPage: activeQuranPageIndex);
    quranIndicatorPageController = PageController(
        viewportFraction: (0.45 / MediaQuery.of(context).size.width) * 100,
        initialPage: activeQuranPageIndex);
  }

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
    var quranTools = QuranTool();
    pages = await quranTools.getQuranPages();
    notifyListeners();
  }
}
