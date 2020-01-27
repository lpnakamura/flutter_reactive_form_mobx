import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_reactive_form_mobx/controllers/user_controller.dart';

class UserFormPage extends StatelessWidget {
  final UserController controller = UserController();

  Future getDatePicker(BuildContext context, {DateTime initialDate}) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      lastDate: DateTime.now(),
      firstDate: DateTime(1900),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reactive Form'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(children: <Widget>[
            Observer(builder: (_) {
              return TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'What\'s your name',
                    labelText: '* Name',
                    errorText: controller.validateName),
                onChanged: (name) => controller.userModel.name = name,
              );
            }),
            SizedBox(height: 10),
            Observer(builder: (_) {
              return TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'What\'s your email adress',
                      labelText: '* Email Adress',
                      errorText: controller.validateEmail),
                  onChanged: (email) => controller.userModel.email = email,
                  keyboardType: TextInputType.emailAddress);
            }),
            SizedBox(height: 10),
            Observer(builder: (_) {
              return GestureDetector(
                  child: Container(
                    color: Colors.transparent,
                    child: IgnorePointer(
                      child: TextField(
                        controller: TextEditingController(
                            text: controller.formattedBirthdayDate),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.calendar_today),
                            labelText: '* Birthday',
                            enabled: true,
                            errorText: controller.validateBirthday),
                      ),
                    ),
                  ),
                  onTap: () async {
                    DateTime date = await getDatePicker(_,
                        initialDate: controller.userModel.birthday);
                    controller.userModel.birthday = date;
                  });
            }),
            SizedBox(height: 15),
            Observer(builder: (_) {
              return controller.userModel.birthday != null
                  ? Row(
                      children: <Widget>[
                        Image.asset(
                          controller.iconByUserAge,
                          width: 32,
                          height: 32,
                        ),
                        SizedBox(width: 5),
                        Text(
                            'you are ${controller.userModel.age.toString()} years old.')
                      ],
                    )
                  : Container();
            }),
            SizedBox(height: 15),
            Observer(builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                        onPressed: controller.userisValid ? () {} : null,
                        child: Text('Submit')),
                  ),
                ],
              );
            }),
          ]),
        ),
      ),
    );
  }
}
