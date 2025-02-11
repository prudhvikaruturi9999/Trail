import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plantproject/BackImage.dart';
import 'package:plantproject/Home.dart';
import 'package:plantproject/SignUpPage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // Navigate to the main page or display a success message
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) =>
                GradientBackground())); // Replace with your main page route
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          // Handle user not found error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('The email address is not registered.'),
            ),
          );
        } else if (e.code == 'wrong-password') {
          // Handle incorrect password error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('The password is incorrect.'),
            ),
          );
        }
      }
    }
  }

  Future<void> _forgotPassword() async {
    // Implement logic to send a password reset email using FirebaseAuth
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: _emailController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('A password reset link has been sent to your email.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget w = Stack(children: [
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
// mainAxisSize: MainAxisSize.min,
          height: 500,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.fromLTRB(
              50, 20, 50, 20), // A // Add some padding around the form
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 3.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: _signIn,
                    child: Text('Sign In'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: _forgotPassword,
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 3.0),
                  TextButton(
                    onPressed: () {
                      // Navigate to SignUp screen
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => SignUpPage()),
                      );
                    },
                    child: const Text(
                      'Create new Account',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ]);

    return Scaffold(
        appBar: AppBar(
          title: Text('ProPlant Sign In'),
          backgroundColor: Colors.green,
        ),
        resizeToAvoidBottomInset: false,
        body: w);
  }
}
