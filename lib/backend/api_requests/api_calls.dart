import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start weather Group Code

class WeatherGroup {
  static String getBaseUrl() => 'https://weatherapi-com.p.rapidapi.com/';
  static Map<String, String> headers = {
    'X-RapidAPI-Key': '6b5f9b32ebmsh393025115ae92c0p18a667jsn2bd35f3a82d8',
    'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com',
  };
  static RealtimeWeatherCall realtimeWeatherCall = RealtimeWeatherCall();
}

class RealtimeWeatherCall {
  Future<ApiCallResponse> call({
    String? place = '',
  }) async {
    final baseUrl = WeatherGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'realtime weather',
      apiUrl: '${baseUrl}current.json?q=${place}',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': '6b5f9b32ebmsh393025115ae92c0p18a667jsn2bd35f3a82d8',
        'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? locationname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.location.name''',
      ));
  String? locationregion(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.location.region''',
      ));
  String? locationcountry(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.location.country''',
      ));
  double? currenttempc(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.current.temp_c''',
      ));
  String? currentconditiontext(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.current.condition.text''',
      ));
  double? currentwindkph(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.current.wind_kph''',
      ));
  int? currenthumidity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.current.humidity''',
      ));
  int? currentcloud(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.current.cloud''',
      ));
}

/// End weather Group Code

class NewsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'News',
      apiUrl:
          'https://newsapi.org/v2/everything?q=tesla&from=2024-03-23&sortBy=publishedAt&apiKey=afaab110e83149d48c4706c8e0ca8562',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
