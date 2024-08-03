import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum ApiResultStatusCode {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Success')
  success('Success'),
  @JsonValue('ServerError')
  servererror('ServerError'),
  @JsonValue('BadRequest')
  badrequest('BadRequest'),
  @JsonValue('NotFound')
  notfound('NotFound'),
  @JsonValue('ListEmpty')
  listempty('ListEmpty'),
  @JsonValue('LogicError')
  logicerror('LogicError'),
  @JsonValue('UnAuthorized')
  unauthorized('UnAuthorized');

  final String? value;

  const ApiResultStatusCode(this.value);
}

enum UserRoles {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Admin')
  admin('Admin'),
  @JsonValue('Client')
  $client('Client'),
  @JsonValue('Manager')
  manager('Manager'),
  @JsonValue('Instructor')
  instructor('Instructor');

  final String? value;

  const UserRoles(this.value);
}
