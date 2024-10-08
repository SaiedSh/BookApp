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
  Future<Response<dynamic>> _apiV1AdminIndexPost({
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
    final Uri $url = Uri.parse('http://130.185.75.182:5003/api/v1/Admin/Index');
    final Map<String, dynamic> $params = <String, dynamic>{
      'Banner1ImageUrl': banner1ImageUrl,
      'Banner1Title': banner1Title,
      'Banner1SubTitle': banner1SubTitle,
      'Banner1Description': banner1Description,
      'Banner1ButtonText': banner1ButtonText,
      'Banner1ButtonLink': banner1ButtonLink,
      'Banner2ImageUrl': banner2ImageUrl,
      'Banner2Title': banner2Title,
      'Banner2SubTitle': banner2SubTitle,
      'Banner2Description': banner2Description,
      'Banner2ButtonText': banner2ButtonText,
      'Banner2ButtonLink': banner2ButtonLink,
      'Banner3ImageUrl': banner3ImageUrl,
      'Banner3Title': banner3Title,
      'Banner3SubTitle': banner3SubTitle,
      'Banner3Description': banner3Description,
      'Banner3ButtonText': banner3ButtonText,
      'Banner3ButtonLink': banner3ButtonLink,
      'Id': id,
    };
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<List<int>?>(
        'Banner1ImageFile',
        Banner1ImageFile,
      ),
      PartValueFile<List<int>?>(
        'Banner2ImageFile',
        Banner2ImageFile,
      ),
      PartValueFile<List<int>?>(
        'Banner3ImageFile',
        Banner3ImageFile,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

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
  Future<Response<IndexDtoApiResult>> _apiV1BookIndexGet() {
    final Uri $url = Uri.parse('http://130.185.75.182:5003/api/v1/Book/Index');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<IndexDtoApiResult, IndexDtoApiResult>($request);
  }

  @override
  Future<Response<BookDtoApiResult>> _apiV1BookDetailGet({String? bookId}) {
    final Uri $url = Uri.parse('http://130.185.75.182:5003/api/v1/Book/Detail');
    final Map<String, dynamic> $params = <String, dynamic>{'BookId': bookId};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<BookDtoApiResult, BookDtoApiResult>($request);
  }

  @override
  Future<Response<ApiResult>> _apiV1BookAddPost({
    bool? niko,
    bool? online,
    bool? physical,
    int? discountPercentage,
    String? physicalLink,
    String? title,
    String? description,
    String? imageUrl,
    String? pdfLink,
    String? pdfSize,
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
    String? myReviewMessage,
    int? myReviewRate,
    String? myReviewBookId,
    String? myReviewBookTitle,
    String? myReviewBookImageUrl,
    String? myReviewBookNevisande,
    String? myReviewBookEntesharat,
    String? myReviewBookMotarjem,
    String? myReviewBookSalEnteshar,
    int? myReviewBookPages,
    int? myReviewBookRating,
    int? myReviewBookPrice,
    int? myReviewBookDiscountPrice,
    int? myReviewBookViewCount,
    String? myReviewBookCategoryId,
    String? myReviewBookCategoryName,
    String? myReviewUserId,
    String? myReviewUserFirstName,
    String? myReviewUserLastName,
    String? myReviewId,
    List<BookReviewDto>? bookReviewss,
    String? id,
    List<int>? ImageFile,
    List<int>? PdfFile,
  }) {
    final Uri $url = Uri.parse('http://130.185.75.182:5003/api/v1/Book/Add');
    final Map<String, dynamic> $params = <String, dynamic>{
      'Niko': niko,
      'Online': online,
      'Physical': physical,
      'DiscountPercentage': discountPercentage,
      'PhysicalLink': physicalLink,
      'Title': title,
      'Description': description,
      'ImageUrl': imageUrl,
      'PdfLink': pdfLink,
      'PdfSize': pdfSize,
      'Like': like,
      'Read': read,
      'Shelf': shelf,
      'Nevisande': nevisande,
      'Entesharat': entesharat,
      'Motarjem': motarjem,
      'SalEnteshar': salEnteshar,
      'Pages': pages,
      'Rating': rating,
      'Price': price,
      'DiscountPrice': discountPrice,
      'ViewCount': viewCount,
      'CategoryId': categoryId,
      'CategoryTitle': categoryTitle,
      'MyReview.Message': myReviewMessage,
      'MyReview.Rate': myReviewRate,
      'MyReview.BookId': myReviewBookId,
      'MyReview.BookTitle': myReviewBookTitle,
      'MyReview.BookImageUrl': myReviewBookImageUrl,
      'MyReview.BookNevisande': myReviewBookNevisande,
      'MyReview.BookEntesharat': myReviewBookEntesharat,
      'MyReview.BookMotarjem': myReviewBookMotarjem,
      'MyReview.BookSalEnteshar': myReviewBookSalEnteshar,
      'MyReview.BookPages': myReviewBookPages,
      'MyReview.BookRating': myReviewBookRating,
      'MyReview.BookPrice': myReviewBookPrice,
      'MyReview.BookDiscountPrice': myReviewBookDiscountPrice,
      'MyReview.BookViewCount': myReviewBookViewCount,
      'MyReview.BookCategoryId': myReviewBookCategoryId,
      'MyReview.BookCategoryName': myReviewBookCategoryName,
      'MyReview.UserId': myReviewUserId,
      'MyReview.UserFirstName': myReviewUserFirstName,
      'MyReview.UserLastName': myReviewUserLastName,
      'MyReview.Id': myReviewId,
      'BookReviewss': bookReviewss,
      'Id': id,
    };
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<List<int>?>(
        'ImageFile',
        ImageFile,
      ),
      PartValueFile<List<int>?>(
        'PdfFile',
        PdfFile,
      ),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      parameters: $params,
    );
    return client.send<ApiResult, ApiResult>($request);
  }

  @override
  Future<Response<BookDtoListApiResult>> _apiV1BookSavedBooksGet({String? st}) {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Book/SavedBooks');
    final Map<String, dynamic> $params = <String, dynamic>{'st': st};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<BookDtoListApiResult, BookDtoListApiResult>($request);
  }

  @override
  Future<Response<ApiResult>> _apiV1BookSaveBookPost({
    String? bookId,
    String? st,
  }) {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Book/SaveBook');
    final Map<String, dynamic> $params = <String, dynamic>{
      'BookId': bookId,
      'st': st,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ApiResult, ApiResult>($request);
  }

  @override
  Future<Response<ApiResult>> _apiV1BookAddBookReviewPost(
      {required AddBookReviewDto? body}) {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Book/AddBookReview');
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
  Future<Response<BookReviewDtoListApiResult>> _apiV1BookMyReviewsGet() {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Book/MyReviews');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<BookReviewDtoListApiResult, BookReviewDtoListApiResult>($request);
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

  @override
  Future<Response<ApiResult>> _apiV1PaymentWalletChargeGet({int? price}) {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Payment/WalletCharge');
    final Map<String, dynamic> $params = <String, dynamic>{'Price': price};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ApiResult, ApiResult>($request);
  }

  @override
  Future<Response<ApiResult>> _apiV1PaymentBuySubscriptionPost({
    String? subId,
    bool? wallet,
  }) {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Payment/BuySubscription');
    final Map<String, dynamic> $params = <String, dynamic>{
      'SubId': subId,
      'Wallet': wallet,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ApiResult, ApiResult>($request);
  }

  @override
  Future<Response<SubscriptionDtoListApiResult>>
      _apiV1PaymentSubscriptionListGet() {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Payment/SubscriptionList');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SubscriptionDtoListApiResult,
        SubscriptionDtoListApiResult>($request);
  }

  @override
  Future<Response<PaymentTransactionsDtoListApiResult>>
      _apiV1PaymentUserTransactionsGet() {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/Payment/UserTransactions');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PaymentTransactionsDtoListApiResult,
        PaymentTransactionsDtoListApiResult>($request);
  }

  @override
  Future<Response<UserDtoApiResult>> _apiV1UserProfileGet() {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/User/Profile');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserDtoApiResult, UserDtoApiResult>($request);
  }

  @override
  Future<Response<ApiResult>> _apiV1UserUpdateProfilePost({
    String? sex,
    String? userName,
    String? phoneNumber,
    String? firstName,
    String? lastName,
    String? nationalCode,
    String? userAvatar,
    String? password,
    DateTime? birthDay,
    String? likedCategories,
    String? expertiesId,
    List<ExpertiseDto>? expertises,
    List<CategoryDto>? categories,
    String? id,
    List<int>? UserAvatarFile,
  }) {
    final Uri $url =
        Uri.parse('http://130.185.75.182:5003/api/v1/User/UpdateProfile');
    final Map<String, dynamic> $params = <String, dynamic>{
      'Sex': sex,
      'UserName': userName,
      'PhoneNumber': phoneNumber,
      'FirstName': firstName,
      'LastName': lastName,
      'NationalCode': nationalCode,
      'UserAvatar': userAvatar,
      'Password': password,
      'BirthDay': birthDay,
      'LikedCategories': likedCategories,
      'ExpertiesId': expertiesId,
      'Expertises': expertises,
      'Categories': categories,
      'Id': id,
    };
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<List<int>?>(
        'UserAvatarFile',
        UserAvatarFile,
      )
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      parameters: $params,
    );
    return client.send<ApiResult, ApiResult>($request);
  }
}
