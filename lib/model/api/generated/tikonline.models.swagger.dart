// ignore_for_file: type=lint

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'tikonline.enums.swagger.dart' as enums;

part 'tikonline.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class AccessToken {
  const AccessToken({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.role,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);

  static const toJsonFactory = _$AccessTokenToJson;
  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);

  @JsonKey(name: 'access_token', includeIfNull: false)
  final String? accessToken;
  @JsonKey(name: 'refresh_token', includeIfNull: false)
  final String? refreshToken;
  @JsonKey(name: 'token_type', includeIfNull: false)
  final String? tokenType;
  @JsonKey(name: 'expires_in', includeIfNull: false)
  final int? expiresIn;
  @JsonKey(
    name: 'role',
    includeIfNull: false,
    toJson: userRolesNullableToJson,
    fromJson: userRolesNullableFromJson,
  )
  final enums.UserRoles? role;
  static const fromJsonFactory = _$AccessTokenFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AccessToken &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.tokenType, tokenType) ||
                const DeepCollectionEquality()
                    .equals(other.tokenType, tokenType)) &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresIn, expiresIn)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(tokenType) ^
      const DeepCollectionEquality().hash(expiresIn) ^
      const DeepCollectionEquality().hash(role) ^
      runtimeType.hashCode;
}

extension $AccessTokenExtension on AccessToken {
  AccessToken copyWith(
      {String? accessToken,
      String? refreshToken,
      String? tokenType,
      int? expiresIn,
      enums.UserRoles? role}) {
    return AccessToken(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        role: role ?? this.role);
  }

