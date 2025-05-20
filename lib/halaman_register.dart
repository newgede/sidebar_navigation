import 'package:flutter/material.dart';
import 'package:flutter_bahasa_inggris_1/halaman_login.dart'; // pastikan file ini ada dan berisi HalamanLogin


class HalamanRegister extends StatelessWidget {
  const HalamanRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.teal),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTextField(Icons.person, 'Username', false, inputBorder),
                const SizedBox(height: 16),
                _buildTextField(Icons.phone, 'Phone Number', false, inputBorder),
                const SizedBox(height: 16),
                _buildTextField(Icons.email, 'Email Address', false, inputBorder),
                const SizedBox(height: 16),
                _buildTextField(Icons.lock, 'Password', true, inputBorder),
                const SizedBox(height: 16),
                _buildTextField(Icons.lock_outline, 'Retype Password', true, inputBorder),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Sign Up', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HalamanLogin()),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: 'Have an account? ',
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint, bool isPassword, InputBorder border) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        hintText: hint,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      ),
    );
  }
}
