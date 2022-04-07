class User {
  String name;
  String age;

  User({required this.name, required this.age});
  Map toJson() => {'name': name, 'age': age};
}
