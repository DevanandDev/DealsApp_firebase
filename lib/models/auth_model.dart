class AuthModel {
  String? name;
  String? email;
  String? uid;

  AuthModel({required this.name, required this.email, required this.uid});

  factory AuthModel.fromFire(Map<String, dynamic> fireData) {
    return AuthModel(
      name: fireData['name'],
      email: fireData['email'],
      uid: fireData['userId'],
    );
  }
}
