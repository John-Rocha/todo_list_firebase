import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_firebase/screens/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const id = 'forgot_password_screen';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
                controller: _emailController,
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 40),
                    maximumSize: const Size(200, 40)),
                onPressed: () async {
                  final formValid = _formKey.currentState?.validate() ?? false;

                  if (formValid) {
                    final messenger = ScaffoldMessenger.of(context);

                    await _auth
                        .sendPasswordResetEmail(
                            email: _emailController.text.trim())
                        .then((_) {
                      messenger.showSnackBar(
                        const SnackBar(
                          content: Text('Email sent'),
                        ),
                      );
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.id);
                    }).catchError(
                      (e) {
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text('Email not sent. Error: $e'),
                          ),
                        );
                      },
                    );
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail_outline),
                    SizedBox(width: 10),
                    Text("Reset Password")
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
