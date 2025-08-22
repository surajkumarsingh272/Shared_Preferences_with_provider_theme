import 'package:flutter/material.dart';
import 'package:flutter_test_12/screen/login_screen.dart';
import 'package:provider/provider.dart';
import '../provider/signup_login_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SignupLoginProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text( 'Create Account',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               SizedBox(height: 20),
              Form(
                key: provider.key,
                child: Column(
                  children: [
                    buildTextField(  controller: provider.nameController, hint: "Enter Full Name", icon: Icons.person,),
                     SizedBox(height: 16),
                    buildTextField( controller: provider.contactController,  hint: "Enter Contact", icon: Icons.phone, keyboardType: TextInputType.phone,),
                     SizedBox(height: 16),
                    buildTextField( controller: provider.pinController,   hint: "Enter Pin Code",   icon: Icons.location_on, keyboardType: TextInputType.number,),
                     SizedBox(height: 16),
                    buildTextField( controller: provider.emailController,  hint: "Enter Email",  icon: Icons.email,  keyboardType: TextInputType.emailAddress,),
                     SizedBox(height: 16),
                    buildTextField(controller: provider.passwordController, hint: "Enter Password",icon: Icons.lock, obscureText: true),
                     SizedBox(height: 25),

                     ElevatedButton(
                      onPressed: () {
                        provider.signupMethod(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        minimumSize:  Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child:  Text( "Register Now",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)),
                     SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text( "Already have an account?",style: TextStyle(fontSize: 15, color: Colors.black87),),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()),);
                          },
                          child:  Text("Login here",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
                        ),
                      ],
                    ),
                  ],
                ),
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
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.redAccent),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding:  EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        border:   OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
          )
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }

        if (hint.contains("Contact")) {
          if (value.length != 10) {
            return 'Number must be 10 digits';
          }
        }

        if (hint.contains("Email")) {
          if (!value.contains('@') || !value.endsWith('gmail.com')) {
            return 'Email incorrect';
          }
        }
        return null;
      },
    );
  }
}
