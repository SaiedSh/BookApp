// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

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
    this.imageFile,
    this.pdfLink,
    this.pdfFile,
    this.nevisande,
    this.entesharat,
    this.motarjem,
    this.salEnteshar,
    this.pages,
    this.rating,
    this.price,
    this.discountPrice,
    this.viewCount,
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
  @JsonKey(name: 'imageFile', includeIfNull: false)
  final String? imageFile;
  @JsonKey(name: 'pdfLink', includeIfNull: false)
  final String? pdfLink;
  @JsonKey(name: 'pdfFile', includeIfNull: false)
  final String? pdfFile;
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
  @JsonKey(name: 'discountPrice', includeIfNull: false)
  final int? discountPrice;
  @JsonKey(name: 'viewCount', includeIfNull: false)
  final int? viewCount;
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
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.pdfLink, pdfLink) ||
                const DeepCollectionEquality()
                    .equals(other.pdfLink, pdfLink)) &&
            (identical(other.pdfFile, pdfFile) ||
                const DeepCollectionEquality()
                    .equals(other.pdfFile, pdfFile)) &&
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
            (identical(other.discountPrice, discountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountPrice, discountPrice)) &&
            (identical(other.viewCount, viewCount) ||
                const DeepCollectionEquality()
                    .equals(other.viewCount, viewCount)) &&
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
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(pdfLink) ^
      const DeepCollectionEquality().hash(pdfFile) ^
      const DeepCollectionEquality().hash(nevisande) ^
      const DeepCollectionEquality().hash(entesharat) ^
      const DeepCollectionEquality().hash(motarjem) ^
      const DeepCollectionEquality().hash(salEnteshar) ^
      const DeepCollectionEquality().hash(pages) ^
      const DeepCollectionEquality().hash(rating) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      const DeepCollectionEquality().hash(viewCount) ^
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
      String? imageFile,
      String? pdfLink,
      String? pdfFile,
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
      String? id}) {
    return BookDto(
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        imageFile: imageFile ?? this.imageFile,
        pdfLink: pdfLink ?? this.pdfLink,
        pdfFile: pdfFile ?? this.pdfFile,
        nevisande: nevisande ?? this.nevisande,
        entesharat: entesharat ?? this.entesharat,
        motarjem: motarjem ?? this.motarjem,
        salEnteshar: salEnteshar ?? this.salEnteshar,
        pages: pages ?? this.pages,
        rating: rating ?? this.rating,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        viewCount: viewCount ?? this.viewCount,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        id: id ?? this.id);
  }

  BookDto copyWithWrapped(
      {Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<String?>? imageUrl,
      Wrapped<String?>? imageFile,
      Wrapped<String?>? pdfLink,
      Wrapped<String?>? pdfFile,
      Wrapped<String?>? nevisande,
      Wrapped<String?>? entesharat,
      Wrapped<String?>? motarjem,
      Wrapped<String?>? salEnteshar,
      Wrapped<int?>? pages,
      Wrapped<int?>? rating,
      Wrapped<int?>? price,
      Wrapped<int?>? discountPrice,
      Wrapped<int?>? viewCount,
      Wrapped<String?>? categoryId,
      Wrapped<String?>? categoryName,
      Wrapped<String?>? id}) {
    return BookDto(
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        imageUrl: (imageUrl != null ? imageUrl.value : this.imageUrl),
        imageFile: (imageFile != null ? imageFile.value : this.imageFile),
        pdfLink: (pdfLink != null ? pdfLink.value : this.pdfLink),
        pdfFile: (pdfFile != null ? pdfFile.value : this.pdfFile),
        nevisande: (nevisande != null ? nevisande.value : this.nevisande),
        entesharat: (entesharat != null ? entesharat.value : this.entesharat),
        motarjem: (motarjem != null ? motarjem.value : this.motarjem),
        salEnteshar:
            (salEnteshar != null ? salEnteshar.value : this.salEnteshar),
        pages: (pages != null ? pages.value : this.pages),
        rating: (rating != null ? rating.value : this.rating),
        price: (price != null ? price.value : this.price),
        discountPrice:
            (discountPrice != null ? discountPrice.value : this.discountPrice),
        viewCount: (viewCount != null ? viewCount.value : this.viewCount),
        categoryId: (categoryId != null ? categoryId.value : this.categoryId),
        categoryName:
            (categoryName != null ? categoryName.value : this.categoryName),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class BookDtoApiResult {
  const BookDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory BookDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$BookDtoApiResultFromJson(json);

  static const toJsonFactory = _$BookDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$BookDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final BookDto? data;
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
  static const fromJsonFactory = _$BookDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookDtoApiResult &&
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

extension $BookDtoApiResultExtension on BookDtoApiResult {
  BookDtoApiResult copyWith(
      {BookDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return BookDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  BookDtoApiResult copyWithWrapped(
      {Wrapped<BookDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return BookDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
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
class CategoryDtoApiResult {
  const CategoryDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory CategoryDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoApiResultFromJson(json);

  static const toJsonFactory = _$CategoryDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$CategoryDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final CategoryDto? data;
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
  static const fromJsonFactory = _$CategoryDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is CategoryDtoApiResult &&
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

extension $CategoryDtoApiResultExtension on CategoryDtoApiResult {
  CategoryDtoApiResult copyWith(
      {CategoryDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return CategoryDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  CategoryDtoApiResult copyWithWrapped(
      {Wrapped<CategoryDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return CategoryDtoApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
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
class IndexDto {
  const IndexDto({
    this.discountBooks,
    this.freeBooks,
    this.mostViewedBooks,
    this.indexInfo,
  });

  factory IndexDto.fromJson(Map<String, dynamic> json) =>
      _$IndexDtoFromJson(json);

  static const toJsonFactory = _$IndexDtoToJson;
  Map<String, dynamic> toJson() => _$IndexDtoToJson(this);

  @JsonKey(
      name: 'discountBooks', includeIfNull: false, defaultValue: <BookDto>[])
  final List<BookDto>? discountBooks;
  @JsonKey(name: 'freeBooks', includeIfNull: false, defaultValue: <BookDto>[])
  final List<BookDto>? freeBooks;
  @JsonKey(
      name: 'mostViewedBooks', includeIfNull: false, defaultValue: <BookDto>[])
  final List<BookDto>? mostViewedBooks;
  @JsonKey(name: 'indexInfo', includeIfNull: false)
  final SettingDto? indexInfo;
  static const fromJsonFactory = _$IndexDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is IndexDto &&
            (identical(other.discountBooks, discountBooks) ||
                const DeepCollectionEquality()
                    .equals(other.discountBooks, discountBooks)) &&
            (identical(other.freeBooks, freeBooks) ||
                const DeepCollectionEquality()
                    .equals(other.freeBooks, freeBooks)) &&
            (identical(other.mostViewedBooks, mostViewedBooks) ||
                const DeepCollectionEquality()
                    .equals(other.mostViewedBooks, mostViewedBooks)) &&
            (identical(other.indexInfo, indexInfo) ||
                const DeepCollectionEquality()
                    .equals(other.indexInfo, indexInfo)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(discountBooks) ^
      const DeepCollectionEquality().hash(freeBooks) ^
      const DeepCollectionEquality().hash(mostViewedBooks) ^
      const DeepCollectionEquality().hash(indexInfo) ^
      runtimeType.hashCode;
}

extension $IndexDtoExtension on IndexDto {
  IndexDto copyWith(
      {List<BookDto>? discountBooks,
      List<BookDto>? freeBooks,
      List<BookDto>? mostViewedBooks,
      SettingDto? indexInfo}) {
    return IndexDto(
        discountBooks: discountBooks ?? this.discountBooks,
        freeBooks: freeBooks ?? this.freeBooks,
        mostViewedBooks: mostViewedBooks ?? this.mostViewedBooks,
        indexInfo: indexInfo ?? this.indexInfo);
  }

  IndexDto copyWithWrapped(
      {Wrapped<List<BookDto>?>? discountBooks,
      Wrapped<List<BookDto>?>? freeBooks,
      Wrapped<List<BookDto>?>? mostViewedBooks,
      Wrapped<SettingDto?>? indexInfo}) {
    return IndexDto(
        discountBooks:
            (discountBooks != null ? discountBooks.value : this.discountBooks),
        freeBooks: (freeBooks != null ? freeBooks.value : this.freeBooks),
        mostViewedBooks: (mostViewedBooks != null
            ? mostViewedBooks.value
            : this.mostViewedBooks),
        indexInfo: (indexInfo != null ? indexInfo.value : this.indexInfo));
  }
}

@JsonSerializable(explicitToJson: true)
class IndexDtoApiResult {
  const IndexDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory IndexDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$IndexDtoApiResultFromJson(json);

  static const toJsonFactory = _$IndexDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$IndexDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final IndexDto? data;
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
  static const fromJsonFactory = _$IndexDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is IndexDtoApiResult &&
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

extension $IndexDtoApiResultExtension on IndexDtoApiResult {
  IndexDtoApiResult copyWith(
      {IndexDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return IndexDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  IndexDtoApiResult copyWithWrapped(
      {Wrapped<IndexDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return IndexDtoApiResult(
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
class SettingDto {
  const SettingDto({
    this.banner1ImageUrl,
    this.banner1ImageFile,
    this.banner1Title,
    this.banner1SubTitle,
    this.banner1Description,
    this.banner1ButtonText,
    this.banner1ButtonLink,
    this.banner2ImageUrl,
    this.banner2ImageFile,
    this.banner2Title,
    this.banner2SubTitle,
    this.banner2Description,
    this.banner2ButtonText,
    this.banner2ButtonLink,
    this.banner3ImageUrl,
    this.banner3ImageFile,
    this.banner3Title,
    this.banner3SubTitle,
    this.banner3Description,
    this.banner3ButtonText,
    this.banner3ButtonLink,
    this.id,
  });

  factory SettingDto.fromJson(Map<String, dynamic> json) =>
      _$SettingDtoFromJson(json);

  static const toJsonFactory = _$SettingDtoToJson;
  Map<String, dynamic> toJson() => _$SettingDtoToJson(this);

  @JsonKey(name: 'banner1ImageUrl', includeIfNull: false)
  final String? banner1ImageUrl;
  @JsonKey(name: 'banner1ImageFile', includeIfNull: false)
  final String? banner1ImageFile;
  @JsonKey(name: 'banner1Title', includeIfNull: false)
  final String? banner1Title;
  @JsonKey(name: 'banner1SubTitle', includeIfNull: false)
  final String? banner1SubTitle;
  @JsonKey(name: 'banner1Description', includeIfNull: false)
  final String? banner1Description;
  @JsonKey(name: 'banner1ButtonText', includeIfNull: false)
  final String? banner1ButtonText;
  @JsonKey(name: 'banner1ButtonLink', includeIfNull: false)
  final String? banner1ButtonLink;
  @JsonKey(name: 'banner2ImageUrl', includeIfNull: false)
  final String? banner2ImageUrl;
  @JsonKey(name: 'banner2ImageFile', includeIfNull: false)
  final String? banner2ImageFile;
  @JsonKey(name: 'banner2Title', includeIfNull: false)
  final String? banner2Title;
  @JsonKey(name: 'banner2SubTitle', includeIfNull: false)
  final String? banner2SubTitle;
  @JsonKey(name: 'banner2Description', includeIfNull: false)
  final String? banner2Description;
  @JsonKey(name: 'banner2ButtonText', includeIfNull: false)
  final String? banner2ButtonText;
  @JsonKey(name: 'banner2ButtonLink', includeIfNull: false)
  final String? banner2ButtonLink;
  @JsonKey(name: 'banner3ImageUrl', includeIfNull: false)
  final String? banner3ImageUrl;
  @JsonKey(name: 'banner3ImageFile', includeIfNull: false)
  final String? banner3ImageFile;
  @JsonKey(name: 'banner3Title', includeIfNull: false)
  final String? banner3Title;
  @JsonKey(name: 'banner3SubTitle', includeIfNull: false)
  final String? banner3SubTitle;
  @JsonKey(name: 'banner3Description', includeIfNull: false)
  final String? banner3Description;
  @JsonKey(name: 'banner3ButtonText', includeIfNull: false)
  final String? banner3ButtonText;
  @JsonKey(name: 'banner3ButtonLink', includeIfNull: false)
  final String? banner3ButtonLink;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$SettingDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SettingDto &&
            (identical(other.banner1ImageUrl, banner1ImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.banner1ImageUrl, banner1ImageUrl)) &&
            (identical(other.banner1ImageFile, banner1ImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.banner1ImageFile, banner1ImageFile)) &&
            (identical(other.banner1Title, banner1Title) ||
                const DeepCollectionEquality()
                    .equals(other.banner1Title, banner1Title)) &&
            (identical(other.banner1SubTitle, banner1SubTitle) ||
                const DeepCollectionEquality()
                    .equals(other.banner1SubTitle, banner1SubTitle)) &&
            (identical(other.banner1Description, banner1Description) ||
                const DeepCollectionEquality()
                    .equals(other.banner1Description, banner1Description)) &&
            (identical(other.banner1ButtonText, banner1ButtonText) ||
                const DeepCollectionEquality()
                    .equals(other.banner1ButtonText, banner1ButtonText)) &&
            (identical(other.banner1ButtonLink, banner1ButtonLink) ||
                const DeepCollectionEquality()
                    .equals(other.banner1ButtonLink, banner1ButtonLink)) &&
            (identical(other.banner2ImageUrl, banner2ImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.banner2ImageUrl, banner2ImageUrl)) &&
            (identical(other.banner2ImageFile, banner2ImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.banner2ImageFile, banner2ImageFile)) &&
            (identical(other.banner2Title, banner2Title) ||
                const DeepCollectionEquality()
                    .equals(other.banner2Title, banner2Title)) &&
            (identical(other.banner2SubTitle, banner2SubTitle) ||
                const DeepCollectionEquality()
                    .equals(other.banner2SubTitle, banner2SubTitle)) &&
            (identical(other.banner2Description, banner2Description) ||
                const DeepCollectionEquality()
                    .equals(other.banner2Description, banner2Description)) &&
            (identical(other.banner2ButtonText, banner2ButtonText) ||
                const DeepCollectionEquality()
                    .equals(other.banner2ButtonText, banner2ButtonText)) &&
            (identical(other.banner2ButtonLink, banner2ButtonLink) ||
                const DeepCollectionEquality()
                    .equals(other.banner2ButtonLink, banner2ButtonLink)) &&
            (identical(other.banner3ImageUrl, banner3ImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.banner3ImageUrl, banner3ImageUrl)) &&
            (identical(other.banner3ImageFile, banner3ImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.banner3ImageFile, banner3ImageFile)) &&
            (identical(other.banner3Title, banner3Title) ||
                const DeepCollectionEquality()
                    .equals(other.banner3Title, banner3Title)) &&
            (identical(other.banner3SubTitle, banner3SubTitle) ||
                const DeepCollectionEquality()
                    .equals(other.banner3SubTitle, banner3SubTitle)) &&
            (identical(other.banner3Description, banner3Description) ||
                const DeepCollectionEquality()
                    .equals(other.banner3Description, banner3Description)) &&
            (identical(other.banner3ButtonText, banner3ButtonText) ||
                const DeepCollectionEquality()
                    .equals(other.banner3ButtonText, banner3ButtonText)) &&
            (identical(other.banner3ButtonLink, banner3ButtonLink) ||
                const DeepCollectionEquality()
                    .equals(other.banner3ButtonLink, banner3ButtonLink)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(banner1ImageUrl) ^
      const DeepCollectionEquality().hash(banner1ImageFile) ^
      const DeepCollectionEquality().hash(banner1Title) ^
      const DeepCollectionEquality().hash(banner1SubTitle) ^
      const DeepCollectionEquality().hash(banner1Description) ^
      const DeepCollectionEquality().hash(banner1ButtonText) ^
      const DeepCollectionEquality().hash(banner1ButtonLink) ^
      const DeepCollectionEquality().hash(banner2ImageUrl) ^
      const DeepCollectionEquality().hash(banner2ImageFile) ^
      const DeepCollectionEquality().hash(banner2Title) ^
      const DeepCollectionEquality().hash(banner2SubTitle) ^
      const DeepCollectionEquality().hash(banner2Description) ^
      const DeepCollectionEquality().hash(banner2ButtonText) ^
      const DeepCollectionEquality().hash(banner2ButtonLink) ^
      const DeepCollectionEquality().hash(banner3ImageUrl) ^
      const DeepCollectionEquality().hash(banner3ImageFile) ^
      const DeepCollectionEquality().hash(banner3Title) ^
      const DeepCollectionEquality().hash(banner3SubTitle) ^
      const DeepCollectionEquality().hash(banner3Description) ^
      const DeepCollectionEquality().hash(banner3ButtonText) ^
      const DeepCollectionEquality().hash(banner3ButtonLink) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $SettingDtoExtension on SettingDto {
  SettingDto copyWith(
      {String? banner1ImageUrl,
      String? banner1ImageFile,
      String? banner1Title,
      String? banner1SubTitle,
      String? banner1Description,
      String? banner1ButtonText,
      String? banner1ButtonLink,
      String? banner2ImageUrl,
      String? banner2ImageFile,
      String? banner2Title,
      String? banner2SubTitle,
      String? banner2Description,
      String? banner2ButtonText,
      String? banner2ButtonLink,
      String? banner3ImageUrl,
      String? banner3ImageFile,
      String? banner3Title,
      String? banner3SubTitle,
      String? banner3Description,
      String? banner3ButtonText,
      String? banner3ButtonLink,
      String? id}) {
    return SettingDto(
        banner1ImageUrl: banner1ImageUrl ?? this.banner1ImageUrl,
        banner1ImageFile: banner1ImageFile ?? this.banner1ImageFile,
        banner1Title: banner1Title ?? this.banner1Title,
        banner1SubTitle: banner1SubTitle ?? this.banner1SubTitle,
        banner1Description: banner1Description ?? this.banner1Description,
        banner1ButtonText: banner1ButtonText ?? this.banner1ButtonText,
        banner1ButtonLink: banner1ButtonLink ?? this.banner1ButtonLink,
        banner2ImageUrl: banner2ImageUrl ?? this.banner2ImageUrl,
        banner2ImageFile: banner2ImageFile ?? this.banner2ImageFile,
        banner2Title: banner2Title ?? this.banner2Title,
        banner2SubTitle: banner2SubTitle ?? this.banner2SubTitle,
        banner2Description: banner2Description ?? this.banner2Description,
        banner2ButtonText: banner2ButtonText ?? this.banner2ButtonText,
        banner2ButtonLink: banner2ButtonLink ?? this.banner2ButtonLink,
        banner3ImageUrl: banner3ImageUrl ?? this.banner3ImageUrl,
        banner3ImageFile: banner3ImageFile ?? this.banner3ImageFile,
        banner3Title: banner3Title ?? this.banner3Title,
        banner3SubTitle: banner3SubTitle ?? this.banner3SubTitle,
        banner3Description: banner3Description ?? this.banner3Description,
        banner3ButtonText: banner3ButtonText ?? this.banner3ButtonText,
        banner3ButtonLink: banner3ButtonLink ?? this.banner3ButtonLink,
        id: id ?? this.id);
  }

  SettingDto copyWithWrapped(
      {Wrapped<String?>? banner1ImageUrl,
      Wrapped<String?>? banner1ImageFile,
      Wrapped<String?>? banner1Title,
      Wrapped<String?>? banner1SubTitle,
      Wrapped<String?>? banner1Description,
      Wrapped<String?>? banner1ButtonText,
      Wrapped<String?>? banner1ButtonLink,
      Wrapped<String?>? banner2ImageUrl,
      Wrapped<String?>? banner2ImageFile,
      Wrapped<String?>? banner2Title,
      Wrapped<String?>? banner2SubTitle,
      Wrapped<String?>? banner2Description,
      Wrapped<String?>? banner2ButtonText,
      Wrapped<String?>? banner2ButtonLink,
      Wrapped<String?>? banner3ImageUrl,
      Wrapped<String?>? banner3ImageFile,
      Wrapped<String?>? banner3Title,
      Wrapped<String?>? banner3SubTitle,
      Wrapped<String?>? banner3Description,
      Wrapped<String?>? banner3ButtonText,
      Wrapped<String?>? banner3ButtonLink,
      Wrapped<String?>? id}) {
    return SettingDto(
        banner1ImageUrl: (banner1ImageUrl != null
            ? banner1ImageUrl.value
            : this.banner1ImageUrl),
        banner1ImageFile: (banner1ImageFile != null
            ? banner1ImageFile.value
            : this.banner1ImageFile),
        banner1Title:
            (banner1Title != null ? banner1Title.value : this.banner1Title),
        banner1SubTitle: (banner1SubTitle != null
            ? banner1SubTitle.value
            : this.banner1SubTitle),
        banner1Description: (banner1Description != null
            ? banner1Description.value
            : this.banner1Description),
        banner1ButtonText: (banner1ButtonText != null
            ? banner1ButtonText.value
            : this.banner1ButtonText),
        banner1ButtonLink: (banner1ButtonLink != null
            ? banner1ButtonLink.value
            : this.banner1ButtonLink),
        banner2ImageUrl: (banner2ImageUrl != null
            ? banner2ImageUrl.value
            : this.banner2ImageUrl),
        banner2ImageFile: (banner2ImageFile != null
            ? banner2ImageFile.value
            : this.banner2ImageFile),
        banner2Title:
            (banner2Title != null ? banner2Title.value : this.banner2Title),
        banner2SubTitle: (banner2SubTitle != null
            ? banner2SubTitle.value
            : this.banner2SubTitle),
        banner2Description: (banner2Description != null
            ? banner2Description.value
            : this.banner2Description),
        banner2ButtonText: (banner2ButtonText != null
            ? banner2ButtonText.value
            : this.banner2ButtonText),
        banner2ButtonLink: (banner2ButtonLink != null
            ? banner2ButtonLink.value
            : this.banner2ButtonLink),
        banner3ImageUrl: (banner3ImageUrl != null
            ? banner3ImageUrl.value
            : this.banner3ImageUrl),
        banner3ImageFile: (banner3ImageFile != null
            ? banner3ImageFile.value
            : this.banner3ImageFile),
        banner3Title:
            (banner3Title != null ? banner3Title.value : this.banner3Title),
        banner3SubTitle: (banner3SubTitle != null
            ? banner3SubTitle.value
            : this.banner3SubTitle),
        banner3Description: (banner3Description != null
            ? banner3Description.value
            : this.banner3Description),
        banner3ButtonText: (banner3ButtonText != null
            ? banner3ButtonText.value
            : this.banner3ButtonText),
        banner3ButtonLink: (banner3ButtonLink != null
            ? banner3ButtonLink.value
            : this.banner3ButtonLink),
        id: (id != null ? id.value : this.id));
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
class ApiV1AdminIndexPost$RequestBody {
  const ApiV1AdminIndexPost$RequestBody({
    this.banner1ImageFile,
    this.banner2ImageFile,
    this.banner3ImageFile,
  });

  factory ApiV1AdminIndexPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$ApiV1AdminIndexPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1AdminIndexPost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1AdminIndexPost$RequestBodyToJson(this);

  @JsonKey(name: 'Banner1ImageFile', includeIfNull: false)
  final String? banner1ImageFile;
  @JsonKey(name: 'Banner2ImageFile', includeIfNull: false)
  final String? banner2ImageFile;
  @JsonKey(name: 'Banner3ImageFile', includeIfNull: false)
  final String? banner3ImageFile;
  static const fromJsonFactory = _$ApiV1AdminIndexPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiV1AdminIndexPost$RequestBody &&
            (identical(other.banner1ImageFile, banner1ImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.banner1ImageFile, banner1ImageFile)) &&
            (identical(other.banner2ImageFile, banner2ImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.banner2ImageFile, banner2ImageFile)) &&
            (identical(other.banner3ImageFile, banner3ImageFile) ||
                const DeepCollectionEquality()
                    .equals(other.banner3ImageFile, banner3ImageFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(banner1ImageFile) ^
      const DeepCollectionEquality().hash(banner2ImageFile) ^
      const DeepCollectionEquality().hash(banner3ImageFile) ^
      runtimeType.hashCode;
}

extension $ApiV1AdminIndexPost$RequestBodyExtension
    on ApiV1AdminIndexPost$RequestBody {
  ApiV1AdminIndexPost$RequestBody copyWith(
      {String? banner1ImageFile,
      String? banner2ImageFile,
      String? banner3ImageFile}) {
    return ApiV1AdminIndexPost$RequestBody(
        banner1ImageFile: banner1ImageFile ?? this.banner1ImageFile,
        banner2ImageFile: banner2ImageFile ?? this.banner2ImageFile,
        banner3ImageFile: banner3ImageFile ?? this.banner3ImageFile);
  }

  ApiV1AdminIndexPost$RequestBody copyWithWrapped(
      {Wrapped<String?>? banner1ImageFile,
      Wrapped<String?>? banner2ImageFile,
      Wrapped<String?>? banner3ImageFile}) {
    return ApiV1AdminIndexPost$RequestBody(
        banner1ImageFile: (banner1ImageFile != null
            ? banner1ImageFile.value
            : this.banner1ImageFile),
        banner2ImageFile: (banner2ImageFile != null
            ? banner2ImageFile.value
            : this.banner2ImageFile),
        banner3ImageFile: (banner3ImageFile != null
            ? banner3ImageFile.value
            : this.banner3ImageFile));
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

@JsonSerializable(explicitToJson: true)
class ApiV1BookAddPost$RequestBody {
  const ApiV1BookAddPost$RequestBody({
    this.imageFile,
    this.pdfFile,
  });

  factory ApiV1BookAddPost$RequestBody.fromJson(Map<String, dynamic> json) =>
      _$ApiV1BookAddPost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1BookAddPost$RequestBodyToJson;
  Map<String, dynamic> toJson() => _$ApiV1BookAddPost$RequestBodyToJson(this);

  @JsonKey(name: 'ImageFile', includeIfNull: false)
  final String? imageFile;
  @JsonKey(name: 'PdfFile', includeIfNull: false)
  final String? pdfFile;
  static const fromJsonFactory = _$ApiV1BookAddPost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiV1BookAddPost$RequestBody &&
            (identical(other.imageFile, imageFile) ||
                const DeepCollectionEquality()
                    .equals(other.imageFile, imageFile)) &&
            (identical(other.pdfFile, pdfFile) ||
                const DeepCollectionEquality().equals(other.pdfFile, pdfFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(pdfFile) ^
      runtimeType.hashCode;
}

extension $ApiV1BookAddPost$RequestBodyExtension
    on ApiV1BookAddPost$RequestBody {
  ApiV1BookAddPost$RequestBody copyWith({String? imageFile, String? pdfFile}) {
    return ApiV1BookAddPost$RequestBody(
        imageFile: imageFile ?? this.imageFile,
        pdfFile: pdfFile ?? this.pdfFile);
  }

  ApiV1BookAddPost$RequestBody copyWithWrapped(
      {Wrapped<String?>? imageFile, Wrapped<String?>? pdfFile}) {
    return ApiV1BookAddPost$RequestBody(
        imageFile: (imageFile != null ? imageFile.value : this.imageFile),
        pdfFile: (pdfFile != null ? pdfFile.value : this.pdfFile));
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
