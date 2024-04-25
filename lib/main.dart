import 'package:build_ui_in_run_time/models/user_model.dart';
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
      home: DynamicForm<User>(genericModel: genericUser),
    );
  }
}

class DynamicForm<T> extends StatefulWidget {
  final GenericModel<T> genericModel;
  const DynamicForm({Key? key, required this.genericModel}) : super(key: key);
  @override
  State<DynamicForm<T>> createState() => _DynamicFormState<T>();
}

class _DynamicFormState<T> extends State<DynamicForm<T>> {
  List<Widget> buildFormFields() {
    List<Widget> formFields = [];
    widget.genericModel.fields.forEach((key, value) {
      if (value is String) {
        formFields.add(
          TextField(
            decoration: InputDecoration(labelText: key),
            onChanged: (newValue) {},
          ),
        );
      } else if (value is DateTime) {
        formFields.add(
          TextField(
            decoration: InputDecoration(labelText: key),
            keyboardType: TextInputType.datetime,
            onChanged: (newValue) {},
          ),
        );
      } else if (value is int) {
        formFields.add(
          TextField(
            decoration: InputDecoration(labelText: key),
            keyboardType: TextInputType.number,
            onChanged: (newValue) {},
          ),
        );
      }
    });
    return formFields;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Form'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: buildFormFields(),
      ),
    );
  }
}
