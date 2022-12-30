import 'package:flutter/material.dart';
import 'package:w13_ytu_flutterapp/dbrepository/dbcontext.dart';
import 'package:w13_ytu_flutterapp/dbrepository/student.dart';
import 'package:w13_ytu_flutterapp/sqllitedbpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  //await DbContext.insertStudent(Student(departmentName: "x", firstName: "x", lastName: "x"));
  
  //await DbContext.updateStudent(Student(id: 4, departmentName: "Math", firstName: "Muttalip", lastName: "Şarkıcı"));
 
  //await DbContext.deleteStudent(7);
  
  // var results =await DbContext.getStudents();
  // for (var result in results) {
  //   print("id: ${result.id.toString()} ${result.firstName} ${result.lastName} ");
  // }

  //var std = await DbContext.getStudent(4);

  //print(std.firstName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home:  SqlFliteDbPage(),
    );
  }
}
