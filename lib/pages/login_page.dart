import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/services/auth_service.dart';
import 'package:flutter_app_template/widgets/auth_widgets/auth_auth_methode.dart';
import 'package:flutter_app_template/widgets/auth_widgets/auth_submit_button.dart';
import 'package:flutter_app_template/widgets/auth_widgets/auth_text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
    required this.onTap,
  });

  void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailCointroller = TextEditingController();

  final TextEditingController passwordCointroller = TextEditingController();

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  void signInUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCointroller.text,
        password: passwordCointroller.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // Logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50),

                // welcome back
                Text(
                  "Welcome back",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),

                // username password
                AuthTextField(
                  controller: emailCointroller,
                  hintText: "Email",
                ),
                const SizedBox(height: 10),
                AuthTextField(
                  controller: passwordCointroller,
                  hintText: "Password",
                  password: true,
                ),
                const SizedBox(height: 10),

                // forget password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Text(
                        "Forget password ?",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                //sign in Button
                AuthSubmitButton(text: "Sign In", onTap: signInUser),
                const SizedBox(height: 50),

                // continue with
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                // google and apple
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AuthAuthWith(
                      onTap: () {},
                      imagePath: "assets/apple.png",
                    ),
                    // SizedBox(width: 100),
                    AuthAuthWith(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: "assets/google.png",
                    ),
                  ],
                ),
                const SizedBox(height: 50),

                // not members
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member yet?",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
