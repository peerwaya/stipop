import 'dart:async';
import 'dart:convert';

import 'package:flutter_stipop/src/client/models/languages.dart';
import 'package:flutter_stipop/src/client/models/sp_response.dart';
import 'package:http/http.dart';
import 'package:flutter_stipop/src/client/models/sp_sticker.dart';

const kSpCountry = 'US';

class SPClient {
  static final baseUri = Uri(scheme: 'https', host: 'messenger.stipop.io');

  final String _apiKey;
  final Client _client = Client();
  final String _apiVersion = 'v1';
  final String _userId;

  SPClient({required String apiKey, required String userId})
      : _apiKey = apiKey,
        _userId = userId;

  Future<SPResponse> trending(
      {int limit = 30,
      String lang = SPLanguage.english,
      String countryCode = kSpCountry}) async {
    return _fetchCollection(
        baseUri.replace(
          path: '$_apiVersion/search/keyword',
          queryParameters: <String, String>{
            'limit': '$limit',
            'countryCode': countryCode,
            'lang': lang,
            'userId': _userId
          },
        ),
        SpCollectionType.trending);
  }

  Future<SPResponse> search(
      {String query = "",
      int pageNumber = 1,
      int limit = 30,
      String lang = SPLanguage.english,
      String countryCode = kSpCountry}) async {
    return _fetchCollection(
        baseUri.replace(
          path: '$_apiVersion/search',
          queryParameters: <String, String>{
            'q': query,
            'pageNumber': '$pageNumber',
            'limit': '$limit',
            'lang': lang,
            'countryCode': countryCode,
            'userId': _userId
          },
        ),
        SpCollectionType.search);
  }

  Future<void> send(SPSticker sticker,
      {String query = "",
      String lang = SPLanguage.english,
      String countryCode = kSpCountry}) async {
    await _postWithAuthorization(
      baseUri.replace(
        path: '$_apiVersion/analytics/send/${sticker.stickerId}',
        queryParameters: <String, String>{
          'q': query,
          'lang': lang,
          'countryCode': countryCode,
          'userId': _userId
        },
      ),
    );
  }

  Future<SPResponse> _fetchCollection(Uri uri, SpCollectionType type) async {
    final response = await _getWithAuthorization(uri);
    final data = json.decode(response.body) as Map<String, dynamic>;
    data['sp_collection_type'] = type.name;
    return SPResponse.fromJson(data);
  }

  Future<Response> _getWithAuthorization(Uri uri) async {
    Map<String, String> queryParams = Map.from(uri.queryParameters);
    final response = await _client.get(
        uri.replace(queryParameters: queryParams),
        headers: {'apikey': _apiKey});

    if (response.statusCode == 200) {
      return response;
    } else {
      throw SPClientError(response.statusCode, response.body);
    }
  }

  Future<Response> _postWithAuthorization(Uri uri, {String? body}) async {
    Map<String, String> queryParams = Map.from(uri.queryParameters);
    final response = await _client.post(
        uri.replace(queryParameters: queryParams),
        headers: {'apikey': _apiKey},
        body: body);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw SPClientError(response.statusCode, response.body);
    }
  }
}

class SPClientError {
  final int statusCode;
  final String exception;

  SPClientError(this.statusCode, this.exception);

  @override
  String toString() {
    return 'SPClientError{statusCode: $statusCode, exception: $exception}';
  }
}
