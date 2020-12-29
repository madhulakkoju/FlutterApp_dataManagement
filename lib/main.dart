
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';


void main(){
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  static String profilePicEmpty = "assets/images/noPicture.jpg";
  static String profilePic = "assets/images/profilepic.jpg";
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
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
                title: Text("Profile Page")
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
                        Text("Body of Profile pajuige"),
                        Center(
                            child: FloatingActionButton(
                              child: Image(
                                image: AssetImage(ProfilePage.profilePic),
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
                                              Image(
                                                image: AssetImage(ProfilePage.profilePic),
                                              )
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
                                                      imageProvider: AssetImage(ProfilePage.profilePic),

                                                     );
                                                }),
                                              );}
                                          ),
                                          TextButton(
                                            child: Text("Delete"),
                                            onPressed: (){
                                              ProfilePage.profilePic = ProfilePage.profilePicEmpty;
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

