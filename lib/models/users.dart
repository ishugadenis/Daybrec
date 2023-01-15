class Users{
  final String name;
  final String id;
  final String email;
  final bool isLoggedIn;
  final String phoneNumber;

  Users(
      {required this.name,
      required this.id,
      required this.email,
      required this.isLoggedIn,
      required this.phoneNumber});

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'emai': email,
        'isLoggedIn': isLoggedIn,
        'phoneNumber': phoneNumber,
      };

  Users.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? '',
        id = json['id'] ?? '',
        email = json['email'] ?? '',
        isLoggedIn = json['isLoggedIn'] ?? false,
        phoneNumber = json['phoneNuber'] ?? '';
}
