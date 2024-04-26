
import 'package:build_ui_in_run_time/models/user_model.dart';
import 'package:flutter/material.dart';

class HomeScreen<T> extends StatefulWidget {
  final GenericModel<T> genericModel;
  const HomeScreen({Key? key, required this.genericModel}) : super(key: key);
  @override
  State<HomeScreen<T>> createState() => _HomeScreenState<T>();
}

class _HomeScreenState<T> extends State<HomeScreen<T>> {
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
