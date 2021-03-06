
import 'package:flutter_app_learning/userPreview.dart';

import 'MediaAccessSupport.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEmployeeData extends StatefulWidget{
  AddEmployeeData({Key key}):super(key:key);
  @override
  State<StatefulWidget> createState(){
    return AddEmployee();
  }
}

class AddEmployee extends State<StatefulWidget>{
  final _employeeDataKey = GlobalKey<FormState>();
  static String profilePicture = "assets/images/noPicture.jpg";
  String fullName='',organization='',empId='',mobile='',email='',idCardPath = profilePicture;

  @override
  Widget build(BuildContext context) {
    double pagewidth = MediaQuery.of(context).size.width ;
    double pageHeight = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Form(
        key: _employeeDataKey,
     child: Column(
       children: <Widget>[

         // ID card picture Capture or Upload
         Center(
             child: GestureDetector (
                child: CircleAvatar(
               radius : 30.0,
                 backgroundImage: AssetImage(profilePicture),
             ) ,
               onTap: (){
                  print("ID upload");
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context){
                        return Scaffold(
                          body: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image(
                            image: AssetImage(profilePicture),
                                width: pagewidth,
                                height: pageHeight/2,
                          ),
                              Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // Camera
                              GestureDetector(
                                child: CircleAvatar(
                                  radius: pagewidth/6.7,
                                  child: Text("CAMERA"),
                                ),
                                onTap: (){
                                  MediaGetter.captureImage();
                                  // camera has to be opened and capturing should take place
                                },
                              ),
                              // Upload
                              GestureDetector(
                                child: CircleAvatar(
                                  radius: pagewidth/6.7,
                                  child: Text("UPLOAD"),
                                ),
                                onTap: (){
                                  MediaGetter.getSingleImage();
                                  // Upload file dialog should open and access to gallery has to be given.
                                },
                              ),
                            ],
                          ),
                            ],
                          )
                          )
                        ); // return the page constructor where the ID is uploaded or captured.
                      }
                    )
                  );
                  },
             ),
           /*ClipOval(
               clipBehavior: Clip.,
                 child: Container(
               height: 100.0,
               width: 100.0,
               child: FlatButton(
             child: ClipOval(
               child: Image(
               image: AssetImage("assets/images/noPicture.jpg"),
               fit: BoxFit.scaleDown,
             ),),
             onPressed: (){},

           ),
             )
           ),*/
         ),
         // FullName
         TextFormField(
           decoration: InputDecoration(
             icon: Icon(Icons.person) ,
             labelText: "Full Name",
             hintText: "Enter Employee Full Name"
           ),
           textCapitalization: TextCapitalization.words,
           keyboardType: TextInputType.name,
           validator: (value){},
           onChanged: (value){
             print(value);
           },
           onSaved: (value){
             fullName = value;
             // Save this data into the USER constructor for Object creation.
           },
           onFieldSubmitted: (value){},
           autocorrect: false,
           autovalidate: true,
           style: TextStyle(
             fontSize: 20.0,

           ),
         ),

         //OrganizationName
         TextFormField(
           decoration: InputDecoration(
             icon: Icon(Icons.apartment ),
             labelText: "Organization Name",
             hintText: "Enter Organization Name",
           ),
           textCapitalization: TextCapitalization.words,
           keyboardType: TextInputType.name,
           validator: (value){},
           onFieldSubmitted: (value){},
           onChanged: (value){},
           autovalidate: true,
           autocorrect: false,
           onSaved: (value){
             organization = value;
             // Save this data into the USER constructor for Object creation.
           },

         ),

         //Employee Id No.
         TextFormField(
           decoration: InputDecoration(
             icon: Icon(Icons.assignment_ind ),
             labelText: "Employee ID",
             hintText: "Enter Employee ID",
           ),
           keyboardType: TextInputType.name,
           validator: (value){},
           onFieldSubmitted: (value){},
           onChanged: (value){},
           autovalidate: true,
           autocorrect: false,
           onSaved: (value){
             empId = value;
             // Save this data into the USER constructor for Object creation.
           },
         ),

         //Mobile No
         TextFormField(
           decoration: InputDecoration(
             icon: Icon(Icons.phone ),
             labelText: "Mobile Number",
             hintText: "Enter Employee's Mobile Number",
           ),

           keyboardType: TextInputType.phone,
           validator: (value){},
           onFieldSubmitted: (value){},
           onChanged: (value){},
           autovalidate: true,
           autocorrect: false,
           onSaved: (value){
             mobile = value;
             // Save this data into the USER constructor for Object creation.
           },
         ),

         //email address
         TextFormField(
           decoration: InputDecoration(
             icon: Icon(Icons.email_sharp ),
             labelText: "Email Address",
             hintText: "Enter Employee's email address",
           ),
           keyboardType: TextInputType.name,
           validator: (value){},
           onFieldSubmitted: (value){},
           onChanged: (value){},
           autovalidate: true,
           autocorrect: false,
           onSaved: (value){
             email = value;
             // Save this data into the USER constructor for Object creation.
           },
         ),

         // Preview button and Submit button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // preview button
              ElevatedButton(
                  onPressed: (){
                    setState(() {

                    });
                    // open a preview page to show athe registration details of the Applicant / Employee
                    var form = _employeeDataKey.currentState;
                    this.showPreview(form);
                  },
                  child: Text("Preview"),
              ),

              // submit button
              ElevatedButton(
                  onPressed: (){},
                  child: Text("Submit ")
              ),
            ],
          ),

       ],
     ),
    )
    );
  }

  void showPreview(var form){
    if(! form.validate()){
      print("Wrong inputs upon preview button Tap");
    }
    form.save();

    Navigator.push(context,MaterialPageRoute(builder: (context){
      return UserPreview(fullName,organization,empId,mobile,email,idCardPath);
    }));

  }
}