import 'package:dzikr_app/core/class/state_class.dart';
import 'package:dzikr_app/package/dzikr/data/prayer_time_data/prayer_time_data_model/prayer_daily_model.dart';
import 'package:dzikr_app/package/dzikr/data/prayer_time_data/prayer_time_data_provider/prayer_time_data_provider.dart';
import 'package:flutter/material.dart';

class HomeState extends StateClass {
  // Data
  PrayerDailyModel prayerDailyModel = PrayerDailyModel(
      fajr: '',
      dzhur: '',
      ashar: '',
      maghrib: '',
      isya: '',
      closestPrayer: '',
      closestTime: '');

  // Provider
  PrayerTimeDataProvider prayerTimeDataProvider = PrayerTimeDataProvider();

  getPrayerTime() {}
}
