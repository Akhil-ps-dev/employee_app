import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../../core/network_prblm.dart';
import 'profile_page.dart';
import 'user_detail_page.dart';
import '../../providers/auth_provider.dart';
import '../../providers/get_providers.dart';
import '../../route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_user.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUsers = ref.watch(userListProvider);
    final connectivity = ref.watch(connectivityStreamProvider);
    final isOffline =
        connectivity.value?.contains(ConnectivityResult.none) ?? false;

    final authState = ref.watch(authStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),

        actions: [
          authState.when(
            data: (user) {
              if (user != null && user.photoURL != null) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      NavigationHelper.push(context, ProfilePage());
                    },
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(user.photoURL!),
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ),
                );
              }
              return IconButton(
                icon: const Icon(Icons.person_outline),
                tooltip: 'Profile',
                onPressed: () {},
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            error: (err, stack) =>
                const Icon(Icons.error_outline, color: Colors.red),
          ),

          // IconButton(
          //   icon: const Icon(Icons.logout),
          //   tooltip: 'Sign Out',
          //   onPressed: () {
          //     GoogleSignInService.signOut();
          //     NavigationHelper.pushReplacement(context, LoginPage());
          //   },
          // ),
        ],
      ),

      body: asyncUsers.when(
        data: (users) {
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Card(
                elevation: 2.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 8.0,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                    backgroundColor: Colors.grey[200],
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                  onTap: () {
                    NavigationHelper.push(
                      context,
                      UserDetailPage(userId: user.id),
                    );
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: isOffline
            ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Offline: Cannot create user.')),
                );
              }
            : () {
                NavigationHelper.push(context, const CreateUserPage());
              },
        backgroundColor: const Color(0xFF50E3C2),
        child: const Icon(Icons.add),
      ),
    );
  }
}
