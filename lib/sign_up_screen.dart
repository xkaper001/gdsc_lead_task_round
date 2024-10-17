import 'dart:developer';

import 'package:flutter/material.dart';

import 'password_regex.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String emailRegex =
      r"""(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])""";
  final _formkey1 = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width > 500) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Hey There!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Let\'s Get you onboarded',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
            AuthInputField(
              hintText: "Enter Name",
              validator: (value) {
                // if (!value!.contains(RegExp(emailRegex))) {
                //   return 'Please enter a valid email address';
                // }
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            AuthInputField(
              formkey: _formkey1,
              hintText: "Enter Email",
              validator: (value) {
                if (!value!.contains(RegExp(emailRegex))) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            AuthInputField(
              formkey: _formkey2,
              hintText: "Password",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else {
                  if (value.length < 8) {
                    return 'must be at least 8 characters';
                  } else if (!value.contains(RegExp(PasswordRegex.lowerCase))) {
                    return 'must contain at least one lowercase letter';
                  } else if (!value.contains(RegExp(PasswordRegex.number))) {
                    return 'must contain at least one number';
                  } else if (!value.contains(RegExp(PasswordRegex.upperCase))) {
                    return 'must contain at least one uppercase letter';
                  } else if (!value.contains(RegExp(PasswordRegex.symbol))) {
                    return 'must contain at least one special character';
                  }
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: () {
                  if (_formkey1.currentState!.validate() &&
                      _formkey2.currentState!.validate()) {
                    ScaffoldMessenger.of(context)
                        .showMaterialBanner(MaterialBanner(
                      content: const Text('Form is valid User Registered'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                          },
                          child: const Text('Close'),
                        )
                      ],
                    ));
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      const Color.fromRGBO(253, 107, 104, 1)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
                  minimumSize:
                      const WidgetStatePropertyAll(Size.fromHeight(72)),
                ),
                child: const Text('Register'),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                child: RichText(
                  text: const TextSpan(text: "Already a member? ", children: [
                    TextSpan(
                        text: "Login",
                        style: const TextStyle(
                          color: Colors.blue,
                        ))
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AuthInputField extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final Key? formkey;
  const AuthInputField(
      {super.key, required this.hintText, this.validator, this.formkey});

  @override
  State<AuthInputField> createState() => AuthInputFieldState();
}

class AuthInputFieldState extends State<AuthInputField> {
  bool _isPassVIsible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
        key: widget.formkey,
        child: TextFormField(
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText:
              (widget.hintText == "Password") ? !_isPassVIsible : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none, // Remove the underline border
            hoverColor: Colors.white,
            suffixIcon: (widget.hintText == "Password")
                ? IconButton(
                    icon: Icon(_isPassVIsible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isPassVIsible = !_isPassVIsible;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
