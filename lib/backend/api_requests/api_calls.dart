import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class AboutPmHotMostPopularCitiesFromTimeanddatecomSlashWeatherCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName:
          'About pm hot most popular cities from timeanddatecom slash weather',
      apiUrl: 'https://neilwarner.npkn.net/hot-pop-cities-24-june-about-1-pm/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}
