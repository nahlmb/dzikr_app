import 'package:dzikr_app/package/dzikr/core/config/dzikr_error_config.dart';
import 'package:dzikr_app/package/dzikr/core/utils/location_utils.dart';
import 'package:dzikr_app/package/dzikr/data/prayer_time_data/prayer_time_data_model/prayer_closest_model.dart';
import 'package:dzikr_app/package/dzikr/data/prayer_time_data/prayer_time_data_model/prayer_daily_model.dart';
import 'package:dzikr_app/package/dzikr/data/prayer_time_data/prayer_time_data_model/prayer_response_model.dart';
import 'package:dzikr_app/package/dzikr/data/prayer_time_data/prayer_time_data_model/prayer_time_data_model.dart';
import 'package:dzikr_app/package/dzikr/data/prayer_time_data/prayer_time_data_provider/prayer_time_data_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

/// Tool for islamic regular 5 time prayer schedule.
/// Prayer time tool will find prayer schedule based on user location
///
/// Require : Device location permission.
///
/// Return : PrayerTime, User's Lat and Long and Place name
///
/// Note : [PrayerTimeTool] may failed to find device location,
/// so [PrayerTimeTool] is set default lat, long and place to **Jakarta, Indonesia**.
/// You can change the default lat, long, place value via [PrayerTimeTool] via init method params.
///
/// Init [PrayerTimeTool], by init method :
///
/// ```dart
/// await PrayerTimeTool.init();
/// ```
///
/// Put your default place data :
///
/// ```dart
/// await PrayerTimeTool.init(defaultLat: '-6.175445728394261', defaultLong: '106.82706696674836', defaultPlaceName: 'Jakarta');
/// ```
///
/// PrayerTimeTool is part of Dzikr Package
class PrayerTimeTool {
  PrayerTimeTool._();

  // Data
  String _lat = "-6.175445728394261";
  String _long = "106.82706696674836";
  String _place = "Jakarta";

  PrayerResponseModel prayer = PrayerResponseModel(
      monthlySchedule: PrayerTimeDataModel(),
      todaySchedule: PrayerDailyModel(
          fajr: '-',
          dzhur: '-',
          ashar: '-',
          maghrib: '-',
          isya: '-',
          closestPrayerTime: PrayerClosestModel(
              closestPrayer: '-',
              closestTime: '-',
              durationToClosestPrayer: const Duration(seconds: 0))),
      placeLat: '-6.175445728394261',
      placeLong: '106.82706696674836',
      placeName: 'Jakarta');

  // Provider
  final PrayerTimeDataProvider _prayerTimeDataProvider =
      PrayerTimeDataProvider();

  /// Initial method of [PrayerTimeTool]
  static Future<PrayerTimeTool> init(
      {String? defaultLat,
      String? defaultLong,
      String? defaultPlaceName}) async {
    var prayerTimeTool = PrayerTimeTool._();
    await DzikrErrorConfig.doTry(() async {
      if (defaultLat != null) prayerTimeTool._lat = defaultLat;
      if (defaultLong != null) prayerTimeTool._long = defaultLong;
      if (defaultPlaceName != null) prayerTimeTool._place = defaultPlaceName;
      await prayerTimeTool._getLocation();
      await prayerTimeTool._getPrayerTime();
    });
    return prayerTimeTool;
  }

  _getLocation() async {
    // Get location
    var isPermissionOk = await LocationUtils.checkLocationPremission();
    if (isPermissionOk == false) {
      // permission not granted
    }

    // Get geocode
    var geo = await Geolocator.getCurrentPosition();
    _lat = geo.latitude.toString();
    _long = geo.longitude.toString();
    List<geocoding.Placemark> placemarks = await geocoding
        .placemarkFromCoordinates(double.parse(_lat), double.parse(_long));
    _place = placemarks[0].locality ??
        placemarks[0].name ??
        placemarks[0].subAdministrativeArea ??
        placemarks[0].country ??
        "-";
  }

  Future<PrayerResponseModel> _getPrayerTime() async {
    var monthlySchedule =
        await _prayerTimeDataProvider.getMonthlyPrayerTime(_lat, _long);

    var todaySchedule = _prayerTimeDataProvider.getTodayPrayerTime(
        monthlySchedule: monthlySchedule);

    var detailedSchedule =
        _prayerTimeDataProvider.findClosestPrayerTime(todaySchedule);

    prayer = PrayerResponseModel(
        monthlySchedule: monthlySchedule,
        todaySchedule: detailedSchedule,
        placeLat: _lat,
        placeLong: _long,
        placeName: _place);

    return prayer;
  }

  static PrayerResponseModel findClosestPrayerTime(PrayerResponseModel prayer) {
    PrayerTimeDataProvider provider = PrayerTimeDataProvider();
    var todaySchedule =
        provider.getTodayPrayerTime(monthlySchedule: prayer.monthlySchedule);

    var detailedSchedule = provider.findClosestPrayerTime(todaySchedule);

    prayer = PrayerResponseModel(
        monthlySchedule: prayer.monthlySchedule,
        todaySchedule: detailedSchedule,
        placeLat: prayer.placeLat,
        placeLong: prayer.placeLong,
        placeName: prayer.placeName);

    return prayer;
  }
}
