import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/services/auth_service.dart';
import 'package:flutter_app_template/widgets/auth_widgets/auth_auth_methode.dart';
import 'package:flutter_app_template/widgets/auth_widgets/auth_submit_button.dart';
import 'package:flutter_app_template/widgets/auth_widgets/auth_text_field.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({
    super.key,
    required this.onTap,
  });

  void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailCointroller = TextEditingController();
  final TextEditingController passwordCointroller = TextEditingController();
  final TextEditingController confirmPasswordCointroller =
      TextEditingController();

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

  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    if (passwordCointroller.text != confirmPasswordCointroller.text) {
      Navigator.pop(context);
      showErrorMessage("Passwords don't match");
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
                  size: 50,
                ),
                const SizedBox(height: 50),

                // welcome back
                Text(
                  "Let's create an account",
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
                AuthTextField(
                  controller: confirmPasswordCointroller,
                  hintText: "Comfirm Password",
                  password: true,
                ),
                const SizedBox(height: 50),

                //sign in Button
                AuthSubmitButton(text: "Register", onTap: registerUser),
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
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login Now",
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
