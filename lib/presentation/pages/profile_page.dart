import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';
import '../../service/auth/google_sign_auth.dart';
import '../../route.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: authState.when(
        data: (user) {
          if (user == null) {
            return const Center(child: Text('You are not signed in.'));
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar
                  if (user.photoURL != null)
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(user.photoURL!),
                      backgroundColor: Colors.grey.shade200,
                    ),
                  const SizedBox(height: 24),

                  // Name
                  if (user.displayName != null)
                    Text(
                      user.displayName!,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 8),

                  // Email
                  if (user.email != null)
                    Text(
                      user.email!,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 40),

                  // Sign Out Button
                  ElevatedButton.icon(
                    icon: const Icon(Icons.logout),
                    label: const Text('Sign Out'),
                    onPressed: () {
                      GoogleSignInService.signOut();
                      NavigationHelper.pushReplacement(context, LoginPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
