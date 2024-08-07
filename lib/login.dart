import 'package:flutter/material.dart';
import 'package:flutter_application/mainscreen.dart'; // Update the import according to your actual file structure

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController(text: 'Admin');
  final TextEditingController _passwordController = TextEditingController(text: 'Admin');

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login",style: TextStyle(fontSize: 20),),
              SizedBox(height: 50, ),

              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                // Optional: Validate if you want
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate and authenticate the user here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: const Text('Login'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0), // Increase height for better visual appeal
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
