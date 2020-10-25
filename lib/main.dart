import 'package:flutdatabase/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'models/User.dart';

List _users;


void main() async {
  var db=new DatabaseHelper();

  //Add user to database
     await db.saveUser(new User("Ana","anita"));

  //Get all users
   _users=await db.getAllUsers();
   for(int i;i<_users.length;i++){
     User user= User.map(_users[i]);
     print("Username: ${user.username},User ID: ${user.id}");
   }

   //get gount
  int count=await db.getCount();

  //get user
  User ana=await db.getUser(1);

  //Delete user
 // int del=await db.deleteUser(1);

  //Update user
  //await db.updateUser(ana);

  //retrieving a user

 /* User anaUpdated=User.fromMap({
    "username" : "Updatedana",
    "password" :"updatedPassword",
    "id" :1
  });
*/
  runApp(new MaterialApp(
    title:'Database' ,
    home: new Home(),
  ));
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),

      body: new ListView.builder(
          itemCount: _users.length,
          itemBuilder:(_,int position){
              return new Card(
                color: Colors.greenAccent,
                elevation:2.0 ,
                child: new ListTile(
                  leading: new CircleAvatar(
                    child: new Text("${User.fromMap(_users[position]).username.substring(0,1)}")
                  ),
                  title: new Text("User: ${User.fromMap(_users[position]).username}"),
                  subtitle: new Text("Id:${User.fromMap(_users[position]).id}"),
                ),//how the shadows arround the card gonna show
              );

          } )
    );
  }
}
