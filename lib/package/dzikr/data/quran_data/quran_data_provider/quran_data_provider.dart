import 'package:dzikr_app/package/dzikr/core/class/provider_class.dart';
import 'package:dzikr_app/package/dzikr/core/config/network_config.dart';

class QuranDataProvider extends ProviderClass {
  QuranDataProvider() : super(networkConfig: NetworkConfig(baseUrl: ''));
  // whole Quran API here
  //https://api.quran.com/api/v4/verses/by_page/{nomer halaman}?language=id&words=true&translations=134&audio=3&word_fields=qpc_uthmani_hafs&page=1&per_page=50
}
