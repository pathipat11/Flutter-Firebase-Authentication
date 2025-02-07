import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    setState(() {
      _currentUser = _auth.currentUser;
    });
  }

  Future<void> _logout() async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          if (_currentUser != null)
            PopupMenuButton(
              onSelected: (value) {
                if (value == 'logout') {
                  _logout();
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'logout',
                  child: const Text('Logout'),
                ),
              ],
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Row(
                  children: [
                    const Icon(Icons.account_circle),
                    const SizedBox(width: 8),
                    Text(
                      _currentUser?.email ?? 'User',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Home Page!',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
