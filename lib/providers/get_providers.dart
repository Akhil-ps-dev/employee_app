import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_models.dart';
import '../repo/user_repo.dart';

final userListProvider = FutureProvider<List<User>>((ref) async {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUsers(page: 1);
});

final userDetailProvider = FutureProvider.family<User, int>((
  ref,
  userId,
) async {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUser(userId);
});

final addUserProvider =
    StateNotifierProvider<AddUserNotifier, AsyncValue<void>>(
      (ref) => AddUserNotifier(ref),
    );

class AddUserNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref _ref;

  AddUserNotifier(this._ref) : super(const AsyncData(null));

  Future<void> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required String avatar,
  }) async {
    state = const AsyncLoading();
    final userRepository = _ref.read(userRepositoryProvider);
    final userRequest = {
      "id": DateTime.now().toIso8601String(),
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "avatar": avatar,
    };

    state = await AsyncValue.guard(() async {
      final createdUser = await userRepository.createUser(userRequest);
      debugPrint(
        'User created: { "id": "${createdUser.id}", "createdAt": "${createdUser.createdAt.toIso8601String()}" }',
      );

      _ref.invalidate(userListProvider);
    });
  }
}
