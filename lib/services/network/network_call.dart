import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'package:chef/constants/constants.dart';
import 'package:chef/helpers/exto_exception.dart';
import 'package:chef/helpers/url_helper.dart';
import 'package:chef/models/models.dart';
import 'package:chef/services/services.dart';

class NetworkCall extends INetworkService {
  NetworkCall({
    required IStorageService storage,
    required ApplicationService appService,
    required Client client,
  })  : _client = client,
        _storage = storage,
        _appService = appService;

  final Client _client;
  final IStorageService _storage;
  final ApplicationService _appService;

  static const _header = {Api.headerContentTypeKey: Api.headerContentTypeValue};
  static const _timeout = Duration(milliseconds: Api.connectionTimeout);

  @override
  Future get({
    required String path,
    Map<String, String>? header,
  }) async {
    dynamic responseJson = {};
    try {
      final uri = Uri.parse(path);
      final _response =
          await _client.get(uri, headers: _header).timeout(_timeout);
      responseJson = _returnResponse(_response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }

  @override
  Future<Response> post({
    required String path,
    data,
    Map<String, String>? header,
  }) async {
    dynamic responseJson = {};
    try {
      final _response = await _client
          .post(
            Uri.parse(path),
            headers: _header,
            body: jsonEncode(data),
          )
          .timeout(_timeout);
      responseJson = _returnResponse(_response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }

  @override
  Future gaurdedGet({
    required String path,
    String? baseURL,
    Map<String, String>? header,
    bool accessToken = true,
  }) async {
    final _baseUrl = baseURL ?? await _loadBaseURL();
    final _headers = await _createHeader(
      header: header,
      accessToken: accessToken,
    );
    dynamic responseJson = {};
    try {
      final uri = Uri.parse(_baseUrl + path);
      final _response =
          await _client.get(uri, headers: _headers).timeout(_timeout);
      responseJson = await _returnResponse(_response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }

  @override
  Future gaurdedPut({
    required String path,
    data,
    String? baseURL,
    Map<String, String>? header,
    bool accessToken = true,
  }) async {
    final _headers = await _createHeader(
      header: header,
      accessToken: accessToken,
    );
    final _baseUrl = baseURL ?? await _loadBaseURL();

    dynamic responseJson = {};
    try {
      final uri = Uri.parse(_baseUrl + path);
      final _response = await _client
          .put(
            uri,
            headers: _headers,
            body: data,
          )
          .timeout(_timeout);
      responseJson = await _returnResponse(_response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }

  @override
  Future<Response> gaurdedPost({
    required String path,
    data,
    String? baseURL,
    Map<String, String>? header,
    bool accessToken = true,
  }) async {
    final _baseUrl = baseURL ?? await _loadBaseURL();

    final _headers = await _createHeader(
      header: header,
      accessToken: accessToken,
    );
    dynamic responseJson = {};
    try {
      final uri = Uri.parse(_baseUrl + path);
      final _response = await _client
          .post(
            uri,
            headers: _headers,
            body: data,
          )
          .timeout(_timeout);
      responseJson = await _returnResponse(_response);
      return responseJson;
    }
    // catch (Exception) {
    //   throw FetchDataException(Api.noConnection);
    // }
    on BadRequestException {
      throw FetchDataException(Api.noConnection);
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }

  Future<LoginResponse> _loadAuthData() async {
    late LoginResponse authData;

    if (_appService.state.userInfo == null ||
        _appService.state.userInfo == LoginResponse.empty()) {
      final userInfo = _storage.readString(key: PreferencesKeys.sLoginData);
      authData = LoginResponse.fromJson(jsonDecode(userInfo));
    } else {
      //authData = _appService.state.userInfo!;
    }

    return authData;
  }

  Future<Map<String, String>> _createHeader({
    Map<String, String>? header,
    accessToken = true,
  }) async {
    var token = '';
    header ??= {};
    if (accessToken) {
      final _accessTokenInfo = await _loadAccessTokenData();
      token = _accessTokenInfo.accessToken;
    } else {
      final _authData = await _loadAuthData();
      token = _authData.idToken;
    }
    final _tenantId = _storage.readString(key: PreferencesKeys.sTenantId);
    header[Api.headerContentTypeKey] = Api.headerContentTypeValue;
    header[Api.headerAuthKey] = Api.authBearer + token;
    header[Api.headerTenantKey] = _tenantId;
    return header;
  }

  Future<AccessTokenData> _loadAccessTokenData() async {
    late AccessTokenData accessData;

    if (_appService.state.accessTokenInfo == null ||
        _appService.state.accessTokenInfo == AccessTokenData.empty()) {
      final _accessToken =
          _storage.readString(key: PreferencesKeys.sAccessTokenData);
      accessData = AccessTokenData.fromJson(jsonDecode(_accessToken));
    } else {
      accessData = _appService.state.accessTokenInfo!;
    }

    return accessData;
  }

  Future<String> _loadBaseURL() async {
    final url = _appService.state.baseUrl ??
        _storage.readString(key: PreferencesKeys.sBaseUrl);
    return InfininURLHelpers.getRestApiURL(url);
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
        final message = _getErrorMessage(response);
        // return response;
        throw BadRequestException(message);
      case 401:
      case 403:
      case 422:
        final message = _getErrorMessage(response);
        throw UnauthorisedException(message);
      case 500:
      case 503:
      case 404:
      default:
        final message = _getErrorMessage(response);
        throw ExtoException(message, '');
    }
  }

  // String _getErrorMessage(Response response) {
  //   var _errorMessage = '';
  //   final _apiFailure = ApiFailure.fromJson(
  //     jsonDecode(response.body.toString()),
  //   );
  //   final _error = _apiFailure.error;
  //   // _errorMessage = _error.detail.isNotEmpty
  //   //     ? _error.detail.join('\n')
  //   //     : '${_error.summary}: ${Strings.unknownError}';
  //
  //   _errorMessage = _error.isNotEmpty ? _error : Strings.unknownError;
  //
  //   return _errorMessage;
  // }

  String _getErrorMessage(Response response) {
    var _errorMessage = '';
    try {
      final _apiFailure = ApiFailure.fromJson(
        jsonDecode(response.body.toString()),
      );
      final _error = _apiFailure.error;
      // _errorMessage = _error.isNotEmpty
      //     ? _error.detail.join('\n')
      //     : '${_error.summary}: ${Strings.unknownError}';
      return _error;
    } catch (e) {
      _errorMessage =
          jsonDecode(response.body)['message'] ?? Strings.unknownError;
    }

    return _errorMessage;
  }

  @override
  Future<Response> upload({
    required String path,
    required Map<String, dynamic> formData,
    String? baseURL,
    Map<String, String>? header,
  }) async {
    final _headers = await _createHeader(header: header);
    final _baseUrl = baseURL ?? await _loadBaseURL();

    dynamic responseJson = {};

    try {
      final url = Uri.parse(_baseUrl + path);
      var request = MultipartRequest(PreferencesKeys.postKeyWord, url);
      request.files.add(
        await MultipartFile.fromPath(
          PreferencesKeys.fileKeyWord,
          formData[Api.uploadFile],
        ),
      );

      request.fields[Api.uploadModule] = formData[Api.uploadModule];

      if (formData[Api.uploadLinkedID] != null) {
        request.fields[Api.uploadLinkedID] = formData[Api.uploadLinkedID];
      }

      if (formData[Api.uploadLinkedRefID] != null) {
        request.fields[Api.uploadLinkedRefID] = formData[Api.uploadLinkedRefID];
      }

      if (formData[Api.uploadParentId] != null) {
        request.fields[Api.uploadParentId] = formData[Api.uploadParentId];
      }

      if (formData[Api.uploadMeta] != null) {
        request.fields[Api.uploadMeta] = formData[Api.uploadMeta];
      }
      request.headers.addAll(_headers);

      final streamedResponse = await request.send();
      var response = await Response.fromStream(streamedResponse);
      responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException(Api.noConnection);
    }
  }
}

class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
