import 'package:flutter/material.dart';
import 'package:flutter_test_12/ModalClass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bottomNavigationBar/BottomNavaTion.dart';
import '../screen/login_screen.dart';

class SignupLoginProvider with ChangeNotifier{

  var nameController=TextEditingController();
  var contactController=TextEditingController();
  var pinController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  var dataList=[
    ModalClass(description: "do you want read provider", status: "Complete", task: "Provider"),
  ];

  var name="";

  var taskName=TextEditingController();
  var taskDescription=TextEditingController();
  var taskStatus=TextEditingController();
  var key=GlobalKey<FormState>();

  Future<bool> loginStatusNow()async{
    var prefs=await SharedPreferences.getInstance();
    var status=prefs.getBool("isLogin");
    return status??false;
  }

  signupMethod(BuildContext context)async{
    if(key.currentState!.validate()){
      var prefs=await SharedPreferences.getInstance();
      prefs.setString("name", nameController.text);
      prefs.setString("contact", contactController.text);
      prefs.setString("pin", pinController.text);
      prefs.setString("email", emailController.text);
      prefs.setString("password", passwordController.text);
      prefs.setBool("isLogin", true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    }
  }

  Future<bool> loginMethod(BuildContext context)async{
    if(key.currentState!.validate()){
      var prefs=await SharedPreferences.getInstance();
      var saveEmail=prefs.getString("email");
      var savePassword=prefs.getString("password");
      if(saveEmail==emailController.text && savePassword==passwordController.text){
        prefs.setBool("isLogin", true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavaTion(),));
      }
      else{
        SnackBar(content: Text("email and password Incurrect"));
      }
      return true;
    }
    else{
      return false;
    }
  }
  void addDAta(BuildContext context){
    if(key.currentState!.validate()){
      var dataNew=ModalClass(description: taskDescription.text, status: taskStatus.text, task: taskName.text);
      dataList.add(dataNew);
    }
  }

  getData()async{
    var prefs=await SharedPreferences.getInstance();
    name=prefs.getString("name")??"";
    notifyListeners();
  }
}
