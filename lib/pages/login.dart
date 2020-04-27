import 'package:carsapp/widgets/buttons.dart';
import 'package:carsapp/widgets/form_fields.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllerLogin = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cars'),
      ),
      body: _body(),
    );
  }

  _body() => Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              InputFormField(
                label: 'Login',
                hint: 'username@mail.com',
                controller: _controllerLogin,
                validator: _requiredFieldValidation,
                keyboardType: TextInputType.emailAddress,
                nextFocus: _passwordFocus,
              ),
              SizedBox(
                height: 10,
              ),
              InputFormField(
                label: 'Password',
                hint: 'password',
                password: true,
                controller: _controllerPassword,
                validator: _requiredFieldValidation,
                keyboardType: TextInputType.number,
                focusNode: _passwordFocus,
              ),
              SizedBox(
                height: 28,
              ),
              Button('Login', onPressed: _onPressed),
            ],
          ),
        ),
      );

  String _requiredFieldValidation(String text) {
    if (text.isEmpty) return 'This field is required';
    return null;
  }

  _onPressed() {
    var isValid = _formKey.currentState.validate();
    if (!isValid) return;

    String login = _controllerLogin.text;
    String password = _controllerPassword.text;
    print('Login: $login | Password: $password');
  }
}
