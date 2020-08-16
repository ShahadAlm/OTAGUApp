import 'package:flutter/material.dart';
import 'drawer_header_content.dart';
//I think I should change this to stateful widget!
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    //ClipRRect to make the drawer corner circular
    return  ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(100.0),
        // bottomRight: Radius.circular(100.0),
      ),
      child:
      Drawer(
        elevation: 20.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: screenHeight / 2 * 0.7,
              child: DrawerHeader(
                decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/WallPaper.jpg"),
                      fit: BoxFit.fill),
                ),
                child: DrawerHeaderContent(),
              ),
            ),
            Expanded(
              child: ListView(children: <Widget>[
                ListTile(
                  title: Text("Notifications"),
                  trailing: Icon(Icons.notifications, color: Colors.deepOrange),
                  onTap: () {
                    // Pushing a named route
                    //Navigator.of(context).pushNamed(
                      //'/notificationPage',
                      //if we want to push data we push data in argument
                      //arguments: '',
                //    );

                  },
                ),
                new Divider(height: 5.0),
                ListTile(
                  title: Text(
                    "Interests",
                  ),
                  trailing: Icon(
                    Icons.lightbulb_outline,
                    color: Colors.deepOrange,
                  ),
                  onTap: () {
                    // Pushing a named route
                    Navigator.of(context).pushNamed(
                      '/InterestPage',
                      //if we want to push data we push data in argument
                      //arguments: '',
                    );
                  },
                ),
                new Divider(height: 5.0),
                ListTile(
                  onTap: () {
                    // Pushing a named route
                    //Navigator.of(context).pushNamed(
                  //    '/WalletAndCoinsPage',
                      //if we want to push data we push data in argument
                      //arguments: '',
                 //   );
                  },
                  title: Text(
                    "Wallet/Coins",
                  ),
                  trailing: Icon(Icons.account_balance_wallet,
                      color: Colors.deepOrange),

                  subtitle: Text(
                    "0 SR",
                  ),
                ),
                new Divider(height: 5.0),
                ListTile(
                  title: Text(
                    "About OTAGU",
                  ),
                  trailing: Icon(
                    Icons.accessibility,
                    color: Colors.deepOrange,
                  ),
                  onTap: () {

                  },
                ),
                new Divider(height: 5.0),
                ListTile(
                  title: Text("Settings"),
                  trailing: Icon(Icons.settings, color: Colors.deepOrange),
                ),
                new Divider(height: 5.0),
                ListTile(
                  title: Text("Privacy/policy"),
                  trailing:
                  Icon(Icons.branding_watermark, color: Colors.deepOrange),
                ),
                new Divider(height: 5.0),
                ListTile(
                  title: Text("Contact Us"),
                  trailing: Icon(Icons.contact_mail, color: Colors.deepOrange),
                ),
                new Divider(height: 5.0),
                ListTile(
                  title: Text(
                    "العربية",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Text("Language"),
                  //subtitle: Text("العربية"),

                  trailing: Icon(Icons.language, color: Colors.deepOrange),
                ),
                ListTile(
                  title: Text("Sign up"),
//                trailing: Icon(Icons.out, color: Colors.deepOrange),
                ),



              ],),
            )
          ],
        ),
      ),

//           ListView(
//            padding: EdgeInsets.zero,
//            children: <Widget>[
//              //drawer header container
//              Container(
//                height: screenHeight / 2 * 0.7,
//                child:
//                //the header if the user is not signed in yet
//                new
//                 DrawerHeader(child:
//                 DrawerHeaderBeforeSignIn(),),
//                //the header background
//                decoration: new BoxDecoration(
//                  image: DecorationImage(
//                      image: AssetImage("assets/images/WallPapers/WallPaper.jpg"),
//                      fit: BoxFit.fill),
//                ),
//              ),
//              //the drawer list elements
//              ListTile(
//                title: Text("Notifications"),
//                trailing: Icon(Icons.notifications, color: Colors.deepOrange),
//                onTap: () {
//                  // Pushing a named route
//                  Navigator.of(context).pushNamed(
//                    '/notificationPage',
//                    //if we want to push data we push data in argument
//                    //arguments: '',
//                  );
//
//                },
//              ),
//              new Divider(height: 5.0),
//              ListTile(
//                title: Text(
//                  "Interests",
//                ),
//                trailing: Icon(
//                  Icons.lightbulb_outline,
//                  color: Colors.deepOrange,
//                ),
//                onTap: () {
//                  // Pushing a named route
//                  Navigator.of(context).pushNamed(
//                    '/InterestPage',
//                    //if we want to push data we push data in argument
//                    //arguments: '',
//                  );
//                },
//              ),
//              new Divider(height: 5.0),
//              ListTile(
//                onTap: () {
//                  // Pushing a named route
//                  Navigator.of(context).pushNamed(
//                    '/WalletAndCoinsPage',
//                    //if we want to push data we push data in argument
//                    //arguments: '',
//                  );
//                },
//                title: Text(
//                  "Wallet/Coins",
//                ),
//                trailing: Icon(Icons.account_balance_wallet,
//                    color: Colors.deepOrange),
//
//                subtitle: Text(
//                  "0 SR",
//                ),
//              ),
//              new Divider(height: 5.0),
//              ListTile(
//                title: Text(
//                  "About OTAGU",
//                ),
//                trailing: Icon(
//                  Icons.accessibility,
//                  color: Colors.deepOrange,
//                ),
//                onTap: () {
//
//                },
//              ),
//              new Divider(height: 5.0),
//              ListTile(
//                title: Text("Settings"),
//                trailing: Icon(Icons.settings, color: Colors.deepOrange),
//              ),
//              new Divider(height: 5.0),
//              ListTile(
//                title: Text("Privacy/policy"),
//                trailing:
//                Icon(Icons.branding_watermark, color: Colors.deepOrange),
//              ),
//              new Divider(height: 5.0),
//              ListTile(
//                title: Text("Contact Us"),
//                trailing: Icon(Icons.contact_mail, color: Colors.deepOrange),
//              ),
//              new Divider(height: 5.0),
//              ListTile(
//                title: Text(
//                  "العربية",
//                  style: TextStyle(fontWeight: FontWeight.bold),
//                ),
//                leading: Text("Language"),
//                //subtitle: Text("العربية"),
//
//                trailing: Icon(Icons.language, color: Colors.deepOrange),
//              ),
//              ListTile(
//                title: Text("Sign up"),
////                trailing: Icon(Icons.out, color: Colors.deepOrange),
//              ),
//            ],
//          ),
    );

  }



}