  AccessToken copyWithWrapped(
      {Wrapped<String?>? accessToken,
      Wrapped<String?>? refreshToken,
      Wrapped<String?>? tokenType,
      Wrapped<int?>? expiresIn,
      Wrapped<enums.UserRoles?>? role}) {
    return AccessToken(
        accessToken:
            (accessToken != null ? accessToken.value : this.accessToken),
        refreshToken:
            (refreshToken != null ? refreshToken.value : this.refreshToken),
        tokenType: (tokenType != null ? tokenType.value : this.tokenType),
        expiresIn: (expiresIn != null ? expiresIn.value : this.expiresIn),
        role: (role != null ? role.value : this.role));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiResult {
  const ApiResult({
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory ApiResult.fromJson(Map<String, dynamic> json) =>
      _$ApiResultFromJson(json);

  static const toJsonFactory = _$ApiResultToJson;
  Map<String, dynamic> toJson() => _$ApiResultToJson(this);

  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$ApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiResult &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $ApiResultExtension on ApiResult {
  ApiResult copyWith(
      {bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return ApiResult(
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  ApiResult copyWithWrapped(
      {Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return ApiResult(
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class BookDto {
  const BookDto({
    this.title,
    this.description,
    this.imageUrl,
    this.nevisande,
    this.entesharat,
    this.motarjem,
    this.salEnteshar,
    this.pages,
    this.rating,
    this.price,
    this.categoryId,
    this.categoryName,
    this.id,
  });

  factory BookDto.fromJson(Map<String, dynamic> json) =>
      _$BookDtoFromJson(json);

  static const toJsonFactory = _$BookDtoToJson;
  Map<String, dynamic> toJson() => _$BookDtoToJson(this);

  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'imageUrl', includeIfNull: false)
  final String? imageUrl;
  @JsonKey(name: 'nevisande', includeIfNull: false)
  final String? nevisande;
  @JsonKey(name: 'entesharat', includeIfNull: false)
  final String? entesharat;
  @JsonKey(name: 'motarjem', includeIfNull: false)
  final String? motarjem;
  @JsonKey(name: 'salEnteshar', includeIfNull: false)
  final String? salEnteshar;
  @JsonKey(name: 'pages', includeIfNull: false)
  final int? pages;
  @JsonKey(name: 'rating', includeIfNull: false)
  final int? rating;
  @JsonKey(name: 'price', includeIfNull: false)
  final int? price;
  @JsonKey(name: 'categoryId', includeIfNull: false)
  final String? categoryId;
  @JsonKey(name: 'categoryName', includeIfNull: false)
  final String? categoryName;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$BookDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.nevisande, nevisande) ||
                const DeepCollectionEquality()
                    .equals(other.nevisande, nevisande)) &&
            (identical(other.entesharat, entesharat) ||
                const DeepCollectionEquality()
                    .equals(other.entesharat, entesharat)) &&
            (identical(other.motarjem, motarjem) ||
                const DeepCollectionEquality()
                    .equals(other.motarjem, motarjem)) &&
            (identical(other.salEnteshar, salEnteshar) ||
                const DeepCollectionEquality()
                    .equals(other.salEnteshar, salEnteshar)) &&
            (identical(other.pages, pages) ||
                const DeepCollectionEquality().equals(other.pages, pages)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.categoryName, categoryName) ||
                const DeepCollectionEquality()
                    .equals(other.categoryName, categoryName)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(nevisande) ^
      const DeepCollectionEquality().hash(entesharat) ^
      const DeepCollectionEquality().hash(motarjem) ^
      const DeepCollectionEquality().hash(salEnteshar) ^
      const DeepCollectionEquality().hash(pages) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(categoryName) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $BookDtoExtension on BookDto {
  BookDto copyWith(
      {String? title,
      String? description,
      String? imageUrl,
      String? nevisande,
      String? entesharat,
      String? motarjem,
      String? salEnteshar,
      int? pages,
      int? rating,
      int? price,
      String? categoryId,
      String? categoryName,
      String? id}) {
    return BookDto(
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        nevisande: nevisande ?? this.nevisande,
        entesharat: entesharat ?? this.entesharat,
        motarjem: motarjem ?? this.motarjem,
        salEnteshar: salEnteshar ?? this.salEnteshar,
        pages: pages ?? this.pages,
        rating: rating ?? this.rating,
        price: price ?? this.price,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        id: id ?? this.id);
  }

  BookDto copyWithWrapped(
      {Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<String?>? imageUrl,
      Wrapped<String?>? nevisande,
      Wrapped<String?>? entesharat,
      Wrapped<String?>? motarjem,
      Wrapped<String?>? salEnteshar,
      Wrapped<int?>? pages,
      Wrapped<int?>? rating,
      Wrapped<int?>? price,
      Wrapped<String?>? categoryId,
      Wrapped<String?>? categoryName,
      Wrapped<String?>? id}) {
    return BookDto(
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        imageUrl: (imageUrl != null ? imageUrl.value : this.imageUrl),
        nevisande: (nevisande != null ? nevisande.value : this.nevisande),
        entesharat: (entesharat != null ? entesharat.value : this.entesharat),
        motarjem: (motarjem != null ? motarjem.value : this.motarjem),
        salEnteshar:
            (salEnteshar != null ? salEnteshar.value : this.salEnteshar),
        pages: (pages != null ? pages.value : this.pages),
        rating: (rating != null ? rating.value : this.rating),
        price: (price != null ? price.value : this.price),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        categoryName:
            (categoryName != null ? categoryName.value : this.categoryName),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class BookDtoListApiResult {
  const BookDtoListApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory BookDtoListApiResult.fromJson(Map<String, dynamic> json) =>
      _$BookDtoListApiResultFromJson(json);

  static const toJsonFactory = _$BookDtoListApiResultToJson;
  Map<String, dynamic> toJson() => _$BookDtoListApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false, defaultValue: <BookDto>[])
  final List<BookDto>? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$BookDtoListApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookDtoListApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $BookDtoListApiResultExtension on BookDtoListApiResult {
  BookDtoListApiResult copyWith(
      {List<BookDto>? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return BookDtoListApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  BookDtoListApiResult copyWithWrapped(
      {Wrapped<List<BookDto>?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return BookDtoListApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryDto {
  const CategoryDto({
    this.title,
    this.motherId,
    this.id,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  static const toJsonFactory = _$CategoryDtoToJson;
  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;
  @JsonKey(name: 'motherId', includeIfNull: false)
  final String? motherId;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$CategoryDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CategoryDto &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.motherId, motherId) ||
                const DeepCollectionEquality()
                    .equals(other.motherId, motherId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(motherId) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $CategoryDtoExtension on CategoryDto {
  CategoryDto copyWith({String? title, String? motherId, String? id}) {
    return CategoryDto(
        title: title ?? this.title,
        motherId: motherId ?? this.motherId,
        id: id ?? this.id);
  }

  CategoryDto copyWithWrapped(
      {Wrapped<String?>? title,
      Wrapped<String?>? motherId,
      Wrapped<String?>? id}) {
    return CategoryDto(
        title: (title != null ? title.value : this.title),
        motherId: (motherId != null ? motherId.value : this.motherId),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class CategoryDtoListApiResult {
  const CategoryDtoListApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory CategoryDtoListApiResult.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoListApiResultFromJson(json);

  static const toJsonFactory = _$CategoryDtoListApiResultToJson;
  Map<String, dynamic> toJson() => _$CategoryDtoListApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false, defaultValue: <CategoryDto>[])
  final List<CategoryDto>? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$CategoryDtoListApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CategoryDtoListApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $CategoryDtoListApiResultExtension on CategoryDtoListApiResult {
  CategoryDtoListApiResult copyWith(
      {List<CategoryDto>? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return CategoryDtoListApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  CategoryDtoListApiResult copyWithWrapped(
      {Wrapped<List<CategoryDto>?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return CategoryDtoListApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class DashboardDto {
  const DashboardDto({
    this.allUsers,
    this.foodScans,
    this.giftScans,
    this.presences,
  });

  factory DashboardDto.fromJson(Map<String, dynamic> json) =>
      _$DashboardDtoFromJson(json);

  static const toJsonFactory = _$DashboardDtoToJson;
  Map<String, dynamic> toJson() => _$DashboardDtoToJson(this);

  @JsonKey(name: 'allUsers', includeIfNull: false)
  final int? allUsers;
  @JsonKey(name: 'foodScans', includeIfNull: false)
  final int? foodScans;
  @JsonKey(name: 'giftScans', includeIfNull: false)
  final int? giftScans;
  @JsonKey(name: 'presences', includeIfNull: false)
  final int? presences;
  static const fromJsonFactory = _$DashboardDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DashboardDto &&
            (identical(other.allUsers, allUsers) ||
                const DeepCollectionEquality()
                    .equals(other.allUsers, allUsers)) &&
            (identical(other.foodScans, foodScans) ||
                const DeepCollectionEquality()
                    .equals(other.foodScans, foodScans)) &&
            (identical(other.giftScans, giftScans) ||
                const DeepCollectionEquality()
                    .equals(other.giftScans, giftScans)) &&
            (identical(other.presences, presences) ||
                const DeepCollectionEquality()
                    .equals(other.presences, presences)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(allUsers) ^
      const DeepCollectionEquality().hash(foodScans) ^
      const DeepCollectionEquality().hash(giftScans) ^
      const DeepCollectionEquality().hash(presences) ^
      runtimeType.hashCode;
}

extension $DashboardDtoExtension on DashboardDto {
  DashboardDto copyWith(
      {int? allUsers, int? foodScans, int? giftScans, int? presences}) {
    return DashboardDto(
        allUsers: allUsers ?? this.allUsers,
        foodScans: foodScans ?? this.foodScans,
        giftScans: giftScans ?? this.giftScans,
        presences: presences ?? this.presences);
  }

  DashboardDto copyWithWrapped(
      {Wrapped<int?>? allUsers,
      Wrapped<int?>? foodScans,
      Wrapped<int?>? giftScans,
      Wrapped<int?>? presences}) {
    return DashboardDto(
        allUsers: (allUsers != null ? allUsers.value : this.allUsers),
        foodScans: (foodScans != null ? foodScans.value : this.foodScans),
        giftScans: (giftScans != null ? giftScans.value : this.giftScans),
        presences: (presences != null ? presences.value : this.presences));
  }
}

@JsonSerializable(explicitToJson: true)
class DashboardDtoApiResult {
  const DashboardDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory DashboardDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$DashboardDtoApiResultFromJson(json);

  static const toJsonFactory = _$DashboardDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$DashboardDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final DashboardDto? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$DashboardDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DashboardDtoApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $DashboardDtoApiResultExtension on DashboardDtoApiResult {
  DashboardDtoApiResult copyWith(
      {DashboardDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return DashboardDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  DashboardDtoApiResult copyWithWrapped(
      {Wrapped<DashboardDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return DashboardDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class LoginDto {
  const LoginDto({
    this.userName,
    this.password,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  static const toJsonFactory = _$LoginDtoToJson;
  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

  @JsonKey(name: 'userName', includeIfNull: false)
  final String? userName;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  static const fromJsonFactory = _$LoginDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is LoginDto &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(password) ^
      runtimeType.hashCode;
}

extension $LoginDtoExtension on LoginDto {
  LoginDto copyWith({String? userName, String? password}) {
    return LoginDto(
        userName: userName ?? this.userName,
        password: password ?? this.password);
  }

  LoginDto copyWithWrapped(
      {Wrapped<String?>? userName, Wrapped<String?>? password}) {
    return LoginDto(
        userName: (userName != null ? userName.value : this.userName),
        password: (password != null ? password.value : this.password));
  }
}

@JsonSerializable(explicitToJson: true)
class TempUserDto {
  const TempUserDto({
    required this.phoneNumber,
    this.otp,
    this.fname,
    this.lname,
    this.creationDate,
    this.exist,
    this.id,
  });

  factory TempUserDto.fromJson(Map<String, dynamic> json) =>
      _$TempUserDtoFromJson(json);

  static const toJsonFactory = _$TempUserDtoToJson;
  Map<String, dynamic> toJson() => _$TempUserDtoToJson(this);

  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String phoneNumber;
  @JsonKey(name: 'otp', includeIfNull: false)
  final String? otp;
  @JsonKey(name: 'fname', includeIfNull: false)
  final String? fname;
  @JsonKey(name: 'lname', includeIfNull: false)
  final String? lname;
  @JsonKey(name: 'creationDate', includeIfNull: false)
  final DateTime? creationDate;
  @JsonKey(name: 'exist', includeIfNull: false)
  final bool? exist;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$TempUserDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TempUserDto &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.otp, otp) ||
                const DeepCollectionEquality().equals(other.otp, otp)) &&
            (identical(other.fname, fname) ||
                const DeepCollectionEquality().equals(other.fname, fname)) &&
            (identical(other.lname, lname) ||
                const DeepCollectionEquality().equals(other.lname, lname)) &&
            (identical(other.creationDate, creationDate) ||
                const DeepCollectionEquality()
                    .equals(other.creationDate, creationDate)) &&
            (identical(other.exist, exist) ||
                const DeepCollectionEquality().equals(other.exist, exist)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(otp) ^
      const DeepCollectionEquality().hash(fname) ^
      const DeepCollectionEquality().hash(lname) ^
      const DeepCollectionEquality().hash(creationDate) ^
      const DeepCollectionEquality().hash(exist) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $TempUserDtoExtension on TempUserDto {
  TempUserDto copyWith(
      {String? phoneNumber,
      String? otp,
      String? fname,
      String? lname,
      DateTime? creationDate,
      bool? exist,
      String? id}) {
    return TempUserDto(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        otp: otp ?? this.otp,
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
        creationDate: creationDate ?? this.creationDate,
        exist: exist ?? this.exist,
        id: id ?? this.id);
  }

  TempUserDto copyWithWrapped(
      {Wrapped<String>? phoneNumber,
      Wrapped<String?>? otp,
      Wrapped<String?>? fname,
      Wrapped<String?>? lname,
      Wrapped<DateTime?>? creationDate,
      Wrapped<bool?>? exist,
      Wrapped<String?>? id}) {
    return TempUserDto(
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        otp: (otp != null ? otp.value : this.otp),
        fname: (fname != null ? fname.value : this.fname),
        lname: (lname != null ? lname.value : this.lname),
        creationDate:
            (creationDate != null ? creationDate.value : this.creationDate),
        exist: (exist != null ? exist.value : this.exist),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class TempUserDtoApiResult {
  const TempUserDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory TempUserDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$TempUserDtoApiResultFromJson(json);

  static const toJsonFactory = _$TempUserDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$TempUserDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final TempUserDto? data;
  @JsonKey(name: 'isSuccess', includeIfNull: false)
  final bool? isSuccess;
  @JsonKey(
    name: 'statusCode',
    includeIfNull: false,
    toJson: apiResultStatusCodeNullableToJson,
    fromJson: apiResultStatusCodeNullableFromJson,
  )
  final enums.ApiResultStatusCode? statusCode;
  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  static const fromJsonFactory = _$TempUserDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TempUserDtoApiResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(message) ^
      runtimeType.hashCode;
}

extension $TempUserDtoApiResultExtension on TempUserDtoApiResult {
  TempUserDtoApiResult copyWith(
      {TempUserDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return TempUserDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  TempUserDtoApiResult copyWithWrapped(
      {Wrapped<TempUserDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return TempUserDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class ApiV1AuthenticationFreeTokenPost$RequestBody {
  const ApiV1AuthenticationFreeTokenPost$RequestBody({
    this.grantType,
    this.username,
    this.password,
    this.refreshToken,
    this.scope,
    this.clientId,
    this.clientSecret,
  });

  factory ApiV1AuthenticationFreeTokenPost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ApiV1AuthenticationFreeTokenPost$RequestBodyFromJson(json);

  static const toJsonFactory =
      _$ApiV1AuthenticationFreeTokenPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1AuthenticationFreeTokenPost$RequestBodyToJson(this);

  @JsonKey(name: 'grant_type', includeIfNull: false)
  final String? grantType;
  @JsonKey(name: 'username', includeIfNull: false)
  final String? username;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(name: 'refresh_token', includeIfNull: false)
  final String? refreshToken;
  @JsonKey(name: 'scope', includeIfNull: false)
  final String? scope;
  @JsonKey(name: 'client_id', includeIfNull: false)
  final String? clientId;
  @JsonKey(name: 'client_secret', includeIfNull: false)
  final String? clientSecret;
  static const fromJsonFactory =
      _$ApiV1AuthenticationFreeTokenPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiV1AuthenticationFreeTokenPost$RequestBody &&
            (identical(other.grantType, grantType) ||
                const DeepCollectionEquality()
                    .equals(other.grantType, grantType)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.scope, scope) ||
                const DeepCollectionEquality().equals(other.scope, scope)) &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.clientSecret, clientSecret) ||
                const DeepCollectionEquality()
                    .equals(other.clientSecret, clientSecret)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(grantType) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(scope) ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(clientSecret) ^
      runtimeType.hashCode;
}

extension $ApiV1AuthenticationFreeTokenPost$RequestBodyExtension
    on ApiV1AuthenticationFreeTokenPost$RequestBody {
  ApiV1AuthenticationFreeTokenPost$RequestBody copyWith(
      {String? grantType,
      String? username,
      String? password,
      String? refreshToken,
      String? scope,
      String? clientId,
      String? clientSecret}) {
    return ApiV1AuthenticationFreeTokenPost$RequestBody(
        grantType: grantType ?? this.grantType,
        username: username ?? this.username,
        password: password ?? this.password,
        refreshToken: refreshToken ?? this.refreshToken,
        scope: scope ?? this.scope,
        clientId: clientId ?? this.clientId,
        clientSecret: clientSecret ?? this.clientSecret);
  }

  ApiV1AuthenticationFreeTokenPost$RequestBody copyWithWrapped(
      {Wrapped<String?>? grantType,
      Wrapped<String?>? username,
      Wrapped<String?>? password,
      Wrapped<String?>? refreshToken,
      Wrapped<String?>? scope,
      Wrapped<String?>? clientId,
      Wrapped<String?>? clientSecret}) {
    return ApiV1AuthenticationFreeTokenPost$RequestBody(
        grantType: (grantType != null ? grantType.value : this.grantType),
        username: (username != null ? username.value : this.username),
        password: (password != null ? password.value : this.password),
        refreshToken:
            (refreshToken != null ? refreshToken.value : this.refreshToken),
        scope: (scope != null ? scope.value : this.scope),
        clientId: (clientId != null ? clientId.value : this.clientId),
        clientSecret:
            (clientSecret != null ? clientSecret.value : this.clientSecret));
  }
}

String? apiResultStatusCodeNullableToJson(
    enums.ApiResultStatusCode? apiResultStatusCode) {
  return apiResultStatusCode?.value;
}

String? apiResultStatusCodeToJson(
    enums.ApiResultStatusCode apiResultStatusCode) {
  return apiResultStatusCode.value;
}

enums.ApiResultStatusCode apiResultStatusCodeFromJson(
  Object? apiResultStatusCode, [
  enums.ApiResultStatusCode? defaultValue,
]) {
  return enums.ApiResultStatusCode.values
          .firstWhereOrNull((e) => e.value == apiResultStatusCode) ??
      defaultValue ??
      enums.ApiResultStatusCode.swaggerGeneratedUnknown;
}

enums.ApiResultStatusCode? apiResultStatusCodeNullableFromJson(
  Object? apiResultStatusCode, [
  enums.ApiResultStatusCode? defaultValue,
]) {
  if (apiResultStatusCode == null) {
    return null;
  }
  return enums.ApiResultStatusCode.values
          .firstWhereOrNull((e) => e.value == apiResultStatusCode) ??
      defaultValue;
}

String apiResultStatusCodeExplodedListToJson(
    List<enums.ApiResultStatusCode>? apiResultStatusCode) {
  return apiResultStatusCode?.map((e) => e.value!).join(',') ?? '';
}

List<String> apiResultStatusCodeListToJson(
    List<enums.ApiResultStatusCode>? apiResultStatusCode) {
  if (apiResultStatusCode == null) {
    return [];
  }

  return apiResultStatusCode.map((e) => e.value!).toList();
}

List<enums.ApiResultStatusCode> apiResultStatusCodeListFromJson(
  List? apiResultStatusCode, [
  List<enums.ApiResultStatusCode>? defaultValue,
]) {
  if (apiResultStatusCode == null) {
    return defaultValue ?? [];
  }

  return apiResultStatusCode
      .map((e) => apiResultStatusCodeFromJson(e.toString()))
      .toList();
}

List<enums.ApiResultStatusCode>? apiResultStatusCodeNullableListFromJson(
  List? apiResultStatusCode, [
  List<enums.ApiResultStatusCode>? defaultValue,
]) {
  if (apiResultStatusCode == null) {
    return defaultValue;
  }

  return apiResultStatusCode
      .map((e) => apiResultStatusCodeFromJson(e.toString()))
      .toList();
}

String? userRolesNullableToJson(enums.UserRoles? userRoles) {
  return userRoles?.value;
}

String? userRolesToJson(enums.UserRoles userRoles) {
  return userRoles.value;
}

enums.UserRoles userRolesFromJson(
  Object? userRoles, [
  enums.UserRoles? defaultValue,
]) {
  return enums.UserRoles.values.firstWhereOrNull((e) => e.value == userRoles) ??
      defaultValue ??
      enums.UserRoles.swaggerGeneratedUnknown;
}

enums.UserRoles? userRolesNullableFromJson(
  Object? userRoles, [
  enums.UserRoles? defaultValue,
]) {
  if (userRoles == null) {
    return null;
  }
  return enums.UserRoles.values.firstWhereOrNull((e) => e.value == userRoles) ??
      defaultValue;
}

String userRolesExplodedListToJson(List<enums.UserRoles>? userRoles) {
  return userRoles?.map((e) => e.value!).join(',') ?? '';
}

List<String> userRolesListToJson(List<enums.UserRoles>? userRoles) {
  if (userRoles == null) {
    return [];
  }

  return userRoles.map((e) => e.value!).toList();
}

List<enums.UserRoles> userRolesListFromJson(
  List? userRoles, [
  List<enums.UserRoles>? defaultValue,
]) {
  if (userRoles == null) {
    return defaultValue ?? [];
  }

  return userRoles.map((e) => userRolesFromJson(e.toString())).toList();
}

List<enums.UserRoles>? userRolesNullableListFromJson(
  List? userRoles, [
  List<enums.UserRoles>? defaultValue,
]) {
  if (userRoles == null) {
    return defaultValue;
  }

  return userRoles.map((e) => userRolesFromJson(e.toString())).toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
