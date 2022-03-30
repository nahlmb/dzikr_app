import 'package:dzikr_app/core/class/state_class.dart';
import 'package:dzikr_app/package/dzikr/data/prayer_time_data/prayer_time_data_model/prayer_response_model.dart';
import 'package:dzikr_app/package/dzikr/tools/prayer_time_tool/prayer_time_tool.dart';

class HomeState extends StateClass {
  PrayerResponseModel? prayer;

  getPrayerTime() async {
    PrayerTimeTool prayerTimeTool = await PrayerTimeTool.init();
    prayer = prayerTimeTool.prayer;
    notifyListeners();
  }
}
