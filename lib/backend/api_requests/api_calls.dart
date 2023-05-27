import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BalanceCall {
  static Future<ApiCallResponse> call({
    String? address1 = '0x0Fa2f9a9129DD386d01124a4DE31A388d2785c01',
    String? tag = 'latest',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'balance',
      apiUrl:
          'https://api.etherscan.io/api?module=account&action=balance &address=${address1}   &tag=latest    &apikey=63JAEXEDGUEMR71G1SMYMIA6HDMSJ6HNKQ',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'address': address1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NewsauthCall {
  static Future<ApiCallResponse> call({
    String? date = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'newsauth',
      apiUrl:
          'http://api.mediastack.com/v1/news?access_key=626aec7a181b4a580b48e0dc2819dea4&countries=in&category=business',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'date': date,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic title(dynamic response) => getJsonField(
        response,
        r'''$.data[:].title''',
        true,
      );
  static dynamic description(dynamic response) => getJsonField(
        response,
        r'''$.data[:].description''',
        true,
      );
  static dynamic source(dynamic response) => getJsonField(
        response,
        r'''$.data[:].source''',
        true,
      );
  static dynamic datetime(dynamic response) => getJsonField(
        response,
        r'''$.data[:].published_at''',
        true,
      );
  static dynamic limit(dynamic response) => getJsonField(
        response,
        r'''$.pagination''',
      );
  static dynamic datalist(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.data[:].url''',
        true,
      );
  static dynamic image(dynamic response) => getJsonField(
        response,
        r'''$.data[:].image''',
        true,
      );
}

class MaticBalanceCall {
  static Future<ApiCallResponse> call({
    String? address1 = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'MaticBalance',
      apiUrl:
          'https://api.polygonscan.com/api?module=account&action=balance&address=${address1}&apikey=6NAU8XT51CYE3XM7PJ91Z3JIEHT1Q9PVMS',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'address': address1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ERCTransactionsCall {
  static Future<ApiCallResponse> call({
    String? address1 = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ERCTransactions',
      apiUrl:
          'https://api.polygonscan.com/api?module=account&action=tokentx&contractaddress=0x0d500b1d8e8ef31e21c99d1db9a6444d3adf1270&address=${address1}&startblock=0&endblock=99999999&page=1&offset=10&sort=asc&apikey=6NAU8XT51CYE3XM7PJ91Z3JIEHT1Q9PVMS',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'address1': address1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
