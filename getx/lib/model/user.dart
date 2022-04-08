class User {
  String userName;
  String userAge;

  Map<String, dynamic> toMap() {
    return {
      'name': userName,
      'age': userAge,
    };
  }

  User.fromMap(Map map)
      : userName = map['name'],
        userAge = map['age'];

  User({required this.userName, required this.userAge});
}
