import 'package:flutter/material.dart';
import 'package:flutter_test_12/provider/signup_login_provider.dart';
import 'package:flutter_test_12/screen/login_screen.dart';
import 'dart:async';
import 'package:provider/provider.dart';

import 'bottomNavigationBar/BottomNavaTion.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      getData();
    });
    super.initState();
  }

   getData() async{
     var status=await Provider.of<SignupLoginProvider>(context,listen: false).loginStatusNow();
     if(status==true){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavaTion(),));
     }
     else{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0f172a),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.purpleAccent, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon( Icons.flutter_dash, color: Colors.white, size: 60,)),

            SizedBox(height: 25),

            Text( "Crafted for performance", style: TextStyle( fontSize: 14,  color: Colors.grey.shade300, letterSpacing: 1.2,)),

            SizedBox(height: 30),

            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
