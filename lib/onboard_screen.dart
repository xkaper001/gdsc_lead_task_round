import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gdsc_lead_task_round/palette.dart';
import 'package:gdsc_lead_task_round/responsive.dart';

import 'sign_in_screen.dart';
import 'sign_up_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 242, 252, 1),
        body: ResponsiveLayout(
          mobileScaffold: Column(
            children: [
              Expanded(child: illustration),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "GDG Leads\nTask Round Here",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "Developed by Ayan aka xkaper001 for\nGDSC Lead Task Round with ❤️",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Palette.bg,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                          },
                          child: Container(
                            width: 150,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                            ),
                            child: const Text(
                              "Register",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            log("Signned In");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignInScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: 150,
                            child: const Text(
                              "Sign In",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ))
            ],
          ),
          tabletScaffold: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: illustration),
              const Expanded(child: LoginForm()),
            ],
          ),
          desktopScaffold: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 6,
                child: illustration,
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: const LoginForm(),
                ),
              ),
            ],
          ),
        ));
  }
}

final illustration = Container(
  padding: const EdgeInsets.all(40),
  margin: const EdgeInsets.all(20),
  decoration: const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    image: DecorationImage(
        image: AssetImage('assets/illustration.jpg'), fit: BoxFit.cover),
  ),
);

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPassVIsible = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome Back',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Please enter your details',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: constraints.maxWidth * 0.8,
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: !_isPassVIsible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else {
                        if (value.length < 6) {
                          return 'Password is too short';
                        } else if (value.length < 8) {
                          return 'Password is weak';
                        } else if (value.length < 12) {
                          return 'Password is good';
                        } else if (!RegExp(r'^(?=.*?[!@#\$&*~]).{12,}$')
                            .hasMatch(value)) {
                          return 'Password should contain at least one special character';
                        } else {
                          return 'Password is strong';
                        }
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                        icon: Icon(_isPassVIsible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPassVIsible = !_isPassVIsible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(Colors.black),
                      fixedSize: WidgetStatePropertyAll(
                          Size(constraints.maxWidth * 0.8, 50)),
                    ),
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Don't have an account?"),
                  ),
                  const SizedBox(height: 20),
                ],
              )),
            )
          ],
        ),
      );
    });
  }
}
