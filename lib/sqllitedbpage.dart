import 'package:flutter/material.dart';
import 'package:w13_ytu_flutterapp/dbrepository/dbcontext.dart';
import 'package:w13_ytu_flutterapp/dbrepository/student.dart';

class SqlFliteDbPage extends StatefulWidget {
  const SqlFliteDbPage({super.key});

  @override
  State<SqlFliteDbPage> createState() => _SqlFliteDbPageState();
}

class _SqlFliteDbPageState extends State<SqlFliteDbPage> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQFlite")),
      body: FutureBuilder(
        future: DbContext.getStudents(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Text(
                  snapshot.data![index].firstName!,
                  style: TextStyle(fontSize: 36),
                );
              },
            );
          } else {
            return Text("Loading");
          }
        },
      ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      
      onPressed: () async{
       await DbContext.insertStudent(Student(departmentName: "departmentName", firstName: "firstName", lastName: "lastName"));

       setState(() {
         
       });
      
    },),);
  }
}
