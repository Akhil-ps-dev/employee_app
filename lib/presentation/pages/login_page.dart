import 'package:flutter/material.dart';
import 'package:flutter_employee/l10n/app_localizations.dart';
import 'home_page.dart';
import '../../route.dart';
import '../../service/auth/google_sign_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  Future<void> _signWithGoogle() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final userCredential = await GoogleSignInService.signInWithGoogle();
      if (!mounted) return;
      if (userCredential != null) {
        NavigationHelper.pushReplacement(context, HomePage());
        print('User signed in: ${userCredential.user?.displayName}');
      }
    } catch (e) {
      if (!mounted) return;
      print('Error during Google Sign-In: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Sign-In failed: $e')));
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
     final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.people_alt_rounded,
                size: 80,
                color: Color(0xFF4A90E2),
              ),
              const SizedBox(height: 16),
               Text(
               appLocalizations.employeeConnect,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
               Text(
                 appLocalizations.connectingYouWithYourTeam,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                icon: Image.asset('assets/images/search.png', height: 24.0),
                label:  Text(
                  appLocalizations.signInWithGoogle,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                onPressed: _signWithGoogle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),

              TextButton(
                child: Text(appLocalizations.skipForNow),
                onPressed: () {
                  NavigationHelper.pushReplacement(context, HomePage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
