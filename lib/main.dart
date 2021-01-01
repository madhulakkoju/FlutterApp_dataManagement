import 'package:dart_style/dart_style.dart';
import 'package:flutter/material.dart';
import 'AddEmployee.dart' as addEmployeePage;

void main(){
  runApp(HomePage());
}

class HomePage extends StatelessWidget{
  static final String appTitle = "Office Cafeteria";
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
            title : Text(appTitle),
        ),
        body: addEmployeePage.AddEmployeeData() ,
      ),
    );
  }
}


