class UserAccount {
  final String name;
  final String email;
  final String phone;
  final Roles role;

  UserAccount(this.phone, {required this.name, required this.email, required this.role});
}

enum Roles { unknown, passenger, driver }
