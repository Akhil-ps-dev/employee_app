import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/create_user_model.dart/create_user_model.dart';
import '../models/user_models.dart';

class UserRepository {
  final Dio _dio = Dio();

  final String _baseUrl = 'https://reqres.in/api';

  //user list page
  Future<List<User>> fetchUsers({int page = 1}) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/users',

        // queryParameters: {'page': page},
        options: Options(headers: {'x-api-key': 'reqres-free-v1'}),
      );
      final userResponse = UserResponse.fromJson(response.data);
      return userResponse.data;
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }

  //user details page

  Future<User> fetchUser(int id) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/users/$id',
        options: Options(headers: {'x-api-key': 'reqres-free-v1'}),
      );
      return User.fromJson(response.data['data']);
    } catch (e) {
      throw Exception('Failed to load user with ID $id: $e');
    }
  }

  //create user

  Future<CreateUserResponse> createUser(
    Map<String, dynamic> userRequest,
  ) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/users',
        data: userRequest,
        options: Options(headers: {'x-api-key': 'reqres-free-v1'}),
      );
      return CreateUserResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  //delete user
  Future<void> deleteUser(int id) async {
    try {
      await _dio.delete('$_baseUrl/users/$id');
    } catch (e) {
      throw Exception('Failed to delete user with ID $id: $e');
    }
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});
