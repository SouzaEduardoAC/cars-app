import 'package:carsapp/models/user.dart';
import 'package:carsapp/pages/home.dart';
import 'package:carsapp/services/login.dart';
import 'package:carsapp/utils/alerts.dart';
import 'package:carsapp/utils/route.dart';
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
  bool _showProgress = false;

  @override
  void initState() {
    super.initState();
    User.get().then((User user) {
      if (user != null)
        setState(() {
          _controllerLogin.text = user.login;
        });
      });
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
              _loginButton()
            ],
          ),
        ),
      );

  String _requiredFieldValidation(String text) {
    if (text.isEmpty) return 'This field is required';
    return null;
  }

  _onPressed() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) return;

    setState(() {
      _showProgress = true;
    });

    final login = _controllerLogin.text;
    final password = _controllerPassword.text;
    print('Login: $login | Password: $password');

    final apiResponse = await LoginService.login(login, password);

    apiResponse.success
        ? push(context, HomePage())
        : popDialog(context, apiResponse.msg);

    setState(() {
      _showProgress = false;
    });
  }

  _loginButton() => _showProgress
      ? Button('Login', onPressed: _onPressed, showProgress: true)
      : Button('Login', onPressed: _onPressed, showProgress: false);
}
