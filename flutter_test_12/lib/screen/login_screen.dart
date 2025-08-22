import 'package:flutter/material.dart';
import 'package:flutter_test_12/screen/signup_screen.dart';
import 'package:provider/provider.dart';
import '../provider/signup_login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SignupLoginProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.redAccent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
               SizedBox(height: 30),
              Form(
                key: provider.key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildTextField( controller: provider.emailController, hint: "Enter email", icon: Icons.email_outlined,),
                     SizedBox(height: 16),
                    buildTextField( controller: provider.passwordController,hint: "Enter password", icon: Icons.lock_outline, isPassword: true,),
                     SizedBox(height: 25),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          provider.loginMethod(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                        ),
                        child:  Text(  "Login Now", style: TextStyle(  fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text("Don't have an account?",  style: TextStyle(fontSize: 15, color: Colors.black87)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement( context,MaterialPageRoute(  builder: (context) => const SignupScreen()));
                    },
                    child:  Text("Register here", style: TextStyle( fontWeight: FontWeight.bold,color: Colors.redAccent,)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    IconData? icon,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.redAccent),
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[50],
        contentPadding:
         EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border:   OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
          )
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }
}
