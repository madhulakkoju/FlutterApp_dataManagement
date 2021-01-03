import 'package:flutter/material.dart';



class LoginPage extends StatelessWidget{
  static const String _title = "Company";
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "LoginPage",
      home: Scaffold(
        appBar: AppBar(
            title: const Text(_title)
        ),
        body: Center(child:LoginWidget()),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget{
  LoginWidget({Key key}):super(key: key);
  @override
  State<StatefulWidget> createState(){
    return LoginWidgetState();
  }
}

class LoginWidgetState extends State<StatefulWidget>{
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    String _email="",_password="";
    return Form(
        key: formKey,
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
              // email Address field
              TextFormField(

                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Enter your email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if(!value.contains("@")){
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value){
                  _email = value;
                },
                onFieldSubmitted: (value){
                  // Add functionality for the login details submission
                },
                autovalidate: true,
                autocorrect: false,
              ),
              // password field
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  hintText: 'Enter your Password',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the password';
                  }
                  if(value.length < 7){
                    return 'Please enter valid password';
                  }
                  return null;
                },
                onSaved: (value){
                  _password = value;
                },
                onFieldSubmitted: (value){
                  // Add functionality for the login details submission
                },
                autovalidate: true,
                autocorrect: false,
              ),
              // submit button
              Center(
                  child: RaisedButton(
                    child: Text("Login"),
                    onPressed: (){
                      var form = formKey.currentState;
                      if(form.validate()){
                        form.save();
                      }
                      print(_email + "  " + _password);
                      // perform Authentication

                    },
                  )
              ),
              Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("New User?"),
                        OutlineButton(
                          child: Text("click Me"),
                          onPressed: (){
                            print("New User");
                            // Add functionality to open SignUp page
                          },

                        ),
                      ]
                  )
              ),
            ],

          ),
        )
    );
  }

}

