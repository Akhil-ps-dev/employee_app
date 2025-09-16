// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateUserResponseImpl _$$CreateUserResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CreateUserResponseImpl(
  id: json['id'] as String,
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  avatar: json['avatar'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$CreateUserResponseImplToJson(
  _$CreateUserResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'avatar': instance.avatar,
  'createdAt': instance.createdAt.toIso8601String(),
};
