import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_model.freezed.dart';
part 'create_user_model.g.dart';

@freezed
class CreateUserResponse with _$CreateUserResponse {
  const factory CreateUserResponse({
    required String id,
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String avatar,
    required DateTime createdAt,
  }) = _CreateUserResponse;

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
}
