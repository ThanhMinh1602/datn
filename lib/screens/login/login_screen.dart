import 'package:datn/components/button/td_elevated_button.dart';
import 'package:datn/components/text_field/td_text_field.dart';
import 'package:datn/components/text_field/td_text_field_password.dart';
import 'package:datn/gen/assets.gen.dart';
import 'package:datn/screens/home/home_screen.dart';
import 'package:datn/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  Future<void> _submitLogin() async {
    if (formKey.currentState!.validate() == false) {
      return;
    }

    if (_emailController.text.trim() == 'DATN' &&
        _passController.text.trim() == '123456') {
      await _setLoginStatus(true);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login failed'),
            content: const Text('Please check your username and password'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],
          );
        },
      );
    }
  }

  Future<void> _setLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0)
              .copyWith(top: MediaQuery.of(context).size.height * 0.2),
          child: Column(children: [
            Image.asset(
              Assets.images.logoLogin.path,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            const SizedBox(height: 100.0),
            TdTextField(
              validator: Validator.requiredValidator.call,
              controller: _emailController,
              hintText: 'User name',
            ),
            const SizedBox(height: 30.0),
            TdTextFieldPassword(
                validator: Validator.requiredValidator.call,
                controller: _passController,
                hintText: 'Password'),
            const SizedBox(height: 30.0),
            TdElevatedButton(
              text: 'Login',
              onPressed: _submitLogin,
            )
          ]),
        ),
      ),
    );
  }
}
