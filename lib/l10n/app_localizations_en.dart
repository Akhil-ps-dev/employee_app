// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get employeeConnect => 'Employee Connect';

  @override
  String get connectingYouWithYourTeam => 'Connecting you with your team.';

  @override
  String get signInWithGoogle => 'Sign in with Google';

  @override
  String get skipForNow => 'Skip for now';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get profile => 'Profile';

  @override
  String get signOut => 'Sign Out';

  @override
  String get noInternetConnection => 'No Internet Connection';

  @override
  String get checkYourConnection =>
      'Please check your connection. The app will reload automatically when the network returns.';

  @override
  String get offlineCannotCreateUser => 'Offline: Cannot create user.';

  @override
  String get userDetails => 'User Details';

  @override
  String get createUser => 'Create New User';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get email => 'Email';

  @override
  String get avatarUrl => 'Avatar URL';

  @override
  String get createUserButton => 'Create User';

  @override
  String get userCreatedSuccessfully => 'User created successfully!';

  @override
  String get youAreNotSignedIn => 'You are not signed in.';
}
