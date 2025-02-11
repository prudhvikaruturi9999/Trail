import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantproject/Home.dart';
import 'package:plantproject/SignInPage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final String email = _emailController.text;
    final String password = _passwordController.text;

    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The password is too weak.'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The email address is already in use.'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign-up failed. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _navigateToSignIn() {
    // Implement navigation to your SignInPage here (e.g., pushReplacementNamed)
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => SignInPage())); // Replace with your sign-in route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pro Plant Sign Up'),
        backgroundColor: Colors.green,
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft, // Start position of the gradient
                end: Alignment.bottomRight, // End position of the gradient
                colors: [
                  Colors.green.shade200,
                  Colors.green,
                ], // Colors for the gradient
              ),
            ),
          ),
        ),
        const Positioned.fill(
          child: Image(
            image: AssetImage('assets/images/back.jpg'),
            fit: BoxFit.cover, // Replace with your image path
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green, // Set the background color to gray
              borderRadius: BorderRadius.circular(10.0), // Add rounded corners
            ),
            padding: EdgeInsets.all(20.0),
            height: 400,
            margin: EdgeInsets.fromLTRB(
                50, 10, 50, 10), // A // Add some padding around the form
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: _signUp,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: _navigateToSignIn,
                    child: const Text(
                      'Already have an account? Sign In',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
