class AppRoutesKey {
  ////////////// constructor
  AppRoutesKey._privateConstructor();
  static final AppRoutesKey _instance = AppRoutesKey._privateConstructor();
  static AppRoutesKey get instance => _instance;
  //////////////// routes
  /// initial routes

  final String initial = "/";
  final String splash = "/";
  final String onBoardScreen = "onboardScreen";
  final String notFoundScreen = "notFoundScreen";
  final String errorScreen = "errorScreen";
  final String noInternetScreen = "noInternetScreen";

  /// base routes
  final String aboutScreen = "aboutScreen";
  final String faqsScreen = "faqScreen";
  final String privacyPolicyScreen = "privacyPolicyScreen";
  final String termsAndConditionsScreen = "termsAndConditionsScreen";

  ////////////// auth
  final String signInScreen = "signInScreen";
  final String signUpScreen = "signUPScreen";
  final String technicianSignUpScreen = "technicianSignUpScreen";
  final String chooseRoleScreen = "chooseRoleScreen";
  final String forgotScreen = "forgotScreen";
  final String signUpVerifyScreen = "signUpVerifyScreen";
  final String verificationInProgressScreen = "verificationInProgressScreen";
  final String createNewPasswordScreen = "createNewPasswordScreen";
  final String changePasswordScreen = "changePasswordScreen";

  /////////////// app navigation
  final String homeScreen = "homeScreen";
  final String jobScreen = "jobScreen";
  final String chatScreen = "chatScreen";
  final String allServicesScreen = "allServicesScreen";
  final String artisanListScreen = "artisanListScreen";
  final String artisanProfileScreen = "artisanProfileScreen";
  final String profileScreen = "profileScreen";
}
