import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _showSnackBar(BuildContext context, String message, {Color backgroundColor = Colors.red}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  Future<void> _createAccount(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showSnackBar(context, 'Please enter email and password.');
      return;
    }

    if (password != confirmPassword) {
      _showSnackBar(context, 'Passwords do not match.');
      return;
    }

    final FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      _showSnackBar(context, 'Account created successfully!', backgroundColor: Colors.green);

      // ย้ายไปหน้า Login หลังจากสร้างบัญชีสำเร็จ
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _showSnackBar(context, 'The account already exists for that email.');
      } else {
        _showSnackBar(context, 'Error: ${e.message}');
      }
    } catch (e) {
      _showSnackBar(context, 'An unexpected error occurred.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _createAccount(context),
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
