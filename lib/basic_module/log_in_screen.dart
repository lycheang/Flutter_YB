import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100), // To simulate vertical spacing
                  _buildEmailField(),
                  SizedBox(height: 20),
                  _buildPasswordField(),
                  SizedBox(height: 20),
                  _buildButton(),
                  SizedBox(height: 100), // To allow space below
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: "Enter Email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      ),
      textInputAction: TextInputAction.send,
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key),
        hintText: "Enter Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      ),
      obscureText: true,
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
        ),
        onPressed: () {},
        child: Text("Log In"),
      ),
    );
  }
}
