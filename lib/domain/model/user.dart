class User {
  final String name;
  final String surname;
  final String email;
  final String phone;
  final String? password;
  final String gender;
  final int age;
  final int? sleepingModeId;
  final int? lifeStyleId;

  User({
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
     this.password,
    required this.gender,
    required this.age,
     this.sleepingModeId,
     this.lifeStyleId,
  });

  @override
  int get hashCode => email.hashCode + phone.hashCode;
}
