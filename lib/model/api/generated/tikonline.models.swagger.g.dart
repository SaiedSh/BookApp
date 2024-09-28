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

AddBookReviewDto _$AddBookReviewDtoFromJson(Map<String, dynamic> json) =>
    AddBookReviewDto(
      message: json['message'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
      bookId: json['bookId'] as String?,
      userId: json['userId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AddBookReviewDtoToJson(AddBookReviewDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('rate', instance.rate);
  writeNotNull('bookId', instance.bookId);
  writeNotNull('userId', instance.userId);
  writeNotNull('id', instance.id);
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
      niko: json['niko'] as bool?,
      online: json['online'] as bool?,
      physical: json['physical'] as bool?,
      discountPercentage: (json['discountPercentage'] as num?)?.toInt(),
      physicalLink: json['physicalLink'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      imageFile: json['imageFile'] as String?,
      pdfLink: json['pdfLink'] as String?,
      pdfSize: json['pdfSize'] as String?,
      pdfFile: json['pdfFile'] as String?,
      like: json['like'] as bool?,
      read: json['read'] as bool?,
      shelf: json['shelf'] as bool?,
      nevisande: json['nevisande'] as String?,
      entesharat: json['entesharat'] as String?,
      motarjem: json['motarjem'] as String?,
      salEnteshar: json['salEnteshar'] as String?,
      pages: (json['pages'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      discountPrice: (json['discountPrice'] as num?)?.toInt(),
      viewCount: (json['viewCount'] as num?)?.toInt(),
      categoryId: json['categoryId'] as String?,
      categoryTitle: json['categoryTitle'] as String?,
      myReview: json['myReview'] == null
          ? null
          : BookReviewDto.fromJson(json['myReview'] as Map<String, dynamic>),
      bookReviewss: (json['bookReviewss'] as List<dynamic>?)
              ?.map((e) => BookReviewDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BookDtoToJson(BookDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('niko', instance.niko);
  writeNotNull('online', instance.online);
  writeNotNull('physical', instance.physical);
  writeNotNull('discountPercentage', instance.discountPercentage);
  writeNotNull('physicalLink', instance.physicalLink);
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('imageUrl', instance.imageUrl);
  writeNotNull('imageFile', instance.imageFile);
  writeNotNull('pdfLink', instance.pdfLink);
  writeNotNull('pdfSize', instance.pdfSize);
  writeNotNull('pdfFile', instance.pdfFile);
  writeNotNull('like', instance.like);
  writeNotNull('read', instance.read);
  writeNotNull('shelf', instance.shelf);
  writeNotNull('nevisande', instance.nevisande);
  writeNotNull('entesharat', instance.entesharat);
  writeNotNull('motarjem', instance.motarjem);
  writeNotNull('salEnteshar', instance.salEnteshar);
  writeNotNull('pages', instance.pages);
  writeNotNull('rating', instance.rating);
  writeNotNull('price', instance.price);
  writeNotNull('discountPrice', instance.discountPrice);
  writeNotNull('viewCount', instance.viewCount);
  writeNotNull('categoryId', instance.categoryId);
  writeNotNull('categoryTitle', instance.categoryTitle);
  writeNotNull('myReview', instance.myReview?.toJson());
  writeNotNull(
      'bookReviewss', instance.bookReviewss?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id);
  return val;
}

BookDtoApiResult _$BookDtoApiResultFromJson(Map<String, dynamic> json) =>
    BookDtoApiResult(
      data: json['data'] == null
          ? null
          : BookDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BookDtoApiResultToJson(BookDtoApiResult instance) {
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

BookReviewDto _$BookReviewDtoFromJson(Map<String, dynamic> json) =>
    BookReviewDto(
      message: json['message'] as String?,
      rate: (json['rate'] as num?)?.toInt(),
      bookId: json['bookId'] as String?,
      bookTitle: json['bookTitle'] as String?,
      bookImageUrl: json['bookImageUrl'] as String?,
      bookNevisande: json['bookNevisande'] as String?,
      bookEntesharat: json['bookEntesharat'] as String?,
      bookMotarjem: json['bookMotarjem'] as String?,
      bookSalEnteshar: json['bookSalEnteshar'] as String?,
      bookPages: (json['bookPages'] as num?)?.toInt(),
      bookRating: (json['bookRating'] as num?)?.toInt(),
      bookPrice: (json['bookPrice'] as num?)?.toInt(),
      bookDiscountPrice: (json['bookDiscountPrice'] as num?)?.toInt(),
      bookViewCount: (json['bookViewCount'] as num?)?.toInt(),
      bookCategoryId: json['bookCategoryId'] as String?,
      bookCategoryName: json['bookCategoryName'] as String?,
      userId: json['userId'] as String?,
      userFirstName: json['userFirstName'] as String?,
      userLastName: json['userLastName'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BookReviewDtoToJson(BookReviewDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('rate', instance.rate);
  writeNotNull('bookId', instance.bookId);
  writeNotNull('bookTitle', instance.bookTitle);
  writeNotNull('bookImageUrl', instance.bookImageUrl);
  writeNotNull('bookNevisande', instance.bookNevisande);
  writeNotNull('bookEntesharat', instance.bookEntesharat);
  writeNotNull('bookMotarjem', instance.bookMotarjem);
  writeNotNull('bookSalEnteshar', instance.bookSalEnteshar);
  writeNotNull('bookPages', instance.bookPages);
  writeNotNull('bookRating', instance.bookRating);
  writeNotNull('bookPrice', instance.bookPrice);
  writeNotNull('bookDiscountPrice', instance.bookDiscountPrice);
  writeNotNull('bookViewCount', instance.bookViewCount);
  writeNotNull('bookCategoryId', instance.bookCategoryId);
  writeNotNull('bookCategoryName', instance.bookCategoryName);
  writeNotNull('userId', instance.userId);
  writeNotNull('userFirstName', instance.userFirstName);
  writeNotNull('userLastName', instance.userLastName);
  writeNotNull('id', instance.id);
  return val;
}

BookReviewDtoListApiResult _$BookReviewDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    BookReviewDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => BookReviewDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BookReviewDtoListApiResultToJson(
    BookReviewDtoListApiResult instance) {
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

ExpertiseDto _$ExpertiseDtoFromJson(Map<String, dynamic> json) => ExpertiseDto(
      name: json['name'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ExpertiseDtoToJson(ExpertiseDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('id', instance.id);
  return val;
}

IndexDto _$IndexDtoFromJson(Map<String, dynamic> json) => IndexDto(
      discountBooks: (json['discountBooks'] as List<dynamic>?)
              ?.map((e) => BookDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      freeBooks: (json['freeBooks'] as List<dynamic>?)
              ?.map((e) => BookDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      mostViewedBooks: (json['mostViewedBooks'] as List<dynamic>?)
              ?.map((e) => BookDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      indexInfo: json['indexInfo'] == null
          ? null
          : SettingDto.fromJson(json['indexInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IndexDtoToJson(IndexDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'discountBooks', instance.discountBooks?.map((e) => e.toJson()).toList());
  writeNotNull(
      'freeBooks', instance.freeBooks?.map((e) => e.toJson()).toList());
  writeNotNull('mostViewedBooks',
      instance.mostViewedBooks?.map((e) => e.toJson()).toList());
  writeNotNull('indexInfo', instance.indexInfo?.toJson());
  return val;
}

IndexDtoApiResult _$IndexDtoApiResultFromJson(Map<String, dynamic> json) =>
    IndexDtoApiResult(
      data: json['data'] == null
          ? null
          : IndexDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$IndexDtoApiResultToJson(IndexDtoApiResult instance) {
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

PaymentTransactionsDto _$PaymentTransactionsDtoFromJson(
        Map<String, dynamic> json) =>
    PaymentTransactionsDto(
      amount: (json['amount'] as num?)?.toInt(),
      description: json['description'] as String?,
      refId: json['refId'] as String?,
      userId: json['userId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$PaymentTransactionsDtoToJson(
    PaymentTransactionsDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.amount);
  writeNotNull('description', instance.description);
  writeNotNull('refId', instance.refId);
  writeNotNull('userId', instance.userId);
  writeNotNull('id', instance.id);
  return val;
}

PaymentTransactionsDtoListApiResult
    _$PaymentTransactionsDtoListApiResultFromJson(Map<String, dynamic> json) =>
        PaymentTransactionsDtoListApiResult(
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) => PaymentTransactionsDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [],
          isSuccess: json['isSuccess'] as bool?,
          statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
          message: json['message'] as String?,
        );

Map<String, dynamic> _$PaymentTransactionsDtoListApiResultToJson(
    PaymentTransactionsDtoListApiResult instance) {
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

SettingDto _$SettingDtoFromJson(Map<String, dynamic> json) => SettingDto(
      banner1ImageUrl: json['banner1ImageUrl'] as String?,
      banner1ImageFile: json['banner1ImageFile'] as String?,
      banner1Title: json['banner1Title'] as String?,
      banner1SubTitle: json['banner1SubTitle'] as String?,
      banner1Description: json['banner1Description'] as String?,
      banner1ButtonText: json['banner1ButtonText'] as String?,
      banner1ButtonLink: json['banner1ButtonLink'] as String?,
      banner2ImageUrl: json['banner2ImageUrl'] as String?,
      banner2ImageFile: json['banner2ImageFile'] as String?,
      banner2Title: json['banner2Title'] as String?,
      banner2SubTitle: json['banner2SubTitle'] as String?,
      banner2Description: json['banner2Description'] as String?,
      banner2ButtonText: json['banner2ButtonText'] as String?,
      banner2ButtonLink: json['banner2ButtonLink'] as String?,
      banner3ImageUrl: json['banner3ImageUrl'] as String?,
      banner3ImageFile: json['banner3ImageFile'] as String?,
      banner3Title: json['banner3Title'] as String?,
      banner3SubTitle: json['banner3SubTitle'] as String?,
      banner3Description: json['banner3Description'] as String?,
      banner3ButtonText: json['banner3ButtonText'] as String?,
      banner3ButtonLink: json['banner3ButtonLink'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SettingDtoToJson(SettingDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('banner1ImageUrl', instance.banner1ImageUrl);
  writeNotNull('banner1ImageFile', instance.banner1ImageFile);
  writeNotNull('banner1Title', instance.banner1Title);
  writeNotNull('banner1SubTitle', instance.banner1SubTitle);
  writeNotNull('banner1Description', instance.banner1Description);
  writeNotNull('banner1ButtonText', instance.banner1ButtonText);
  writeNotNull('banner1ButtonLink', instance.banner1ButtonLink);
  writeNotNull('banner2ImageUrl', instance.banner2ImageUrl);
  writeNotNull('banner2ImageFile', instance.banner2ImageFile);
  writeNotNull('banner2Title', instance.banner2Title);
  writeNotNull('banner2SubTitle', instance.banner2SubTitle);
  writeNotNull('banner2Description', instance.banner2Description);
  writeNotNull('banner2ButtonText', instance.banner2ButtonText);
  writeNotNull('banner2ButtonLink', instance.banner2ButtonLink);
  writeNotNull('banner3ImageUrl', instance.banner3ImageUrl);
  writeNotNull('banner3ImageFile', instance.banner3ImageFile);
  writeNotNull('banner3Title', instance.banner3Title);
  writeNotNull('banner3SubTitle', instance.banner3SubTitle);
  writeNotNull('banner3Description', instance.banner3Description);
  writeNotNull('banner3ButtonText', instance.banner3ButtonText);
  writeNotNull('banner3ButtonLink', instance.banner3ButtonLink);
  writeNotNull('id', instance.id);
  return val;
}

SubscriptionDto _$SubscriptionDtoFromJson(Map<String, dynamic> json) =>
    SubscriptionDto(
      name: json['name'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      discountPrice: (json['discountPrice'] as num?)?.toInt(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SubscriptionDtoToJson(SubscriptionDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('duration', instance.duration);
  writeNotNull('price', instance.price);
  writeNotNull('discountPrice', instance.discountPrice);
  writeNotNull('id', instance.id);
  return val;
}

SubscriptionDtoListApiResult _$SubscriptionDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    SubscriptionDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => SubscriptionDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SubscriptionDtoListApiResultToJson(
    SubscriptionDtoListApiResult instance) {
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

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      sex: sexNullableFromJson(json['sex']),
      userName: json['userName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      nationalCode: json['nationalCode'] as String?,
      userAvatar: json['userAvatar'] as String?,
      userBarcode: json['userBarcode'] as String?,
      barcodeNumber: json['barcodeNumber'] as String?,
      likedCategories: json['likedCategories'] as String?,
      expertiseId: json['expertiseId'] as String?,
      addUserRole: userRolesNullableFromJson(json['addUserRole']),
      showUserRole: json['showUserRole'] as String?,
      password: json['password'] as String?,
      walletAmount: (json['walletAmount'] as num?)?.toInt(),
      hasSub: json['hasSub'] as bool?,
      subDueDate: json['subDueDate'] == null
          ? null
          : DateTime.parse(json['subDueDate'] as String),
      subName: json['subName'] as String?,
      subPrice: (json['subPrice'] as num?)?.toInt(),
      isActive: json['isActive'] as bool?,
      expertises: (json['expertises'] as List<dynamic>?)
              ?.map((e) => ExpertiseDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sex', sexNullableToJson(instance.sex));
  writeNotNull('userName', instance.userName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('nationalCode', instance.nationalCode);
  writeNotNull('userAvatar', instance.userAvatar);
  writeNotNull('userBarcode', instance.userBarcode);
  writeNotNull('barcodeNumber', instance.barcodeNumber);
  writeNotNull('likedCategories', instance.likedCategories);
  writeNotNull('expertiseId', instance.expertiseId);
  writeNotNull('addUserRole', userRolesNullableToJson(instance.addUserRole));
  writeNotNull('showUserRole', instance.showUserRole);
  writeNotNull('password', instance.password);
  writeNotNull('walletAmount', instance.walletAmount);
  writeNotNull('hasSub', instance.hasSub);
  writeNotNull('subDueDate', instance.subDueDate?.toIso8601String());
  writeNotNull('subName', instance.subName);
  writeNotNull('subPrice', instance.subPrice);
  writeNotNull('isActive', instance.isActive);
  writeNotNull(
      'expertises', instance.expertises?.map((e) => e.toJson()).toList());
  writeNotNull(
      'categories', instance.categories?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id);
  return val;
}

UserDtoApiResult _$UserDtoApiResultFromJson(Map<String, dynamic> json) =>
    UserDtoApiResult(
      data: json['data'] == null
          ? null
          : UserDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeNullableFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UserDtoApiResultToJson(UserDtoApiResult instance) {
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

ApiV1AdminIndexPost$RequestBody _$ApiV1AdminIndexPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    ApiV1AdminIndexPost$RequestBody(
      banner1ImageFile: json['Banner1ImageFile'] as String?,
      banner2ImageFile: json['Banner2ImageFile'] as String?,
      banner3ImageFile: json['Banner3ImageFile'] as String?,
    );

Map<String, dynamic> _$ApiV1AdminIndexPost$RequestBodyToJson(
    ApiV1AdminIndexPost$RequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Banner1ImageFile', instance.banner1ImageFile);
  writeNotNull('Banner2ImageFile', instance.banner2ImageFile);
  writeNotNull('Banner3ImageFile', instance.banner3ImageFile);
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

ApiV1BookAddPost$RequestBody _$ApiV1BookAddPost$RequestBodyFromJson(
        Map<String, dynamic> json) =>
    ApiV1BookAddPost$RequestBody(
      imageFile: json['ImageFile'] as String?,
      pdfFile: json['PdfFile'] as String?,
    );

Map<String, dynamic> _$ApiV1BookAddPost$RequestBodyToJson(
    ApiV1BookAddPost$RequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ImageFile', instance.imageFile);
  writeNotNull('PdfFile', instance.pdfFile);
  return val;
}

ApiV1UserUpdateProfilePost$RequestBody
    _$ApiV1UserUpdateProfilePost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1UserUpdateProfilePost$RequestBody(
          userAvatarFile: json['UserAvatarFile'] as String?,
        );

Map<String, dynamic> _$ApiV1UserUpdateProfilePost$RequestBodyToJson(
    ApiV1UserUpdateProfilePost$RequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UserAvatarFile', instance.userAvatarFile);
  return val;
}
