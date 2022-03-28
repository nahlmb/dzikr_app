import 'package:dzikr_app/package/dzikr/core/class/dzikr_provider_class.dart';
import 'package:dzikr_app/package/dzikr/core/config/dzikr_network_config.dart';

class QuranDataProvider extends DzikrProviderClass {
  QuranDataProvider() : super(networkConfig: DzikrNetworkConfig(baseUrl: ''));
  // whole Quran API here
  //https://api.quran.com/api/v4/verses/by_page/{nomer halaman}?language=id&words=true&translations=134&audio=3&word_fields=qpc_uthmani_hafs&page=1&per_page=50
}
