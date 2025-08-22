import 'package:flutter/material.dart';
import 'package:flutter_test_12/bottomNavigationBar/Setting.dart';
import 'package:flutter_test_12/bottomNavigationBar/task_list.dart';
import 'package:flutter_test_12/screen/HomeScreen.dart';

class BottomNavaTion extends StatefulWidget {
  const BottomNavaTion({super.key});
  @override
  State<BottomNavaTion> createState() => _BottomNavaTionState();
}

class _BottomNavaTionState extends State<BottomNavaTion> {
  var selectedIndex=0;
  List<Widget> screen=[
    HomeScreen(),
    TaskList(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:screen[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,

          elevation: 5,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              selectedIndex=value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Task"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Task list"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          ]),
    );

  }

}
