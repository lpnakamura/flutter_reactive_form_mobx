import 'package:flutter/material.dart';
import 'package:flutter_reactive_form_mobx/pages/user_form_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reactive MobX Form',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(color: Colors.blue),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blue, textTheme: ButtonTextTheme.primary),
      ),
      home: UserFormPage(),
    );
  }
}
