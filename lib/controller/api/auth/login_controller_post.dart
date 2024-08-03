import 'package:bookapp/model/api/generated/tikonline.swagger.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<AccessToken> login(
    {LoginDto? dto, required BuildContext context}) async {
  final api = Tikonline.create();

  final postResult = await api.apiV1AuthenticationStaffAuthPost(body: dto);

  if (postResult.isSuccessful == true) {
    final response = AccessToken.fromJson(postResult.body!.toJson());
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("accessToken", response.accessToken.toString());
    // loader maybe <====
    // QuickAlert.show(
    //   context: context,
    //   type: QuickAlertType.confirm,
    //   title: 'Oops1...',
    //   text: dto.toString(),
    // );
  } else {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops2...',
      text: postResult.toString(),
    );
  }
  final response = AccessToken.fromJson(postResult.body!.toJson());

  return response;
}
