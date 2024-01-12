import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:todo_app/widgets/custom_text_input.dart";

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final auth = FirebaseAuth.instance;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Text(
                'Sign-in Screen',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
              ),
            ),
            CustomTextInput(
              controller: _email,
              icon: Icon(Icons.email),
              isObscure: false,
              hint: 'Enter your email',
              keyboard: TextInputType.emailAddress,
            ),
            CustomTextInput(
              controller: _password,
              icon: Icon(Icons.password),
              isObscure: true,
              hint: 'Enter your password',
              keyboard: TextInputType.emailAddress,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () async{
                    //*Authenticate user and Navigate to home
                    final String email = _email.text;
                    final String password = _password.text;
                  await  auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text('Sign-in')),
            ),
            TextButton(
                onPressed: () {
                  //*Navigate to register screen
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Register here'))
          ],
        ),
      ),
    );
  }
}
