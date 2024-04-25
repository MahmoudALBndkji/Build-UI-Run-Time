class User {
  final String userName;
  final String bio;
  final DateTime birthDate;
  final int age;
  final String displayName;
  final DateTime anyThing;

  User({
    required this.userName,
    required this.bio,
    required this.birthDate,
    required this.age,
    required this.displayName,
    required this.anyThing,
  });
}

class GenericModel<T> {
  final T model;
  final Map<String, dynamic> fields;
  GenericModel({required this.model, required this.fields});
}
