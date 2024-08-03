// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tikonline.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => AccessToken(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      role: userRolesNullableFromJson(json['role']),
    );

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('access_token', instance.accessToken);
  writeNotNull('refresh_token', instance.refreshToken);
  writeNotNull('token_type', instance.tokenType);
  writeNotNull('expires_in', instance.expiresIn);
  writeNotNull('role', userRolesNullableToJson(instance.role));
  return val;
}

ApiResult _$ApiResultFromJson(Map<String, dynamic> json) => ApiResult(
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ApiResultToJson(ApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull(
      'statusCode', apiResultStatusCodeNullableToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

BookDto _$BookDtoFromJson(Map<String, dynamic> json) => BookDto(
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      nevisande: json['nevisande'] as String?,
      entesharat: json['entesharat'] as String?,
      motarjem: json['motarjem'] as String?,
      salEnteshar: json['salEnteshar'] as String?,
      pages: (json['pages'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BookDtoToJson(BookDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('imageUrl', instance.imageUrl);
  writeNotNull('nevisande', instance.nevisande);
  writeNotNull('entesharat', instance.entesharat);
  writeNotNull('motarjem', instance.motarjem);
  writeNotNull('salEnteshar', instance.salEnteshar);
  writeNotNull('pages', instance.pages);
  writeNotNull('rating', instance.rating);
  writeNotNull('price', instance.price);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('categoryName', instance.categoryName);
  writeNotNull('id', instance.id);
  return val;
}

BookDtoListApiResult _$BookDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    BookDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => BookDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BookDtoListApiResultToJson(
    BookDtoListApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull(
      'statusCode', apiResultStatusCodeNullableToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
      title: json['title'] as String?,
      motherId: json['motherId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('motherId', instance.motherId);
  writeNotNull('id', instance.id);
  return val;
}

CategoryDtoListApiResult _$CategoryDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    CategoryDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CategoryDtoListApiResultToJson(
    CategoryDtoListApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull(
      'statusCode', apiResultStatusCodeNullableToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

DashboardDto _$DashboardDtoFromJson(Map<String, dynamic> json) => DashboardDto(
      allUsers: (json['allUsers'] as num?)?.toInt(),
      foodScans: (json['foodScans'] as num?)?.toInt(),
      giftScans: (json['giftScans'] as num?)?.toInt(),
      presences: (json['presences'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DashboardDtoToJson(DashboardDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('allUsers', instance.allUsers);
  writeNotNull('foodScans', instance.foodScans);
  writeNotNull('giftScans', instance.giftScans);
  writeNotNull('presences', instance.presences);
  return val;
}

DashboardDtoApiResult _$DashboardDtoApiResultFromJson(
        Map<String, dynamic> json) =>
    DashboardDtoApiResult(
      data: json['data'] == null
          ? null
          : DashboardDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DashboardDtoApiResultToJson(
    DashboardDtoApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull(
      'statusCode', apiResultStatusCodeNullableToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) => LoginDto(
      userName: json['userName'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userName', instance.userName);
  writeNotNull('password', instance.password);
  return val;
}

TempUserDto _$TempUserDtoFromJson(Map<String, dynamic> json) => TempUserDto(
      phoneNumber: json['phoneNumber'] as String,
      otp: json['otp'] as String?,
      fname: json['fname'] as String?,
      lname: json['lname'] as String?,
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      exist: json['exist'] as bool?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$TempUserDtoToJson(TempUserDto instance) {
  final val = <String, dynamic>{
    'phoneNumber': instance.phoneNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('otp', instance.otp);
  writeNotNull('fname', instance.fname);
  writeNotNull('lname', instance.lname);
  writeNotNull('creationDate', instance.creationDate?.toIso8601String());
  writeNotNull('exist', instance.exist);
  writeNotNull('id', instance.id);
  return val;
}

TempUserDtoApiResult _$TempUserDtoApiResultFromJson(
        Map<String, dynamic> json) =>
    TempUserDtoApiResult(
      data: json['data'] == null
          ? null
          : TempUserDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$TempUserDtoApiResultToJson(
    TempUserDtoApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull(
      'statusCode', apiResultStatusCodeNullableToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

ApiV1AuthenticationFreeTokenPost$RequestBody
    _$ApiV1AuthenticationFreeTokenPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1AuthenticationFreeTokenPost$RequestBody(
          grantType: json['grant_type'] as String?,
          username: json['username'] as String?,
          password: json['password'] as String?,
          refreshToken: json['refresh_token'] as String?,
          scope: json['scope'] as String?,
          clientId: json['client_id'] as String?,
          clientSecret: json['client_secret'] as String?,
        );

Map<String, dynamic> _$ApiV1AuthenticationFreeTokenPost$RequestBodyToJson(
    ApiV1AuthenticationFreeTokenPost$RequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grant_type', instance.grantType);
  writeNotNull('username', instance.username);
  writeNotNull('password', instance.password);
  writeNotNull('refresh_token', instance.refreshToken);
  writeNotNull('scope', instance.scope);
  writeNotNull('client_id', instance.clientId);
  writeNotNull('client_secret', instance.clientSecret);
  return val;
}
