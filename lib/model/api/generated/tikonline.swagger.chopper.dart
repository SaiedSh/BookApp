// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tikonline.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$Tikonline extends Tikonline {
  _$Tikonline([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = Tikonline;

  @override
  Future<Response<AccessToken>> _apiV1AuthenticationFreeTokenPost({
    String? grantType,
    String? username,
    String? password,
    String? refreshToken,
    String? scope,
    String? clientId,
    String? clientSecret,
  }) {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Authentication/FreeToken');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String?>(
        'grant_type',
        grantType,
      ),
      PartValue<String?>(
        'username',
        username,
      ),
      PartValue<String?>(
        'password',
        password,
      ),
      PartValue<String?>(
        'refresh_token',
        refreshToken,
      ),
      PartValue<String?>(
        'scope',
        scope,
      ),
      PartValue<String?>(
        'client_id',
        clientId,
      ),
      PartValue<String?>(
        'client_secret',
        clientSecret,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<AccessToken, AccessToken>($request);
  }

  @override
  Future<Response<TempUserDtoApiResult>> _apiV1AuthenticationLoginSignUpPost(
      {required TempUserDto? body}) {
    final Uri $url = Uri.parse(
        'http://130.185.75.182:5003/api/v1/Authentication/Login_SignUp');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TempUserDtoApiResult, TempUserDtoApiResult>($request);
  }

  @override
  Future<Response<AccessToken>> _apiV1AuthenticationLoginSignUpValidationPost(
      {required TempUserDto? body}) {
    final Uri $url = Uri.parse(
        'http://130.185.75.182:5003/api/v1/Authentication/Login_SignUpValidation');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AccessToken, AccessToken>($request);
  }

  @override
  Future<Response<dynamic>> _apiV1AuthenticationSignOutGet() {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Authentication/SignOut');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<AccessToken>> _apiV1AuthenticationStaffAuthPost(
      {required LoginDto? body}) {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Authentication/StaffAuth');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AccessToken, AccessToken>($request);
  }

  @override
  Future<Response<DashboardDtoApiResult>> _apiV1AuthenticationDashboardGet() {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Authentication/Dashboard');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<DashboardDtoApiResult, DashboardDtoApiResult>($request);
  }

  @override
  Future<Response<BookDtoListApiResult>> _apiV1BookListGet(
      {String? categortyId}) {
    final Uri $url = Uri.parse('http://130.185.75.182:5003/api/v1/Book/List');
    final Map<String, dynamic> $params = <String, dynamic>{
      'CategortyId': categortyId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<BookDtoListApiResult, BookDtoListApiResult>($request);
  }

  @override
  Future<Response<ApiResult>> _apiV1BookAddPost({required BookDto? body}) {
    final Uri $url = Uri.parse('http://130.185.75.182:5003/api/v1/Book/Add');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResult, ApiResult>($request);
  }

  @override
  Future<Response<CategoryDtoListApiResult>> _apiV1CategoryListGet(
      {String? motherId}) {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Category/List');
    final Map<String, dynamic> $params = <String, dynamic>{
      'MotherId': motherId
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<CategoryDtoListApiResult, CategoryDtoListApiResult>($request);
  }

  @override
  Future<Response<ApiResult>> _apiV1CategoryAddPost(
      {required CategoryDto? body}) {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Category/Add');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ApiResult, ApiResult>($request);
  }
}
