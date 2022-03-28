import 'package:dzikr_app/package/dzikr/core/class/dzikr_provider_class.dart';
import 'package:dzikr_app/package/dzikr/core/config/dzikr_network_config.dart';
import 'package:dzikr_app/package/dzikr/data/prayer_time_data/prayer_time_data_model/prayer_daily_model.dart';
import 'package:dzikr_app/package/dzikr/data/prayer_time_data/prayer_time_data_model/prayer_time_data_model.dart';
import 'package:intl/intl.dart';

class PrayerTimeDataProvider extends DzikrProviderClass {
  PrayerTimeDataProvider()
      : super(
            networkConfig:
                DzikrNetworkConfig(baseUrl: "http://api.aladhan.com/v1"));

  Future<PrayerTimeDataModel> getMonthlyPrayerTime(
      String lat, String long) async {
    var date = DateTime.now();
    var month = DateFormat('M').format(date);
    var year = DateFormat('yyyy').format(date);
    var response = await networkConfig.doGet(
        '/calendar?latitude=$lat&longitude=$long&method=4&month=$month&year=$year');
    return PrayerTimeDataModel.fromJson(response);
  }

  Future<Data> getTodayPrayerTime(String lat, String long) async {
    PrayerTimeDataModel response = await getMonthlyPrayerTime(lat, long);
    var date = DateTime.now();
    String nowDate = DateFormat('dd-MM-yyyy').format(date);
    var todayData = response.data!
        .firstWhere((element) => element.date!.gregorian!.date == nowDate);

    return todayData;
  }

  PrayerDailyModel findClosestPrayerTime(Data todayData) {
    // Find closest prayer time
    var date = DateTime.now();
    var format = DateFormat("HH:mm");
    var currentTime =
        format.parse(format.format(date)).millisecondsSinceEpoch.abs();
    var todayTimings = todayData.timings!;

    //change all prayer time to milliseconds
    var fajr = format
        .parse(todayTimings.fajr!.substring(0, 5))
        .millisecondsSinceEpoch
        .abs();
    var dhuhr = format
        .parse(todayTimings.dhuhr!.substring(0, 5))
        .millisecondsSinceEpoch
        .abs();
    var asr = format
        .parse(todayTimings.asr!.substring(0, 5))
        .millisecondsSinceEpoch
        .abs();
    var maghrib = format
        .parse(todayTimings.maghrib!.substring(0, 5))
        .millisecondsSinceEpoch
        .abs();
    var isya = format
        .parse(todayTimings.isha!.substring(0, 5))
        .millisecondsSinceEpoch
        .abs();

    String closestPrayer = "";
    String closestPrayerTime = "";
    if (fajr < currentTime && dhuhr > currentTime) {
      closestPrayer = "Dzuhur";
      closestPrayerTime = todayTimings.dhuhr!;
    } else if (dhuhr < currentTime && asr > currentTime) {
      closestPrayer = "Ashar";
      closestPrayerTime = todayTimings.asr!;
    } else if (asr < currentTime && maghrib > currentTime) {
      closestPrayer = "Maghrib";
      closestPrayerTime = todayTimings.maghrib!;
    } else if (maghrib < currentTime && isya > currentTime) {
      closestPrayer = "Isya";
      closestPrayerTime = todayTimings.isha!;
    } else if (isya < currentTime) {
      closestPrayer = "Subuh";
      closestPrayerTime = todayTimings.fajr!;
    }

    return PrayerDailyModel(
        fajr: todayTimings.fajr!,
        dzhur: todayTimings.dhuhr!,
        ashar: todayTimings.asr!,
        maghrib: todayTimings.maghrib!,
        isya: todayTimings.isha!,
        closestPrayer: closestPrayer,
        closestTime: closestPrayerTime);
  }
}
