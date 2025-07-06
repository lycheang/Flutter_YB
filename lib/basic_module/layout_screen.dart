import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to previous screen
          },
        ),
      ),
      body: _buildLoginBody(context),
    );
  }

  Widget _buildLoginBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // YouTube logo
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlk5jo0GzFUKz8bOb159GJ0apc-hgBfDMMuHpnNYxxnexIOAC3ziIf275ytKKTy91aQVk&usqp=CAU',
              height: 80,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 40),
            const Text(
              'Sign in to YouTube',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            const Text(
              'Welcome back! Enter your credentials to continue.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 32),
            // Email field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email or phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            // Password field
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_off),
                  onPressed: () {},
                ),
              ),
              obscureText: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle forgot password
                },
                child: const Text('Forgot password?'),
              ),
            ),
            const SizedBox(height: 24),
            // Sign in button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.login),
              label: const Text('Sign in'),
              onPressed: () {
                // Handle sign in logic
              },
            ),
            const SizedBox(height: 16),
            // Google sign-in button
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black87,
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: Image.network(
                'https://variety.com/wp-content/uploads/2020/06/youtube-logo.png?w=999&h=562&crop=1',
                height: 24,
                fit: BoxFit.contain,
              ),
              label: const Text('Sign in with Google'),
              onPressed: () {
                // Handle Google sign-in
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('New to YouTube?', style: TextStyle(color: Colors.black54)),
                TextButton(
                  onPressed: () {
                    // Handle create account
                  },
                  child: const Text('Create account'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Privacy and terms notice
            const Text(
              'By signing in, you agree to our Terms of Service and Privacy Policy.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Additional links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // Navigate to Terms of Service
                  },
                  child: const Text('Terms', style: TextStyle(color: Colors.blue)),
                ),
                const Text(' | ', style: TextStyle(color: Colors.black54)),
                TextButton(
                  onPressed: () {
                    // Navigate to Privacy Policy
                  },
                  child: const Text('Privacy', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}