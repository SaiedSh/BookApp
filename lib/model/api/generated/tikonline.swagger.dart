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
  ///@param Banner1ImageUrl
  ///@param Banner1Title
  ///@param Banner1SubTitle
  ///@param Banner1Description
  ///@param Banner1ButtonText
  ///@param Banner1ButtonLink
  ///@param Banner2ImageUrl
  ///@param Banner2Title
  ///@param Banner2SubTitle
  ///@param Banner2Description
  ///@param Banner2ButtonText
  ///@param Banner2ButtonLink
  ///@param Banner3ImageUrl
  ///@param Banner3Title
  ///@param Banner3SubTitle
  ///@param Banner3Description
  ///@param Banner3ButtonText
  ///@param Banner3ButtonLink
  ///@param Id
  Future<chopper.Response> apiV1AdminIndexPost({
    String? banner1ImageUrl,
    String? banner1Title,
    String? banner1SubTitle,
    String? banner1Description,
    String? banner1ButtonText,
    String? banner1ButtonLink,
    String? banner2ImageUrl,
    String? banner2Title,
    String? banner2SubTitle,
    String? banner2Description,
    String? banner2ButtonText,
    String? banner2ButtonLink,
    String? banner3ImageUrl,
    String? banner3Title,
    String? banner3SubTitle,
    String? banner3Description,
    String? banner3ButtonText,
    String? banner3ButtonLink,
    String? id,
    List<int>? Banner1ImageFile,
    List<int>? Banner2ImageFile,
    List<int>? Banner3ImageFile,
  }) {
    return _apiV1AdminIndexPost(
        banner1ImageUrl: banner1ImageUrl,
        banner1Title: banner1Title,
        banner1SubTitle: banner1SubTitle,
        banner1Description: banner1Description,
        banner1ButtonText: banner1ButtonText,
        banner1ButtonLink: banner1ButtonLink,
        banner2ImageUrl: banner2ImageUrl,
        banner2Title: banner2Title,
        banner2SubTitle: banner2SubTitle,
        banner2Description: banner2Description,
        banner2ButtonText: banner2ButtonText,
        banner2ButtonLink: banner2ButtonLink,
        banner3ImageUrl: banner3ImageUrl,
        banner3Title: banner3Title,
        banner3SubTitle: banner3SubTitle,
        banner3Description: banner3Description,
        banner3ButtonText: banner3ButtonText,
        banner3ButtonLink: banner3ButtonLink,
        id: id,
        Banner1ImageFile: Banner1ImageFile,
        Banner2ImageFile: Banner2ImageFile,
        Banner3ImageFile: Banner3ImageFile);
  }

  ///
  ///@param Banner1ImageUrl
  ///@param Banner1Title
  ///@param Banner1SubTitle
  ///@param Banner1Description
  ///@param Banner1ButtonText
  ///@param Banner1ButtonLink
  ///@param Banner2ImageUrl
  ///@param Banner2Title
  ///@param Banner2SubTitle
  ///@param Banner2Description
  ///@param Banner2ButtonText
  ///@param Banner2ButtonLink
  ///@param Banner3ImageUrl
  ///@param Banner3Title
  ///@param Banner3SubTitle
  ///@param Banner3Description
  ///@param Banner3ButtonText
  ///@param Banner3ButtonLink
  ///@param Id
  @Post(
    path: 'http://130.185.75.182:5003/api/v1/Admin/Index',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response> _apiV1AdminIndexPost({
    @Query('Banner1ImageUrl') String? banner1ImageUrl,
    @Query('Banner1Title') String? banner1Title,
    @Query('Banner1SubTitle') String? banner1SubTitle,
    @Query('Banner1Description') String? banner1Description,
    @Query('Banner1ButtonText') String? banner1ButtonText,
    @Query('Banner1ButtonLink') String? banner1ButtonLink,
    @Query('Banner2ImageUrl') String? banner2ImageUrl,
    @Query('Banner2Title') String? banner2Title,
    @Query('Banner2SubTitle') String? banner2SubTitle,
    @Query('Banner2Description') String? banner2Description,
    @Query('Banner2ButtonText') String? banner2ButtonText,
    @Query('Banner2ButtonLink') String? banner2ButtonLink,
    @Query('Banner3ImageUrl') String? banner3ImageUrl,
    @Query('Banner3Title') String? banner3Title,
    @Query('Banner3SubTitle') String? banner3SubTitle,
    @Query('Banner3Description') String? banner3Description,
    @Query('Banner3ButtonText') String? banner3ButtonText,
    @Query('Banner3ButtonLink') String? banner3ButtonLink,
    @Query('Id') String? id,
    @PartFile() List<int>? Banner1ImageFile,
    @PartFile() List<int>? Banner2ImageFile,
    @PartFile() List<int>? Banner3ImageFile,
  });

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
  Future<chopper.Response<IndexDtoApiResult>> apiV1BookIndexGet() {
    generatedMapping.putIfAbsent(
        IndexDtoApiResult, () => IndexDtoApiResult.fromJsonFactory);

    return _apiV1BookIndexGet();
  }

  ///
  @Get(path: 'http://130.185.75.182:5003/api/v1/Book/Index')
  Future<chopper.Response<IndexDtoApiResult>> _apiV1BookIndexGet();

  ///
  ///@param BookId
  Future<chopper.Response<BookDtoApiResult>> apiV1BookDetailGet(
      {String? bookId}) {
    generatedMapping.putIfAbsent(
        BookDtoApiResult, () => BookDtoApiResult.fromJsonFactory);

    return _apiV1BookDetailGet(bookId: bookId);
  }

  ///
  ///@param BookId
  @Get(path: 'http://130.185.75.182:5003/api/v1/Book/Detail')
  Future<chopper.Response<BookDtoApiResult>> _apiV1BookDetailGet(
      {@Query('BookId') String? bookId});

  ///
  ///@param Title
  ///@param Description
  ///@param ImageUrl
  ///@param PdfLink
  ///@param Nevisande
  ///@param Entesharat
  ///@param Motarjem
  ///@param SalEnteshar
  ///@param Pages
  ///@param Rating
  ///@param Price
  ///@param DiscountPrice
  ///@param ViewCount
  ///@param CategoryId
  ///@param CategoryName
  ///@param Id
  Future<chopper.Response<ApiResult>> apiV1BookAddPost({
    String? title,
    String? description,
    String? imageUrl,
    String? pdfLink,
    String? nevisande,
    String? entesharat,
    String? motarjem,
    String? salEnteshar,
    int? pages,
    int? rating,
    int? price,
    int? discountPrice,
    int? viewCount,
    String? categoryId,
    String? categoryName,
    String? id,
    List<int>? ImageFile,
    List<int>? PdfFile,
  }) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1BookAddPost(
        title: title,
        description: description,
        imageUrl: imageUrl,
        pdfLink: pdfLink,
        nevisande: nevisande,
        entesharat: entesharat,
        motarjem: motarjem,
        salEnteshar: salEnteshar,
        pages: pages,
        rating: rating,
        price: price,
        discountPrice: discountPrice,
        viewCount: viewCount,
        categoryId: categoryId,
        categoryName: categoryName,
        id: id,
        ImageFile: ImageFile,
        PdfFile: PdfFile);
  }

  ///
  ///@param Title
  ///@param Description
  ///@param ImageUrl
  ///@param PdfLink
  ///@param Nevisande
  ///@param Entesharat
  ///@param Motarjem
  ///@param SalEnteshar
  ///@param Pages
  ///@param Rating
  ///@param Price
  ///@param DiscountPrice
  ///@param ViewCount
  ///@param CategoryId
  ///@param CategoryName
  ///@param Id
  @Post(
    path: 'http://130.185.75.182:5003/api/v1/Book/Add',
    optionalBody: true,
  )
  @Multipart()
  Future<chopper.Response<ApiResult>> _apiV1BookAddPost({
    @Query('Title') String? title,
    @Query('Description') String? description,
    @Query('ImageUrl') String? imageUrl,
    @Query('PdfLink') String? pdfLink,
    @Query('Nevisande') String? nevisande,
    @Query('Entesharat') String? entesharat,
    @Query('Motarjem') String? motarjem,
    @Query('SalEnteshar') String? salEnteshar,
    @Query('Pages') int? pages,
    @Query('Rating') int? rating,
    @Query('Price') int? price,
    @Query('DiscountPrice') int? discountPrice,
    @Query('ViewCount') int? viewCount,
    @Query('CategoryId') String? categoryId,
    @Query('CategoryName') String? categoryName,
    @Query('Id') String? id,
    @PartFile() List<int>? ImageFile,
    @PartFile() List<int>? PdfFile,
  });

  ///Returns all Categories
  Future<chopper.Response<CategoryDtoListApiResult>> apiV1CategoryGet() {
    generatedMapping.putIfAbsent(CategoryDtoListApiResult,
        () => CategoryDtoListApiResult.fromJsonFactory);

    return _apiV1CategoryGet();
  }

  ///Returns all Categories
  @Get(path: 'http://130.185.75.182:5003/api/v1/Category')
  Future<chopper.Response<CategoryDtoListApiResult>> _apiV1CategoryGet();

  ///Creates a Category
  Future<chopper.Response<ApiResult>> apiV1CategoryPost(
      {required CategoryDto? body}) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1CategoryPost(body: body);
  }

  ///Creates a Category
  @Post(
    path: 'http://130.185.75.182:5003/api/v1/Category',
    optionalBody: true,
  )
  Future<chopper.Response<ApiResult>> _apiV1CategoryPost(
      {@Body() required CategoryDto? body});

  ///Retrieves a Category by unique id
  ///@param id a unique id for the Category
  Future<chopper.Response<CategoryDtoApiResult>> apiV1CategoryIdGet(
      {required String? id}) {
    generatedMapping.putIfAbsent(
        CategoryDtoApiResult, () => CategoryDtoApiResult.fromJsonFactory);

    return _apiV1CategoryIdGet(id: id);
  }

  ///Retrieves a Category by unique id
  ///@param id a unique id for the Category
  @Get(path: 'http://130.185.75.182:5003/api/v1/Category/{id}')
  Future<chopper.Response<CategoryDtoApiResult>> _apiV1CategoryIdGet(
      {@Path('id') required String? id});

  ///Deletes a Category by unique id
  ///@param id A unique id for the Category
  Future<chopper.Response<ApiResult>> apiV1CategoryIdDelete(
      {required String? id}) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1CategoryIdDelete(id: id);
  }

  ///Deletes a Category by unique id
  ///@param id A unique id for the Category
  @Delete(path: 'http://130.185.75.182:5003/api/v1/Category/{id}')
  Future<chopper.Response<ApiResult>> _apiV1CategoryIdDelete(
      {@Path('id') required String? id});

  ///Updates a Category by unique id
  ///@param id A Category representation
  Future<chopper.Response<ApiResult>> apiV1CategoryUpdatePost({
    String? id,
    required CategoryDto? body,
  }) {
    generatedMapping.putIfAbsent(ApiResult, () => ApiResult.fromJsonFactory);

    return _apiV1CategoryUpdatePost(id: id, body: body);
  }

  ///Updates a Category by unique id
  ///@param id A Category representation
  @Post(
    path: 'http://130.185.75.182:5003/api/v1/Category/Update',
    optionalBody: true,
  )
  Future<chopper.Response<ApiResult>> _apiV1CategoryUpdatePost({
    @Query('id') String? id,
    @Body() required CategoryDto? body,
  });
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
