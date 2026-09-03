import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRoleNotifier extends Notifier<String> {
  @override
  String build() => 'customer';

  void setRole(String role) {
    state = role;
  }
}

final userRoleProvider = NotifierProvider<UserRoleNotifier, String>(() {
  return UserRoleNotifier();
});
