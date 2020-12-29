
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

void main() async {

  runApp(ProfilePage());

}

class UserProfile{
  final String name;
  final String emailAddress;
  final String mobileNumber;
  final int birthDate;
  final int birthMonth;
  final int birthYear;
  UserProfile(this.name,this.emailAddress,this.mobileNumber,this.birthDate,this.birthMonth,this.birthYear);
}



class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("build");
    return MaterialApp(
        title: "profilePage",
        home: ProfilePageWidget()
    );
  }
}
class ProfilePageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProfilePageWidgetState();
  }
}
class ProfilePageWidgetState extends State<StatefulWidget>{
  static String profilePicEmpty = "assets/images/noPicture.jpg";
  static String profilePic = "assets/images/profilepic.jpg";
        @override
        Widget build(BuildContext context) {


          return Scaffold(
            appBar: AppBar(
                title: Text("Your Profile")
            ),
            body: Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      // add constraints for viewability and good look.
                    ),
                    child: Column(
                      children: <Widget>[
                        // all the Data to be displayed are to be added as an array to the widget.
                        Center(
                            child: FlatButton(
                              child: Image(
                                width: 100,
                                height: 100,
                                image: AssetImage(profilePic),
                              ),
                              onPressed: () {

                                // open a dialog with the profile picture display
                                showDialog(context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                            "Profile Photo",
                                                style: TextStyle(
                                            fontSize: 14.0,
                                        ),
                                        ),
                                        content:SingleChildScrollView(
                                          child: Column(
                                            children: <Widget>[
                                              FlatButton(
                                                child: Image(
                                                  image: AssetImage(profilePic),
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context){
                                                    return PhotoView(
                                                        imageProvider: AssetImage(profilePic),
                                                      );
                                                  }),
                                                );
                                                }
                                              ),
                                            ],
                                          ),
                                        ) ,
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("Change"),
                                            onPressed: (){
                                              // Functionality to change the picture
                                              // select from the gallery of the mobile
                                              //content://com.android.providers.media.documents/document/



                                            },
                                          ),
                                          TextButton(
                                            child: Text("Open"),
                                              onPressed:(){ Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context){
                                                  return
                                                  /*Column(
                                      children: <Widget>[
                                        ButtonBar(
                                          alignment: MainAxisAlignment.spaceBetween ,
                                          layoutBehavior: ButtonBarLayoutBehavior.constrained,
                                          children: <Widget>[
                                            TextButton.icon(onPressed: (){}, icon: Icon(Icons.arrow_back_outlined), label: null)
                                          ],
                                        ),
                                       PhotoView(
                                      imageProvider: AssetImage(ProfilePage.profilePic),
                                    ),
                                    ]
                                    ) */

                                                    PhotoView(
                                                      imageProvider: AssetImage(profilePic),

                                                     );
                                                }),
                                              );}
                                          ),
                                          TextButton(
                                            child: Text("Delete"),
                                            onPressed: (){
                                              profilePic = profilePicEmpty;
                                              this.setState(() {

                                              });
                                            },
                                          ),
                                          /*
                                          TextButton(

                                            child: Text("close"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),*/
                                        ],
                                      );
                                    });
                                print("bb");

                              },
                            )
                        ),













                        Text("Body End"),
                      ],
                    )

                ),
              ),
            ),
          );
        }
}

