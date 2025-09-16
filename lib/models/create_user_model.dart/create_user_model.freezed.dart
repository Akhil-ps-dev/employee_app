// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return _CreateUserResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateUserResponse {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CreateUserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateUserResponseCopyWith<CreateUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserResponseCopyWith<$Res> {
  factory $CreateUserResponseCopyWith(
    CreateUserResponse value,
    $Res Function(CreateUserResponse) then,
  ) = _$CreateUserResponseCopyWithImpl<$Res, CreateUserResponse>;
  @useResult
  $Res call({
    String id,
    String email,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String avatar,
    DateTime createdAt,
  });
}

/// @nodoc
class _$CreateUserResponseCopyWithImpl<$Res, $Val extends CreateUserResponse>
    implements $CreateUserResponseCopyWith<$Res> {
  _$CreateUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? avatar = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            avatar: null == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateUserResponseImplCopyWith<$Res>
    implements $CreateUserResponseCopyWith<$Res> {
  factory _$$CreateUserResponseImplCopyWith(
    _$CreateUserResponseImpl value,
    $Res Function(_$CreateUserResponseImpl) then,
  ) = __$$CreateUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    @JsonKey(name: 'first_name') String firstName,
    @JsonKey(name: 'last_name') String lastName,
    String avatar,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$CreateUserResponseImplCopyWithImpl<$Res>
    extends _$CreateUserResponseCopyWithImpl<$Res, _$CreateUserResponseImpl>
    implements _$$CreateUserResponseImplCopyWith<$Res> {
  __$$CreateUserResponseImplCopyWithImpl(
    _$CreateUserResponseImpl _value,
    $Res Function(_$CreateUserResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? avatar = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$CreateUserResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        avatar: null == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateUserResponseImpl implements _CreateUserResponse {
  const _$CreateUserResponseImpl({
    required this.id,
    required this.email,
    @JsonKey(name: 'first_name') required this.firstName,
    @JsonKey(name: 'last_name') required this.lastName,
    required this.avatar,
    required this.createdAt,
  });

  factory _$CreateUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateUserResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String avatar;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'CreateUserResponse(id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatar: $avatar, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateUserResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    firstName,
    lastName,
    avatar,
    createdAt,
  );

  /// Create a copy of CreateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateUserResponseImplCopyWith<_$CreateUserResponseImpl> get copyWith =>
      __$$CreateUserResponseImplCopyWithImpl<_$CreateUserResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateUserResponseImplToJson(this);
  }
}

abstract class _CreateUserResponse implements CreateUserResponse {
  const factory _CreateUserResponse({
    required final String id,
    required final String email,
    @JsonKey(name: 'first_name') required final String firstName,
    @JsonKey(name: 'last_name') required final String lastName,
    required final String avatar,
    required final DateTime createdAt,
  }) = _$CreateUserResponseImpl;

  factory _CreateUserResponse.fromJson(Map<String, dynamic> json) =
      _$CreateUserResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get avatar;
  @override
  DateTime get createdAt;

  /// Create a copy of CreateUserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateUserResponseImplCopyWith<_$CreateUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
