import 'package:flutter/material.dart';
import 'package:flutter_employee/l10n/app_localizations.dart';
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
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title:  Text(appLocalizations.profile)),
      body: authState.when(
        data: (user) {
          if (user == null) {
            return  Center(child: Text(appLocalizations.youAreNotSignedIn));
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
                    label:  Text(appLocalizations.signOut),
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
