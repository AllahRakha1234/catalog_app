

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Allah Rakha"),
                accountEmail: Text("allahrakha@gmail.com"),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/arzz.jpeg") // Image Provider
                ),
              )
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.white,),
            title: Text("Home", style: TextStyle(fontSize: 16, color: Colors.white),),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
            title: Text("Profile", style: TextStyle(fontSize: 16, color: Colors.white),),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail, color: Colors.white,),
            title: Text("Email me", style: TextStyle(fontSize: 16, color: Colors.white),),
          )
        ],
      ),
    );
  }
  
}