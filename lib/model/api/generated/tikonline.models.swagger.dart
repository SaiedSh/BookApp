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
class AddBookReviewDto {
  const AddBookReviewDto({
    this.message,
    this.rate,
    this.bookId,
    this.userId,
    this.id,
  });

  factory AddBookReviewDto.fromJson(Map<String, dynamic> json) =>
      _$AddBookReviewDtoFromJson(json);

  static const toJsonFactory = _$AddBookReviewDtoToJson;
  Map<String, dynamic> toJson() => _$AddBookReviewDtoToJson(this);

  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  @JsonKey(name: 'rate', includeIfNull: false)
  final int? rate;
  @JsonKey(name: 'bookId', includeIfNull: false)
  final String? bookId;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$AddBookReviewDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is AddBookReviewDto &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)) &&
            (identical(other.bookId, bookId) ||
                const DeepCollectionEquality().equals(other.bookId, bookId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(rate) ^
      const DeepCollectionEquality().hash(bookId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $AddBookReviewDtoExtension on AddBookReviewDto {
  AddBookReviewDto copyWith(
      {String? message,
      int? rate,
      String? bookId,
      String? userId,
      String? id}) {
    return AddBookReviewDto(
        message: message ?? this.message,
        rate: rate ?? this.rate,
        bookId: bookId ?? this.bookId,
        userId: userId ?? this.userId,
        id: id ?? this.id);
  }

  AddBookReviewDto copyWithWrapped(
      {Wrapped<String?>? message,
      Wrapped<int?>? rate,
      Wrapped<String?>? bookId,
      Wrapped<String?>? userId,
      Wrapped<String?>? id}) {
    return AddBookReviewDto(
        message: (message != null ? message.value : this.message),
        rate: (rate != null ? rate.value : this.rate),
        bookId: (bookId != null ? bookId.value : this.bookId),
        userId: (userId != null ? userId.value : this.userId),
        id: (id != null ? id.value : this.id));
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
    this.niko,
    this.online,
    this.physical,
    this.discountPercentage,
    this.physicalLink,
    this.title,
    this.description,
    this.imageUrl,
    this.imageFile,
    this.pdfLink,
    this.pdfSize,
    this.pdfFile,
    this.like,
    this.read,
    this.shelf,
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
    this.categoryTitle,
    this.myReview,
    this.bookReviewss,
    this.id,
  });

  factory BookDto.fromJson(Map<String, dynamic> json) =>
      _$BookDtoFromJson(json);

  static const toJsonFactory = _$BookDtoToJson;
  Map<String, dynamic> toJson() => _$BookDtoToJson(this);

  @JsonKey(name: 'niko', includeIfNull: false)
  final bool? niko;
  @JsonKey(name: 'online', includeIfNull: false)
  final bool? online;
  @JsonKey(name: 'physical', includeIfNull: false)
  final bool? physical;
  @JsonKey(name: 'discountPercentage', includeIfNull: false)
  final int? discountPercentage;
  @JsonKey(name: 'physicalLink', includeIfNull: false)
  final String? physicalLink;
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
  @JsonKey(name: 'pdfSize', includeIfNull: false)
  final String? pdfSize;
  @JsonKey(name: 'pdfFile', includeIfNull: false)
  final String? pdfFile;
  @JsonKey(name: 'like', includeIfNull: false)
  final bool? like;
  @JsonKey(name: 'read', includeIfNull: false)
  final bool? read;
  @JsonKey(name: 'shelf', includeIfNull: false)
  final bool? shelf;
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
  @JsonKey(name: 'categoryTitle', includeIfNull: false)
  final String? categoryTitle;
  @JsonKey(name: 'myReview', includeIfNull: false)
  final BookReviewDto? myReview;
  @JsonKey(
      name: 'bookReviewss',
      includeIfNull: false,
      defaultValue: <BookReviewDto>[])
  final List<BookReviewDto>? bookReviewss;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$BookDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookDto &&
            (identical(other.niko, niko) ||
                const DeepCollectionEquality().equals(other.niko, niko)) &&
            (identical(other.online, online) ||
                const DeepCollectionEquality().equals(other.online, online)) &&
            (identical(other.physical, physical) ||
                const DeepCollectionEquality()
                    .equals(other.physical, physical)) &&
            (identical(other.discountPercentage, discountPercentage) ||
                const DeepCollectionEquality()
                    .equals(other.discountPercentage, discountPercentage)) &&
            (identical(other.physicalLink, physicalLink) ||
                const DeepCollectionEquality()
                    .equals(other.physicalLink, physicalLink)) &&
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
            (identical(other.pdfSize, pdfSize) ||
                const DeepCollectionEquality()
                    .equals(other.pdfSize, pdfSize)) &&
            (identical(other.pdfFile, pdfFile) ||
                const DeepCollectionEquality()
                    .equals(other.pdfFile, pdfFile)) &&
            (identical(other.like, like) ||
                const DeepCollectionEquality().equals(other.like, like)) &&
            (identical(other.read, read) ||
                const DeepCollectionEquality().equals(other.read, read)) &&
            (identical(other.shelf, shelf) ||
                const DeepCollectionEquality().equals(other.shelf, shelf)) &&
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
            (identical(other.categoryTitle, categoryTitle) ||
                const DeepCollectionEquality()
                    .equals(other.categoryTitle, categoryTitle)) &&
            (identical(other.myReview, myReview) || const DeepCollectionEquality().equals(other.myReview, myReview)) &&
            (identical(other.bookReviewss, bookReviewss) || const DeepCollectionEquality().equals(other.bookReviewss, bookReviewss)) &&
            (identical(other.id, id) || const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(niko) ^
      const DeepCollectionEquality().hash(online) ^
      const DeepCollectionEquality().hash(physical) ^
      const DeepCollectionEquality().hash(discountPercentage) ^
      const DeepCollectionEquality().hash(physicalLink) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(imageFile) ^
      const DeepCollectionEquality().hash(pdfLink) ^
      const DeepCollectionEquality().hash(pdfSize) ^
      const DeepCollectionEquality().hash(pdfFile) ^
      const DeepCollectionEquality().hash(like) ^
      const DeepCollectionEquality().hash(read) ^
      const DeepCollectionEquality().hash(shelf) ^
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
      const DeepCollectionEquality().hash(categoryTitle) ^
      const DeepCollectionEquality().hash(myReview) ^
      const DeepCollectionEquality().hash(bookReviewss) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $BookDtoExtension on BookDto {
  BookDto copyWith(
      {bool? niko,
      bool? online,
      bool? physical,
      int? discountPercentage,
      String? physicalLink,
      String? title,
      String? description,
      String? imageUrl,
      String? imageFile,
      String? pdfLink,
      String? pdfSize,
      String? pdfFile,
      bool? like,
      bool? read,
      bool? shelf,
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
      String? categoryTitle,
      BookReviewDto? myReview,
      List<BookReviewDto>? bookReviewss,
      String? id}) {
    return BookDto(
        niko: niko ?? this.niko,
        online: online ?? this.online,
        physical: physical ?? this.physical,
        discountPercentage: discountPercentage ?? this.discountPercentage,
        physicalLink: physicalLink ?? this.physicalLink,
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        imageFile: imageFile ?? this.imageFile,
        pdfLink: pdfLink ?? this.pdfLink,
        pdfSize: pdfSize ?? this.pdfSize,
        pdfFile: pdfFile ?? this.pdfFile,
        like: like ?? this.like,
        read: read ?? this.read,
        shelf: shelf ?? this.shelf,
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
        categoryTitle: categoryTitle ?? this.categoryTitle,
        myReview: myReview ?? this.myReview,
        bookReviewss: bookReviewss ?? this.bookReviewss,
        id: id ?? this.id);
  }

  BookDto copyWithWrapped(
      {Wrapped<bool?>? niko,
      Wrapped<bool?>? online,
      Wrapped<bool?>? physical,
      Wrapped<int?>? discountPercentage,
      Wrapped<String?>? physicalLink,
      Wrapped<String?>? title,
      Wrapped<String?>? description,
      Wrapped<String?>? imageUrl,
      Wrapped<String?>? imageFile,
      Wrapped<String?>? pdfLink,
      Wrapped<String?>? pdfSize,
      Wrapped<String?>? pdfFile,
      Wrapped<bool?>? like,
      Wrapped<bool?>? read,
      Wrapped<bool?>? shelf,
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
      Wrapped<String?>? categoryTitle,
      Wrapped<BookReviewDto?>? myReview,
      Wrapped<List<BookReviewDto>?>? bookReviewss,
      Wrapped<String?>? id}) {
    return BookDto(
        niko: (niko != null ? niko.value : this.niko),
        online: (online != null ? online.value : this.online),
        physical: (physical != null ? physical.value : this.physical),
        discountPercentage: (discountPercentage != null
            ? discountPercentage.value
            : this.discountPercentage),
        physicalLink:
            (physicalLink != null ? physicalLink.value : this.physicalLink),
        title: (title != null ? title.value : this.title),
        description:
            (description != null ? description.value : this.description),
        imageUrl: (imageUrl != null ? imageUrl.value : this.imageUrl),
        imageFile: (imageFile != null ? imageFile.value : this.imageFile),
        pdfLink: (pdfLink != null ? pdfLink.value : this.pdfLink),
        pdfSize: (pdfSize != null ? pdfSize.value : this.pdfSize),
        pdfFile: (pdfFile != null ? pdfFile.value : this.pdfFile),
        like: (like != null ? like.value : this.like),
        read: (read != null ? read.value : this.read),
        shelf: (shelf != null ? shelf.value : this.shelf),
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
        categoryTitle:
            (categoryTitle != null ? categoryTitle.value : this.categoryTitle),
        myReview: (myReview != null ? myReview.value : this.myReview),
        bookReviewss:
            (bookReviewss != null ? bookReviewss.value : this.bookReviewss),
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
class BookReviewDto {
  const BookReviewDto({
    this.message,
    this.rate,
    this.bookId,
    this.bookTitle,
    this.bookImageUrl,
    this.bookNevisande,
    this.bookEntesharat,
    this.bookMotarjem,
    this.bookSalEnteshar,
    this.bookPages,
    this.bookRating,
    this.bookPrice,
    this.bookDiscountPrice,
    this.bookViewCount,
    this.bookCategoryId,
    this.bookCategoryName,
    this.userId,
    this.userFirstName,
    this.userLastName,
    this.id,
  });

  factory BookReviewDto.fromJson(Map<String, dynamic> json) =>
      _$BookReviewDtoFromJson(json);

  static const toJsonFactory = _$BookReviewDtoToJson;
  Map<String, dynamic> toJson() => _$BookReviewDtoToJson(this);

  @JsonKey(name: 'message', includeIfNull: false)
  final String? message;
  @JsonKey(name: 'rate', includeIfNull: false)
  final int? rate;
  @JsonKey(name: 'bookId', includeIfNull: false)
  final String? bookId;
  @JsonKey(name: 'bookTitle', includeIfNull: false)
  final String? bookTitle;
  @JsonKey(name: 'bookImageUrl', includeIfNull: false)
  final String? bookImageUrl;
  @JsonKey(name: 'bookNevisande', includeIfNull: false)
  final String? bookNevisande;
  @JsonKey(name: 'bookEntesharat', includeIfNull: false)
  final String? bookEntesharat;
  @JsonKey(name: 'bookMotarjem', includeIfNull: false)
  final String? bookMotarjem;
  @JsonKey(name: 'bookSalEnteshar', includeIfNull: false)
  final String? bookSalEnteshar;
  @JsonKey(name: 'bookPages', includeIfNull: false)
  final int? bookPages;
  @JsonKey(name: 'bookRating', includeIfNull: false)
  final int? bookRating;
  @JsonKey(name: 'bookPrice', includeIfNull: false)
  final int? bookPrice;
  @JsonKey(name: 'bookDiscountPrice', includeIfNull: false)
  final int? bookDiscountPrice;
  @JsonKey(name: 'bookViewCount', includeIfNull: false)
  final int? bookViewCount;
  @JsonKey(name: 'bookCategoryId', includeIfNull: false)
  final String? bookCategoryId;
  @JsonKey(name: 'bookCategoryName', includeIfNull: false)
  final String? bookCategoryName;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(name: 'userFirstName', includeIfNull: false)
  final String? userFirstName;
  @JsonKey(name: 'userLastName', includeIfNull: false)
  final String? userLastName;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$BookReviewDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookReviewDto &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.rate, rate) ||
                const DeepCollectionEquality().equals(other.rate, rate)) &&
            (identical(other.bookId, bookId) ||
                const DeepCollectionEquality().equals(other.bookId, bookId)) &&
            (identical(other.bookTitle, bookTitle) ||
                const DeepCollectionEquality()
                    .equals(other.bookTitle, bookTitle)) &&
            (identical(other.bookImageUrl, bookImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.bookImageUrl, bookImageUrl)) &&
            (identical(other.bookNevisande, bookNevisande) ||
                const DeepCollectionEquality()
                    .equals(other.bookNevisande, bookNevisande)) &&
            (identical(other.bookEntesharat, bookEntesharat) ||
                const DeepCollectionEquality()
                    .equals(other.bookEntesharat, bookEntesharat)) &&
            (identical(other.bookMotarjem, bookMotarjem) ||
                const DeepCollectionEquality()
                    .equals(other.bookMotarjem, bookMotarjem)) &&
            (identical(other.bookSalEnteshar, bookSalEnteshar) ||
                const DeepCollectionEquality()
                    .equals(other.bookSalEnteshar, bookSalEnteshar)) &&
            (identical(other.bookPages, bookPages) ||
                const DeepCollectionEquality()
                    .equals(other.bookPages, bookPages)) &&
            (identical(other.bookRating, bookRating) ||
                const DeepCollectionEquality()
                    .equals(other.bookRating, bookRating)) &&
            (identical(other.bookPrice, bookPrice) ||
                const DeepCollectionEquality()
                    .equals(other.bookPrice, bookPrice)) &&
            (identical(other.bookDiscountPrice, bookDiscountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.bookDiscountPrice, bookDiscountPrice)) &&
            (identical(other.bookViewCount, bookViewCount) ||
                const DeepCollectionEquality()
                    .equals(other.bookViewCount, bookViewCount)) &&
            (identical(other.bookCategoryId, bookCategoryId) ||
                const DeepCollectionEquality()
                    .equals(other.bookCategoryId, bookCategoryId)) &&
            (identical(other.bookCategoryName, bookCategoryName) ||
                const DeepCollectionEquality()
                    .equals(other.bookCategoryName, bookCategoryName)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.userFirstName, userFirstName) ||
                const DeepCollectionEquality()
                    .equals(other.userFirstName, userFirstName)) &&
            (identical(other.userLastName, userLastName) ||
                const DeepCollectionEquality()
                    .equals(other.userLastName, userLastName)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(rate) ^
      const DeepCollectionEquality().hash(bookId) ^
      const DeepCollectionEquality().hash(bookTitle) ^
      const DeepCollectionEquality().hash(bookImageUrl) ^
      const DeepCollectionEquality().hash(bookNevisande) ^
      const DeepCollectionEquality().hash(bookEntesharat) ^
      const DeepCollectionEquality().hash(bookMotarjem) ^
      const DeepCollectionEquality().hash(bookSalEnteshar) ^
      const DeepCollectionEquality().hash(bookPages) ^
      const DeepCollectionEquality().hash(bookRating) ^
      const DeepCollectionEquality().hash(bookPrice) ^
      const DeepCollectionEquality().hash(bookDiscountPrice) ^
      const DeepCollectionEquality().hash(bookViewCount) ^
      const DeepCollectionEquality().hash(bookCategoryId) ^
      const DeepCollectionEquality().hash(bookCategoryName) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(userFirstName) ^
      const DeepCollectionEquality().hash(userLastName) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $BookReviewDtoExtension on BookReviewDto {
  BookReviewDto copyWith(
      {String? message,
      int? rate,
      String? bookId,
      String? bookTitle,
      String? bookImageUrl,
      String? bookNevisande,
      String? bookEntesharat,
      String? bookMotarjem,
      String? bookSalEnteshar,
      int? bookPages,
      int? bookRating,
      int? bookPrice,
      int? bookDiscountPrice,
      int? bookViewCount,
      String? bookCategoryId,
      String? bookCategoryName,
      String? userId,
      String? userFirstName,
      String? userLastName,
      String? id}) {
    return BookReviewDto(
        message: message ?? this.message,
        rate: rate ?? this.rate,
        bookId: bookId ?? this.bookId,
        bookTitle: bookTitle ?? this.bookTitle,
        bookImageUrl: bookImageUrl ?? this.bookImageUrl,
        bookNevisande: bookNevisande ?? this.bookNevisande,
        bookEntesharat: bookEntesharat ?? this.bookEntesharat,
        bookMotarjem: bookMotarjem ?? this.bookMotarjem,
        bookSalEnteshar: bookSalEnteshar ?? this.bookSalEnteshar,
        bookPages: bookPages ?? this.bookPages,
        bookRating: bookRating ?? this.bookRating,
        bookPrice: bookPrice ?? this.bookPrice,
        bookDiscountPrice: bookDiscountPrice ?? this.bookDiscountPrice,
        bookViewCount: bookViewCount ?? this.bookViewCount,
        bookCategoryId: bookCategoryId ?? this.bookCategoryId,
        bookCategoryName: bookCategoryName ?? this.bookCategoryName,
        userId: userId ?? this.userId,
        userFirstName: userFirstName ?? this.userFirstName,
        userLastName: userLastName ?? this.userLastName,
        id: id ?? this.id);
  }

  BookReviewDto copyWithWrapped(
      {Wrapped<String?>? message,
      Wrapped<int?>? rate,
      Wrapped<String?>? bookId,
      Wrapped<String?>? bookTitle,
      Wrapped<String?>? bookImageUrl,
      Wrapped<String?>? bookNevisande,
      Wrapped<String?>? bookEntesharat,
      Wrapped<String?>? bookMotarjem,
      Wrapped<String?>? bookSalEnteshar,
      Wrapped<int?>? bookPages,
      Wrapped<int?>? bookRating,
      Wrapped<int?>? bookPrice,
      Wrapped<int?>? bookDiscountPrice,
      Wrapped<int?>? bookViewCount,
      Wrapped<String?>? bookCategoryId,
      Wrapped<String?>? bookCategoryName,
      Wrapped<String?>? userId,
      Wrapped<String?>? userFirstName,
      Wrapped<String?>? userLastName,
      Wrapped<String?>? id}) {
    return BookReviewDto(
        message: (message != null ? message.value : this.message),
        rate: (rate != null ? rate.value : this.rate),
        bookId: (bookId != null ? bookId.value : this.bookId),
        bookTitle: (bookTitle != null ? bookTitle.value : this.bookTitle),
        bookImageUrl:
            (bookImageUrl != null ? bookImageUrl.value : this.bookImageUrl),
        bookNevisande:
            (bookNevisande != null ? bookNevisande.value : this.bookNevisande),
        bookEntesharat: (bookEntesharat != null
            ? bookEntesharat.value
            : this.bookEntesharat),
        bookMotarjem:
            (bookMotarjem != null ? bookMotarjem.value : this.bookMotarjem),
        bookSalEnteshar: (bookSalEnteshar != null
            ? bookSalEnteshar.value
            : this.bookSalEnteshar),
        bookPages: (bookPages != null ? bookPages.value : this.bookPages),
        bookRating: (bookRating != null ? bookRating.value : this.bookRating),
        bookPrice: (bookPrice != null ? bookPrice.value : this.bookPrice),
        bookDiscountPrice: (bookDiscountPrice != null
            ? bookDiscountPrice.value
            : this.bookDiscountPrice),
        bookViewCount:
            (bookViewCount != null ? bookViewCount.value : this.bookViewCount),
        bookCategoryId: (bookCategoryId != null
            ? bookCategoryId.value
            : this.bookCategoryId),
        bookCategoryName: (bookCategoryName != null
            ? bookCategoryName.value
            : this.bookCategoryName),
        userId: (userId != null ? userId.value : this.userId),
        userFirstName:
            (userFirstName != null ? userFirstName.value : this.userFirstName),
        userLastName:
            (userLastName != null ? userLastName.value : this.userLastName),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class BookReviewDtoListApiResult {
  const BookReviewDtoListApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory BookReviewDtoListApiResult.fromJson(Map<String, dynamic> json) =>
      _$BookReviewDtoListApiResultFromJson(json);

  static const toJsonFactory = _$BookReviewDtoListApiResultToJson;
  Map<String, dynamic> toJson() => _$BookReviewDtoListApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false, defaultValue: <BookReviewDto>[])
  final List<BookReviewDto>? data;
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
  static const fromJsonFactory = _$BookReviewDtoListApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is BookReviewDtoListApiResult &&
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

extension $BookReviewDtoListApiResultExtension on BookReviewDtoListApiResult {
  BookReviewDtoListApiResult copyWith(
      {List<BookReviewDto>? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return BookReviewDtoListApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  BookReviewDtoListApiResult copyWithWrapped(
      {Wrapped<List<BookReviewDto>?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return BookReviewDtoListApiResult(
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
class ExpertiseDto {
  const ExpertiseDto({
    this.name,
    this.id,
  });

  factory ExpertiseDto.fromJson(Map<String, dynamic> json) =>
      _$ExpertiseDtoFromJson(json);

  static const toJsonFactory = _$ExpertiseDtoToJson;
  Map<String, dynamic> toJson() => _$ExpertiseDtoToJson(this);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$ExpertiseDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ExpertiseDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $ExpertiseDtoExtension on ExpertiseDto {
  ExpertiseDto copyWith({String? name, String? id}) {
    return ExpertiseDto(name: name ?? this.name, id: id ?? this.id);
  }

  ExpertiseDto copyWithWrapped({Wrapped<String?>? name, Wrapped<String?>? id}) {
    return ExpertiseDto(
        name: (name != null ? name.value : this.name),
        id: (id != null ? id.value : this.id));
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
class PaymentTransactionsDto {
  const PaymentTransactionsDto({
    this.amount,
    this.description,
    this.refId,
    this.userId,
    this.id,
  });

  factory PaymentTransactionsDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentTransactionsDtoFromJson(json);

  static const toJsonFactory = _$PaymentTransactionsDtoToJson;
  Map<String, dynamic> toJson() => _$PaymentTransactionsDtoToJson(this);

  @JsonKey(name: 'amount', includeIfNull: false)
  final int? amount;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'refId', includeIfNull: false)
  final String? refId;
  @JsonKey(name: 'userId', includeIfNull: false)
  final String? userId;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$PaymentTransactionsDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PaymentTransactionsDto &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.refId, refId) ||
                const DeepCollectionEquality().equals(other.refId, refId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(refId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $PaymentTransactionsDtoExtension on PaymentTransactionsDto {
  PaymentTransactionsDto copyWith(
      {int? amount,
      String? description,
      String? refId,
      String? userId,
      String? id}) {
    return PaymentTransactionsDto(
        amount: amount ?? this.amount,
        description: description ?? this.description,
        refId: refId ?? this.refId,
        userId: userId ?? this.userId,
        id: id ?? this.id);
  }

  PaymentTransactionsDto copyWithWrapped(
      {Wrapped<int?>? amount,
      Wrapped<String?>? description,
      Wrapped<String?>? refId,
      Wrapped<String?>? userId,
      Wrapped<String?>? id}) {
    return PaymentTransactionsDto(
        amount: (amount != null ? amount.value : this.amount),
        description:
            (description != null ? description.value : this.description),
        refId: (refId != null ? refId.value : this.refId),
        userId: (userId != null ? userId.value : this.userId),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class PaymentTransactionsDtoListApiResult {
  const PaymentTransactionsDtoListApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory PaymentTransactionsDtoListApiResult.fromJson(
          Map<String, dynamic> json) =>
      _$PaymentTransactionsDtoListApiResultFromJson(json);

  static const toJsonFactory = _$PaymentTransactionsDtoListApiResultToJson;
  Map<String, dynamic> toJson() =>
      _$PaymentTransactionsDtoListApiResultToJson(this);

  @JsonKey(
      name: 'data',
      includeIfNull: false,
      defaultValue: <PaymentTransactionsDto>[])
  final List<PaymentTransactionsDto>? data;
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
  static const fromJsonFactory = _$PaymentTransactionsDtoListApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is PaymentTransactionsDtoListApiResult &&
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

extension $PaymentTransactionsDtoListApiResultExtension
    on PaymentTransactionsDtoListApiResult {
  PaymentTransactionsDtoListApiResult copyWith(
      {List<PaymentTransactionsDto>? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return PaymentTransactionsDtoListApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  PaymentTransactionsDtoListApiResult copyWithWrapped(
      {Wrapped<List<PaymentTransactionsDto>?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return PaymentTransactionsDtoListApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
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
class SubscriptionDto {
  const SubscriptionDto({
    this.name,
    this.duration,
    this.price,
    this.discountPrice,
    this.id,
  });

  factory SubscriptionDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDtoFromJson(json);

  static const toJsonFactory = _$SubscriptionDtoToJson;
  Map<String, dynamic> toJson() => _$SubscriptionDtoToJson(this);

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;
  @JsonKey(name: 'duration', includeIfNull: false)
  final int? duration;
  @JsonKey(name: 'price', includeIfNull: false)
  final int? price;
  @JsonKey(name: 'discountPrice', includeIfNull: false)
  final int? discountPrice;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$SubscriptionDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SubscriptionDto &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.price, price) ||
                const DeepCollectionEquality().equals(other.price, price)) &&
            (identical(other.discountPrice, discountPrice) ||
                const DeepCollectionEquality()
                    .equals(other.discountPrice, discountPrice)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(price) ^
      const DeepCollectionEquality().hash(discountPrice) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $SubscriptionDtoExtension on SubscriptionDto {
  SubscriptionDto copyWith(
      {String? name,
      int? duration,
      int? price,
      int? discountPrice,
      String? id}) {
    return SubscriptionDto(
        name: name ?? this.name,
        duration: duration ?? this.duration,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        id: id ?? this.id);
  }

  SubscriptionDto copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<int?>? duration,
      Wrapped<int?>? price,
      Wrapped<int?>? discountPrice,
      Wrapped<String?>? id}) {
    return SubscriptionDto(
        name: (name != null ? name.value : this.name),
        duration: (duration != null ? duration.value : this.duration),
        price: (price != null ? price.value : this.price),
        discountPrice:
            (discountPrice != null ? discountPrice.value : this.discountPrice),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class SubscriptionDtoListApiResult {
  const SubscriptionDtoListApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory SubscriptionDtoListApiResult.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDtoListApiResultFromJson(json);

  static const toJsonFactory = _$SubscriptionDtoListApiResultToJson;
  Map<String, dynamic> toJson() => _$SubscriptionDtoListApiResultToJson(this);

  @JsonKey(
      name: 'data', includeIfNull: false, defaultValue: <SubscriptionDto>[])
  final List<SubscriptionDto>? data;
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
  static const fromJsonFactory = _$SubscriptionDtoListApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SubscriptionDtoListApiResult &&
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

extension $SubscriptionDtoListApiResultExtension
    on SubscriptionDtoListApiResult {
  SubscriptionDtoListApiResult copyWith(
      {List<SubscriptionDto>? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return SubscriptionDtoListApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  SubscriptionDtoListApiResult copyWithWrapped(
      {Wrapped<List<SubscriptionDto>?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return SubscriptionDtoListApiResult(
        data: (data != null ? data.value : this.data),
        isSuccess: (isSuccess != null ? isSuccess.value : this.isSuccess),
        statusCode: (statusCode != null ? statusCode.value : this.statusCode),
        message: (message != null ? message.value : this.message));
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
class UserDto {
  const UserDto({
    this.sex,
    this.userName,
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.nationalCode,
    this.userAvatar,
    this.userBarcode,
    this.barcodeNumber,
    this.likedCategories,
    this.expertiseId,
    this.addUserRole,
    this.showUserRole,
    this.password,
    this.walletAmount,
    this.hasSub,
    this.subDueDate,
    this.subName,
    this.subPrice,
    this.isActive,
    this.expertises,
    this.categories,
    this.id,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  static const toJsonFactory = _$UserDtoToJson;
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @JsonKey(
    name: 'sex',
    includeIfNull: false,
    toJson: sexNullableToJson,
    fromJson: sexNullableFromJson,
  )
  final enums.Sex? sex;
  @JsonKey(name: 'userName', includeIfNull: false)
  final String? userName;
  @JsonKey(name: 'phoneNumber', includeIfNull: false)
  final String? phoneNumber;
  @JsonKey(name: 'firstName', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'lastName', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'nationalCode', includeIfNull: false)
  final String? nationalCode;
  @JsonKey(name: 'userAvatar', includeIfNull: false)
  final String? userAvatar;
  @JsonKey(name: 'userBarcode', includeIfNull: false)
  final String? userBarcode;
  @JsonKey(name: 'barcodeNumber', includeIfNull: false)
  final String? barcodeNumber;
  @JsonKey(name: 'likedCategories', includeIfNull: false)
  final String? likedCategories;
  @JsonKey(name: 'expertiseId', includeIfNull: false)
  final String? expertiseId;
  @JsonKey(
    name: 'addUserRole',
    includeIfNull: false,
    toJson: userRolesNullableToJson,
    fromJson: userRolesNullableFromJson,
  )
  final enums.UserRoles? addUserRole;
  @JsonKey(name: 'showUserRole', includeIfNull: false)
  final String? showUserRole;
  @JsonKey(name: 'password', includeIfNull: false)
  final String? password;
  @JsonKey(name: 'walletAmount', includeIfNull: false)
  final int? walletAmount;
  @JsonKey(name: 'hasSub', includeIfNull: false)
  final bool? hasSub;
  @JsonKey(name: 'subDueDate', includeIfNull: false)
  final DateTime? subDueDate;
  @JsonKey(name: 'subName', includeIfNull: false)
  final String? subName;
  @JsonKey(name: 'subPrice', includeIfNull: false)
  final int? subPrice;
  @JsonKey(name: 'isActive', includeIfNull: false)
  final bool? isActive;
  @JsonKey(
      name: 'expertises', includeIfNull: false, defaultValue: <ExpertiseDto>[])
  final List<ExpertiseDto>? expertises;
  @JsonKey(
      name: 'categories', includeIfNull: false, defaultValue: <CategoryDto>[])
  final List<CategoryDto>? categories;
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  static const fromJsonFactory = _$UserDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserDto &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.nationalCode, nationalCode) ||
                const DeepCollectionEquality()
                    .equals(other.nationalCode, nationalCode)) &&
            (identical(other.userAvatar, userAvatar) ||
                const DeepCollectionEquality()
                    .equals(other.userAvatar, userAvatar)) &&
            (identical(other.userBarcode, userBarcode) ||
                const DeepCollectionEquality()
                    .equals(other.userBarcode, userBarcode)) &&
            (identical(other.barcodeNumber, barcodeNumber) ||
                const DeepCollectionEquality()
                    .equals(other.barcodeNumber, barcodeNumber)) &&
            (identical(other.likedCategories, likedCategories) ||
                const DeepCollectionEquality()
                    .equals(other.likedCategories, likedCategories)) &&
            (identical(other.expertiseId, expertiseId) ||
                const DeepCollectionEquality()
                    .equals(other.expertiseId, expertiseId)) &&
            (identical(other.addUserRole, addUserRole) ||
                const DeepCollectionEquality()
                    .equals(other.addUserRole, addUserRole)) &&
            (identical(other.showUserRole, showUserRole) ||
                const DeepCollectionEquality()
                    .equals(other.showUserRole, showUserRole)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.walletAmount, walletAmount) ||
                const DeepCollectionEquality()
                    .equals(other.walletAmount, walletAmount)) &&
            (identical(other.hasSub, hasSub) ||
                const DeepCollectionEquality().equals(other.hasSub, hasSub)) &&
            (identical(other.subDueDate, subDueDate) ||
                const DeepCollectionEquality()
                    .equals(other.subDueDate, subDueDate)) &&
            (identical(other.subName, subName) ||
                const DeepCollectionEquality()
                    .equals(other.subName, subName)) &&
            (identical(other.subPrice, subPrice) ||
                const DeepCollectionEquality()
                    .equals(other.subPrice, subPrice)) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality()
                    .equals(other.isActive, isActive)) &&
            (identical(other.expertises, expertises) ||
                const DeepCollectionEquality()
                    .equals(other.expertises, expertises)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(nationalCode) ^
      const DeepCollectionEquality().hash(userAvatar) ^
      const DeepCollectionEquality().hash(userBarcode) ^
      const DeepCollectionEquality().hash(barcodeNumber) ^
      const DeepCollectionEquality().hash(likedCategories) ^
      const DeepCollectionEquality().hash(expertiseId) ^
      const DeepCollectionEquality().hash(addUserRole) ^
      const DeepCollectionEquality().hash(showUserRole) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(walletAmount) ^
      const DeepCollectionEquality().hash(hasSub) ^
      const DeepCollectionEquality().hash(subDueDate) ^
      const DeepCollectionEquality().hash(subName) ^
      const DeepCollectionEquality().hash(subPrice) ^
      const DeepCollectionEquality().hash(isActive) ^
      const DeepCollectionEquality().hash(expertises) ^
      const DeepCollectionEquality().hash(categories) ^
      const DeepCollectionEquality().hash(id) ^
      runtimeType.hashCode;
}

extension $UserDtoExtension on UserDto {
  UserDto copyWith(
      {enums.Sex? sex,
      String? userName,
      String? phoneNumber,
      String? firstName,
      String? lastName,
      String? nationalCode,
      String? userAvatar,
      String? userBarcode,
      String? barcodeNumber,
      String? likedCategories,
      String? expertiseId,
      enums.UserRoles? addUserRole,
      String? showUserRole,
      String? password,
      int? walletAmount,
      bool? hasSub,
      DateTime? subDueDate,
      String? subName,
      int? subPrice,
      bool? isActive,
      List<ExpertiseDto>? expertises,
      List<CategoryDto>? categories,
      String? id}) {
    return UserDto(
        sex: sex ?? this.sex,
        userName: userName ?? this.userName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        nationalCode: nationalCode ?? this.nationalCode,
        userAvatar: userAvatar ?? this.userAvatar,
        userBarcode: userBarcode ?? this.userBarcode,
        barcodeNumber: barcodeNumber ?? this.barcodeNumber,
        likedCategories: likedCategories ?? this.likedCategories,
        expertiseId: expertiseId ?? this.expertiseId,
        addUserRole: addUserRole ?? this.addUserRole,
        showUserRole: showUserRole ?? this.showUserRole,
        password: password ?? this.password,
        walletAmount: walletAmount ?? this.walletAmount,
        hasSub: hasSub ?? this.hasSub,
        subDueDate: subDueDate ?? this.subDueDate,
        subName: subName ?? this.subName,
        subPrice: subPrice ?? this.subPrice,
        isActive: isActive ?? this.isActive,
        expertises: expertises ?? this.expertises,
        categories: categories ?? this.categories,
        id: id ?? this.id);
  }

  UserDto copyWithWrapped(
      {Wrapped<enums.Sex?>? sex,
      Wrapped<String?>? userName,
      Wrapped<String?>? phoneNumber,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName,
      Wrapped<String?>? nationalCode,
      Wrapped<String?>? userAvatar,
      Wrapped<String?>? userBarcode,
      Wrapped<String?>? barcodeNumber,
      Wrapped<String?>? likedCategories,
      Wrapped<String?>? expertiseId,
      Wrapped<enums.UserRoles?>? addUserRole,
      Wrapped<String?>? showUserRole,
      Wrapped<String?>? password,
      Wrapped<int?>? walletAmount,
      Wrapped<bool?>? hasSub,
      Wrapped<DateTime?>? subDueDate,
      Wrapped<String?>? subName,
      Wrapped<int?>? subPrice,
      Wrapped<bool?>? isActive,
      Wrapped<List<ExpertiseDto>?>? expertises,
      Wrapped<List<CategoryDto>?>? categories,
      Wrapped<String?>? id}) {
    return UserDto(
        sex: (sex != null ? sex.value : this.sex),
        userName: (userName != null ? userName.value : this.userName),
        phoneNumber:
            (phoneNumber != null ? phoneNumber.value : this.phoneNumber),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName),
        nationalCode:
            (nationalCode != null ? nationalCode.value : this.nationalCode),
        userAvatar: (userAvatar != null ? userAvatar.value : this.userAvatar),
        userBarcode:
            (userBarcode != null ? userBarcode.value : this.userBarcode),
        barcodeNumber:
            (barcodeNumber != null ? barcodeNumber.value : this.barcodeNumber),
        likedCategories: (likedCategories != null
            ? likedCategories.value
            : this.likedCategories),
        expertiseId:
            (expertiseId != null ? expertiseId.value : this.expertiseId),
        addUserRole:
            (addUserRole != null ? addUserRole.value : this.addUserRole),
        showUserRole:
            (showUserRole != null ? showUserRole.value : this.showUserRole),
        password: (password != null ? password.value : this.password),
        walletAmount:
            (walletAmount != null ? walletAmount.value : this.walletAmount),
        hasSub: (hasSub != null ? hasSub.value : this.hasSub),
        subDueDate: (subDueDate != null ? subDueDate.value : this.subDueDate),
        subName: (subName != null ? subName.value : this.subName),
        subPrice: (subPrice != null ? subPrice.value : this.subPrice),
        isActive: (isActive != null ? isActive.value : this.isActive),
        expertises: (expertises != null ? expertises.value : this.expertises),
        categories: (categories != null ? categories.value : this.categories),
        id: (id != null ? id.value : this.id));
  }
}

@JsonSerializable(explicitToJson: true)
class UserDtoApiResult {
  const UserDtoApiResult({
    this.data,
    this.isSuccess,
    this.statusCode,
    this.message,
  });

  factory UserDtoApiResult.fromJson(Map<String, dynamic> json) =>
      _$UserDtoApiResultFromJson(json);

  static const toJsonFactory = _$UserDtoApiResultToJson;
  Map<String, dynamic> toJson() => _$UserDtoApiResultToJson(this);

  @JsonKey(name: 'data', includeIfNull: false)
  final UserDto? data;
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
  static const fromJsonFactory = _$UserDtoApiResultFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is UserDtoApiResult &&
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

extension $UserDtoApiResultExtension on UserDtoApiResult {
  UserDtoApiResult copyWith(
      {UserDto? data,
      bool? isSuccess,
      enums.ApiResultStatusCode? statusCode,
      String? message}) {
    return UserDtoApiResult(
        data: data ?? this.data,
        isSuccess: isSuccess ?? this.isSuccess,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message);
  }

  UserDtoApiResult copyWithWrapped(
      {Wrapped<UserDto?>? data,
      Wrapped<bool?>? isSuccess,
      Wrapped<enums.ApiResultStatusCode?>? statusCode,
      Wrapped<String?>? message}) {
    return UserDtoApiResult(
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

@JsonSerializable(explicitToJson: true)
class ApiV1UserUpdateProfilePost$RequestBody {
  const ApiV1UserUpdateProfilePost$RequestBody({
    this.userAvatarFile,
  });

  factory ApiV1UserUpdateProfilePost$RequestBody.fromJson(
          Map<String, dynamic> json) =>
      _$ApiV1UserUpdateProfilePost$RequestBodyFromJson(json);

  static const toJsonFactory = _$ApiV1UserUpdateProfilePost$RequestBodyToJson;
  Map<String, dynamic> toJson() =>
      _$ApiV1UserUpdateProfilePost$RequestBodyToJson(this);

  @JsonKey(name: 'UserAvatarFile', includeIfNull: false)
  final String? userAvatarFile;
  static const fromJsonFactory =
      _$ApiV1UserUpdateProfilePost$RequestBodyFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ApiV1UserUpdateProfilePost$RequestBody &&
            (identical(other.userAvatarFile, userAvatarFile) ||
                const DeepCollectionEquality()
                    .equals(other.userAvatarFile, userAvatarFile)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(userAvatarFile) ^
      runtimeType.hashCode;
}

extension $ApiV1UserUpdateProfilePost$RequestBodyExtension
    on ApiV1UserUpdateProfilePost$RequestBody {
  ApiV1UserUpdateProfilePost$RequestBody copyWith({String? userAvatarFile}) {
    return ApiV1UserUpdateProfilePost$RequestBody(
        userAvatarFile: userAvatarFile ?? this.userAvatarFile);
  }

  ApiV1UserUpdateProfilePost$RequestBody copyWithWrapped(
      {Wrapped<String?>? userAvatarFile}) {
    return ApiV1UserUpdateProfilePost$RequestBody(
        userAvatarFile: (userAvatarFile != null
            ? userAvatarFile.value
            : this.userAvatarFile));
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

String? saveTypeNullableToJson(enums.SaveType? saveType) {
  return saveType?.value;
}

String? saveTypeToJson(enums.SaveType saveType) {
  return saveType.value;
}

enums.SaveType saveTypeFromJson(
  Object? saveType, [
  enums.SaveType? defaultValue,
]) {
  return enums.SaveType.values.firstWhereOrNull((e) => e.value == saveType) ??
      defaultValue ??
      enums.SaveType.swaggerGeneratedUnknown;
}

enums.SaveType? saveTypeNullableFromJson(
  Object? saveType, [
  enums.SaveType? defaultValue,
]) {
  if (saveType == null) {
    return null;
  }
  return enums.SaveType.values.firstWhereOrNull((e) => e.value == saveType) ??
      defaultValue;
}

String saveTypeExplodedListToJson(List<enums.SaveType>? saveType) {
  return saveType?.map((e) => e.value!).join(',') ?? '';
}

List<String> saveTypeListToJson(List<enums.SaveType>? saveType) {
  if (saveType == null) {
    return [];
  }

  return saveType.map((e) => e.value!).toList();
}

List<enums.SaveType> saveTypeListFromJson(
  List? saveType, [
  List<enums.SaveType>? defaultValue,
]) {
  if (saveType == null) {
    return defaultValue ?? [];
  }

  return saveType.map((e) => saveTypeFromJson(e.toString())).toList();
}

List<enums.SaveType>? saveTypeNullableListFromJson(
  List? saveType, [
  List<enums.SaveType>? defaultValue,
]) {
  if (saveType == null) {
    return defaultValue;
  }

  return saveType.map((e) => saveTypeFromJson(e.toString())).toList();
}

String? sexNullableToJson(enums.Sex? sex) {
  return sex?.value;
}

String? sexToJson(enums.Sex sex) {
  return sex.value;
}

enums.Sex sexFromJson(
  Object? sex, [
  enums.Sex? defaultValue,
]) {
  return enums.Sex.values.firstWhereOrNull((e) => e.value == sex) ??
      defaultValue ??
      enums.Sex.swaggerGeneratedUnknown;
}

enums.Sex? sexNullableFromJson(
  Object? sex, [
  enums.Sex? defaultValue,
]) {
  if (sex == null) {
    return null;
  }
  return enums.Sex.values.firstWhereOrNull((e) => e.value == sex) ??
      defaultValue;
}

String sexExplodedListToJson(List<enums.Sex>? sex) {
  return sex?.map((e) => e.value!).join(',') ?? '';
}

List<String> sexListToJson(List<enums.Sex>? sex) {
  if (sex == null) {
    return [];
  }

  return sex.map((e) => e.value!).toList();
}

List<enums.Sex> sexListFromJson(
  List? sex, [
  List<enums.Sex>? defaultValue,
]) {
  if (sex == null) {
    return defaultValue ?? [];
  }

  return sex.map((e) => sexFromJson(e.toString())).toList();
}

List<enums.Sex>? sexNullableListFromJson(
  List? sex, [
  List<enums.Sex>? defaultValue,
]) {
  if (sex == null) {
    return defaultValue;
  }

  return sex.map((e) => sexFromJson(e.toString())).toList();
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
