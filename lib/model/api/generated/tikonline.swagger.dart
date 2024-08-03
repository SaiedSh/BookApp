// ignore_for_file: type=lint

import 'dart:async';

import 'package:chopper/chopper.dart' as chopper;
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;

import 'client_mapping.dart';
import 'tikonline.models.swagger.dart';

export 'tikonline.enums.swagger.dart';
export 'tikonline.models.swagger.dart';

part 'tikonline.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Tikonline extends ChopperService {
  static Tikonline create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$Tikonline(client);
    }

    final newClient = ChopperClient(
        services: [_$Tikonline()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Tikonline(newClient);
  }

  ///
  Future<chopper.Response<AccessToken>> apiV1AuthenticationFreeTokenPost({
    String? grantType,
    String? username,
    String? password,
    String? refreshToken,
    String? scope,
    String? clientId,
    String? clientSecret,
  }) {
    generatedMapping.putIfAbsent(
        AccessToken, () => AccessToken.fromJsonFactory);

    return _apiV1AuthenticationFreeTokenPost(
        grantType: grantType,
        username: username,
        password: password,
        refreshToken: refreshToken,
        scope: scope,
        clientId: clientId,
        clientSecret: clientSecret);
  }

  ///
  @Post(
    path: 'http://130.185.75.182:5003/api/v1/Authentication/FreeToken',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response<AccessToken>> _apiV1AuthenticationFreeTokenPost({
    @Part('grant_type') String? grantType,
    @Part('username') String? username,
    @Part('password') String? password,
    @Part('refresh_token') String? refreshToken,
    @Part('scope') String? scope,
    @Part('client_id') String? clientId,
    @Part('client_secret') String? clientSecret,
  });

  ///
  Future<chopper.Response<TempUserDtoApiResult>>
      apiV1AuthenticationLoginSignUpPost({required TempUserDto? body}) {
    generatedMapping.putIfAbsent(
        TempUserDtoApiResult, () => TempUserDtoApiResult.fromJsonFactory);

    return _apiV1AuthenticationLoginSignUpPost(body: body);
  }

  ///
  @Post(
    path: 'http://130.185.75.182:5003/api/v1/Authentication/Login_SignUp',
    optionalBody: true,
  )
  Future<chopper.Response<TempUserDtoApiResult>>
      _apiV1AuthenticationLoginSignUpPost({@Body() required TempUserDto? body});

  ///
  Future<chopper.Response<AccessToken>>
      apiV1AuthenticationLoginSignUpValidationPost(
          {required TempUserDto? body}) {
    generatedMapping.putIfAbsent(
        AccessToken, () => AccessToken.fromJsonFactory);

    return _apiV1AuthenticationLoginSignUpValidationPost(body: body);
  }

  ///
  @Post(
    path:
        'http://130.185.75.182:5003/api/v1/Authentication/Login_SignUpValidation',
    optionalBody: true,
  )
  Future<chopper.Response<AccessToken>>
      _apiV1AuthenticationLoginSignUpValidationPost(
          {@Body() required TempUserDto? body});

  ///
  Future<chopper.Response> apiV1AuthenticationSignOutGet() {
    return _apiV1AuthenticationSignOutGet();
  }

  ///
  @Get(path: 'http://130.185.75.182:5003/api/v1/Authentication/SignOut')
  Future<chopper.Response> _apiV1AuthenticationSignOutGet();

  ///
  Future<chopper.Response<AccessToken>> apiV1AuthenticationStaffAuthPost(
      {required LoginDto? body}) {
    generatedMapping.putIfAbsent(
        AccessToken, () => AccessToken.fromJsonFactory);

    return _apiV1AuthenticationStaffAuthPost(body: body);
  }

  ///
  @Post(
    path: 'http://130.185.75.182:5003/api/v1/Authentication/StaffAuth',
    optionalBody: true,
  )
  Future<chopper.Response<AccessToken>> _apiV1AuthenticationStaffAuthPost(
      {@Body() required LoginDto? body});

  ///
  Future<chopper.Response<DashboardDtoApiResult>>
      apiV1AuthenticationDashboardGet() {
    generatedMapping.putIfAbsent(
        DashboardDtoApiResult, () => DashboardDtoApiResult.fromJsonFactory);

    return _apiV1AuthenticationDashboardGet();
  }

  ///
  @Get(path: 'http://130.185.75.182:5003/api/v1/Authentication/Dashboard')
  Future<chopper.Response<DashboardDtoApiResult>>
      _apiV1AuthenticationDashboardGet();

  ///
  ///@param CategortyId
  Future<chopper.Response<BookDtoListApiResult>> apiV1BookListGet(
      {String? categortyId}) {
    generatedMapping.putIfAbsent(
        BookDtoListApiResult, () => BookDtoListApiResult.fromJsonFactory);

    return _apiV1BookListGet(categortyId: categortyId);
  }

  ///
  ///@param CategortyId
  @Get(path: 'http://130.185.75.182:5003/api/v1/Book/List')
  Future<chopper.Response<BookDtoListApiResult>> _apiV1BookListGet(
      {@Query('CategortyId') String? categortyId});

  ///
  Future<chopper.Response<ApiResult>> apiV1BookAddPost(
      {required BookDto? body}) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1BookAddPost(body: body);
  }

  ///
  @Post(
    path: 'http://130.185.75.182:5003/api/v1/Book/Add',
    optionalBody: true,
  )
  Future<chopper.Response<ApiResult>> _apiV1BookAddPost(
      {@Body() required BookDto? body});

  ///
  ///@param MotherId
  Future<chopper.Response<CategoryDtoListApiResult>> apiV1CategoryListGet(
      {String? motherId}) {
    generatedMapping.putIfAbsent(CategoryDtoListApiResult,
        () => CategoryDtoListApiResult.fromJsonFactory);

    return _apiV1CategoryListGet(motherId: motherId);
  }

  ///
  ///@param MotherId
  @Get(path: 'http://130.185.75.182:5003/api/v1/Category/List')
  Future<chopper.Response<CategoryDtoListApiResult>> _apiV1CategoryListGet(
      {@Query('MotherId') String? motherId});

  ///
  Future<chopper.Response<ApiResult>> apiV1CategoryAddPost(
      {required CategoryDto? body}) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1CategoryAddPost(body: body);
  }

  ///
  @Post(
    path: 'http://130.185.75.182:5003/api/v1/Category/Add',
    optionalBody: true,
  )
  Future<chopper.Response<ApiResult>> _apiV1CategoryAddPost(
      {@Body() required CategoryDto? body});
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
