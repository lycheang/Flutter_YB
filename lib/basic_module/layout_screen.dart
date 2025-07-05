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
        Navigator.pop(context); // ← Go back to previous screen
    },
  ),
),
      body: _buildLoginBody(context),
    );
  }

  Widget _buildLoginBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // YouTube logo
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlk5jo0GzFUKz8bOb159GJ0apc-hgBfDMMuHpnNYxxnexIOAC3ziIf275ytKKTy91aQVk&usqp=CAU',
              height: 60,
            ),
            const SizedBox(height: 32),
            const Text(
              'Sign in to YouTube',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Continue to YouTube',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 32),
            // Sign in button (fake Google button for this mockup)
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
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
              ),
              label: const Text('Sign in with Google'),
              onPressed: () {
                
              },
              
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Handle forgot email
              },
              child: const Text('Forgot email?'),
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
            )
          ],
        ),
      ),
    );
  }
}
