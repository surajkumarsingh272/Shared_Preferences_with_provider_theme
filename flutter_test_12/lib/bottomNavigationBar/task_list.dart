import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/signup_login_provider.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SignupLoginProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(  "Task List", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: provider.dataList.isEmpty
          ? Center(
        child: Text(
          "No tasks added yet!",style: TextStyle(fontSize: 16, color: Colors.grey[700]),))
          : Padding(
        padding:  EdgeInsets.all(15),
        child: ListView.separated(
          itemCount: provider.dataList.length,
          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                leading: CircleAvatar(
                  backgroundColor: Colors.red.shade100,
                  child: Icon(Icons.task_alt, color: Colors.red),
                ),
                title: Text(provider.dataList[index].task,style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text( "Description: ${provider.dataList[index].description}", style: TextStyle(fontSize: 14, color: Colors.grey[700]),),
                    SizedBox(height: 2),
                    Text( "Status: ${provider.dataList[index].status}", style: TextStyle(  fontSize: 14, fontWeight: FontWeight.w500,
                          color: provider.dataList[index].status.toLowerCase() == "completed"? Colors.green : Colors.orange),
                    ),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
              ),
            );
          },
        ),
      ),
    );
  }
}
