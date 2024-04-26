import 'package:build_ui_in_run_time/models/user_model.dart';
import 'package:build_ui_in_run_time/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    User user = User(
      userName: '',
      bio: '',
      birthDate: DateTime.now(),
      age: 0,
      anyThing: DateTime.now(),
      displayName: '',
    );
    Map<String, dynamic> userFields = {
      'userName': user.userName,
      'bio': user.bio,
      'birthDate': user.birthDate,
      'age': user.age,
      'displayName': user.displayName,
      'anyThing': user.anyThing,
    };
    GenericModel<User> genericUser = GenericModel<User>(
      model: user,
      fields: userFields,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen<User>(genericModel: genericUser),
    );
  }
}
