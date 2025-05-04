import 'package:expenz/contants/colors.dart';
import 'package:expenz/contants/contants.dart';
import 'package:expenz/screens/main_screen.dart';
import 'package:expenz/Services/user_service.dart';
import 'package:expenz/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //for the check box
  bool _remeberMe = false;
  //form Key for the form validation
  final _formkey = GlobalKey<FormState>();

  //controller for the text form fieldds

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(kDefalutPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter your \nPersonal Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //form field for the user name
                      TextFormField(
                          controller: _userNameController,
                          validator: (value) {
                            //check wheather the valid User Name
                            if (value!.isEmpty) {
                              return "Please Enter Name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20))),

                      SizedBox(
                        height: 20,
                      ),

                      //form field for the Email

                      TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            //check wheather the valid User Name
                            if (value!.isEmpty) {
                              return "Please Enter Email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20))),
                      SizedBox(
                        height: 20,
                      ),
                      //form field for the Password

                      TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            //check wheather the valid User Name
                            if (value!.isEmpty) {
                              return "Please Enter Password";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20))),
                      SizedBox(
                        height: 20,
                      ),
                      //form field for the  Confirm Password

                      TextFormField(
                          controller: _passwordConfirmController,
                          validator: (value) {
                            //check wheather the valid User Name
                            if (value!.isEmpty) {
                              return "Please Enter thame Password";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Confirm Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20))),

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Remember Me for the Next time",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: kGrey),
                          ),
                          Expanded(
                              child: CheckboxListTile(
                                  activeColor: kMainColor,
                                  value: _remeberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _remeberMe = value!;
                                    });
                                  })),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () async {
                            if (_formkey.currentState!.validate()) {
                              //form is valid , process
                              String userName = _userNameController.text;
                              String email = _emailController.text;
                              String password = _passwordController.text;
                              String confirmedPassword =
                                  _passwordConfirmController.text;

                              // save the user name and email in the device storage
                              await UserServices.storeUserDetails(
                                  userName: userName,
                                  email: email,
                                  password: password,
                                  confirmedPassword: confirmedPassword,
                                  context: context);
                              // print(
                              //     "$userName $email $password $confirmedPassword");
                              // navigate to the main Page
                              if (context.mounted) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const MainScreen();
                                }));
                              }
                            }
                          },
                          child: CustomButton(
                              buttonName: "Next", buttonColor: kMainColor))
                    ],
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
