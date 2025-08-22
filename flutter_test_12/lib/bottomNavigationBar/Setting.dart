import 'package:flutter/material.dart';
import 'package:flutter_test_12/provider/themeProvider.dart';
import 'package:flutter_test_12/screen/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/signup_login_provider.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<SignupLoginProvider>(context).getData();
  }

  @override
  Widget build(BuildContext context) {
    var name = Provider.of<SignupLoginProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(20),
              child: Row(
                children: [
                   Icon(Icons.person, size: 35, color: Colors.white),
                   SizedBox(width: 15),
                   Expanded(
                    child: Text(name.name, style:  TextStyle( fontSize: 20, fontWeight: FontWeight.w600,color: Colors.green,)),
                  ),
                ],
              ),
            ),

             SizedBox(height: 50),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
                icon:  Icon(Icons.brightness_6, color: Colors.white),
                label:  Text("Change Theme"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),

             SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool("isLogin", false);
                  Navigator.pushReplacement( context,  MaterialPageRoute(builder: (context) =>  LoginScreen()),);
                },
                icon:  Icon(Icons.logout, color: Colors.white),
                label:  Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
