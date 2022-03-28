import 'package:dzikr_app/package/dzikr/core/utils/location_utils.dart';
import 'package:dzikr_app/package/dzikr/data/prayer_time_data/prayer_time_data_model/prayer_daily_model.dart';
import 'package:dzikr_app/package/dzikr/data/prayer_time_data/prayer_time_data_provider/prayer_time_data_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart' as geocoding;

class PrayerTimeTool {
  // Data
  PrayerDailyModel _prayerDailyModel = PrayerDailyModel(
      fajr: '',
      dzhur: '',
      ashar: '',
      maghrib: '',
      isya: '',
      closestPrayer: '',
      closestTime: '');

  // Provider
  PrayerTimeDataProvider prayerTimeDataProvider = PrayerTimeDataProvider();

  getPrayerTime() async {
    // Location location
    prayerTimeDataProvider.getMonthlyPrayerTime('0', '0');

    String lat = "";
    String long = "";
    String place = "";

    await LocationUtils.checkLocationPremission();
    loc.Location location = loc.Location();
    var locationData = await location.getLocation();

    locationData.latitude?.toString() ?? "";
    locationData.longitude?.toString() ?? "";

    // get geocodes
    var geo = await Geolocator.getCurrentPosition();
    lat = geo.latitude.toString();
    long = geo.longitude.toString();

    List<geocoding.Placemark> placemarks = await geocoding
        .placemarkFromCoordinates(double.parse(lat), double.parse(long));

    place = placemarks[0].locality ??
        placemarks[0].name ??
        placemarks[0].subAdministrativeArea ??
        placemarks[0].country ??
        "-";
  }
}
