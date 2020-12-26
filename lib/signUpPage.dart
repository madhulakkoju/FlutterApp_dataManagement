
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_learning/signUpPage.dart';

void main() => runApp(SignUpPage());

class SignUpPage extends StatelessWidget{
  static const String _title = "Company";
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:"SignUpPage",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body:  Center(child:SignUpWidget()),
      ),
    );
  }
}

class SignUpWidget extends StatefulWidget {
  SignUpWidget({Key key}) :super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignUpWidgetState();
  }
}

class SignUpWidgetState extends State<StatefulWidget>{
  final _formKey = GlobalKey<FormState>();
  int day = 1,month = 1,year = 1960 ;
  @override
  Widget build(BuildContext context){
    String _name,_email,_password1,_password2;
    return Form(
      key:_formKey,
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start ,
            children: <Widget>[

              Center(child:Text("REGISTER", style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),) ,),

              // Name
              TextFormField(

                decoration: InputDecoration(
                  icon: Icon(Icons.perm_identity_outlined),
                  hintText: "Enter your Full Name",
                  labelText: "Name",
                ),
                validator: (value){
                  // validate the input string
                  return null;
                },
                autovalidate: true,
                autocorrect: false,
                onSaved: (value){
                  _name = value;
                } ,
                onFieldSubmitted: (value){
                  // Add functionality when data submitted
                } ,

              ),

              // email address

              TextFormField(
                decoration: InputDecoration(
                  labelText: "e-mail address",
                  hintText: "Enter your email address",
                  icon: Icon(Icons.email) ,
                ),
                validator: (value){
                  if(!value.contains("@")){
                    return "Enter valid email address";
                  }
                  return null;
                },
                autovalidate: true,
                autocorrect: false,
                onSaved: (value){
                  _email = value;
                } ,
                onFieldSubmitted: (value){
                  // Add functionality to submit the data when submitted
                },
              ),
              // mobile number
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Mobile number",
                  hintText: "Enter your Mobile number",
                  icon: Icon(Icons.call ) ,
                ),
                validator: (value){
                  if(value.length != 10){
                    return "Enter valid mobile number";
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                autovalidate: true,
                autocorrect: false,
                onSaved: (value){
                  _email = value;
                } ,
                onFieldSubmitted: (value){
                  // Add functionality to submit the data when submitted
                },
              ),
              // Date - Month - year (Birth)


              //Text("DDMMYYYY:"),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "DDMMYYYY",
                  labelText:"Date of Birth",
                  icon: Icon(Icons.calendar_today_rounded),
                ),
                //keyboardType: TextInputType.phone,
                validator: (value){return null;},
              ),




              /*
          DropdownButton<int>(

        value: day,
        onChanged: (int newValue) {
          setState(() {
            day = newValue;
          });
        },
        items: <int>[1,2,3,4,5,6,7,8,9,0]
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
      )
        */







              //password
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "set a password",
                  icon: Icon(Icons.vpn_key_sharp) ,
                ),
                validator: (value){
                  if(value.length < 5){
                    return "set a valid - password";
                  }
                  return null;
                },
                obscureText: true,
                autovalidate: true,
                autocorrect: false,
                onSaved: (value){
                  _password1 = value;
                } ,
                onFieldSubmitted: (value){
                  // Add functionality to submit the data when submitted
                },
              ),
              //confirm password
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  hintText: "set a password",
                  icon: Icon(Icons.vpn_key_sharp) ,
                ),
                validator: (value){
                  if(value.length < 5){
                    return "set a valid -- password";
                  }
                  return null;
                },
                obscureText: true,
                //autovalidate: true,
                autocorrect: false,
                onSaved: (value){
                  _password2 = value;
                } ,
                onChanged: (value){
                  _password2 = value;
                },
                onFieldSubmitted: (value){
                  // Add functionality to submit the data when submitted
                },
              ),
              //Register button
              RaisedButton(
                child: Text("Register"),
                onPressed: (){
                  var form = _formKey.currentState;
                  if(form.validate()) {
                    form.save();
                    form.reset();

                    // Add functionality to do the Registration process and
                    // return the expected result about created account or not.

                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}








