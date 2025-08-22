import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_12/provider/signup_login_provider.dart';
import 'package:flutter_test_12/provider/themeProvider.dart';
import 'package:provider/provider.dart';
import 'Splace_screen.dart';

void main(){
   runApp(
     MultiProvider(providers: [
       ChangeNotifierProvider(create: (context) => SignupLoginProvider(),),
       ChangeNotifierProvider(create: (context) => ThemeProvider(),)
     ],child: MyApp(),)
   );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      home: SplaceScreen(),

    );
  }
}
