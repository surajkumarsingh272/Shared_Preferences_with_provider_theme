import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/signup_login_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SignupLoginProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title:  Text( 'Home Screen', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(18),
          child: Form(
            key: provider.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildTextField(  controller: provider.taskName, hint: "Task Name",),
                 SizedBox(height: 16),
                buildTextField(controller: provider.taskDescription, hint: "Task Description",),
                 SizedBox(height: 16),
                buildTextField( controller: provider.taskStatus, hint: "Task Status",),
                 SizedBox(height: 25),

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.addDAta(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                    ),
                    child: const Text("Add Now", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1.5,
          ),
        ),
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
