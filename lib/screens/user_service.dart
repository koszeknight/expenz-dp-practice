import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
// methode to store the user name and user email in shared pref

  static Future<void> storeUserDetails(
      {required String userName,
      required String email,
      required String password,
      required String confirmedPassword,
      required BuildContext context}) async {
    //if the users passwird and the confirm password are same then the users name and email

    try {
      //check weather the user entered password and the confirm password are the same

      if (password != confirmedPassword) {
        //show  a message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password and confirm Password do not match"),
          ),
        );
        return;
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("User Name", userName);
      await prefs.setString("email", email);

      //show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User Details stored Successfully")));
    } catch (err) {
      err.toString();
    }
  }
}
