
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:photo_view/photo_view.dart';

class UserPreview extends StatelessWidget{
  String fullName='',organization='',empId='',mobile='',email='',idCardPath='';
  // Constructor
  UserPreview(String fullName,String organization,String empId,String mobile,String email,String idCardPath){
    this.fullName = fullName;
    this.organization = organization;
    this.empId = empId;
    this.mobile = mobile;
    this.email = email;
    this.idCardPath = idCardPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text("Regisration Preview")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // ID Card show with Image Preview
            FlatButton(
                onPressed: (){
                  Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context){
                  return PhotoView(
                    imageProvider: AssetImage(idCardPath),
                  );
                })
      );},
                child: Image(image: AssetImage(idCardPath))
      ),

      Center(
      child:Text("Registration Details"),
      heightFactor: 2.5,
      ),
      Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.baseline,

      border: TableBorder.all(
      color: Colors.white54,
      style: BorderStyle.solid,
      ),
      children: [
      TableRow(
      children: <Widget>[
      TableCell(child: Text("Full Name : ")),
      TableCell(child: Text(fullName)),
      ],
      ),
      TableRow(
      children: [
      TableCell(child: Text("Organization : ")),
      TableCell(child: Text(organization)),
      ],
      ),
      TableRow(
      children: [
      TableCell(child: Text("Employee ID : ")),
      TableCell(child: Text(empId)),
      ],
      ),
      TableRow(
      children: [
      TableCell(child: Text("Mobile Number : ")),
      TableCell(child: Text(mobile)),
      ],
      ),
      TableRow(
      children: [
      TableCell(child: Text("Email Address : ")),
      TableCell(child: Text(email)),
      ],
      ),
      ],
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
              child: Text("PRINT"),
              onPressed: (){
                // PRINT the Registration Page as a PDF and download it on the USER System / Mobile
                
              }
              ),
          RaisedButton(
              child: Text("EDIT"),
              onPressed: (){
                Navigator.pop(context);
              }
              )
        ],
      ),

      ],
      )

      ),
    );
  }
}