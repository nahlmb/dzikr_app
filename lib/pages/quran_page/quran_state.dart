import 'package:dzikr_app/core/class/state_class.dart';
import 'package:dzikr_app/data/static_data/static_data_other/quran_example_data.dart';

class QuranState extends StateClass {
  getPageData() {
    for (var verseIndex = 0;
        verseIndex < page50Model.verses!.length;
        verseIndex++) {
      for (var wordIndex = 0;
          wordIndex < page50Model.verses![verseIndex].words!.length;
          wordIndex++) {
        var word = page50Model.verses![verseIndex].words![wordIndex];
      }
    }
  }
}
