import 'package:expenz/Services/user_service.dart';
import 'package:expenz/screens/onboard_screen.dart';
import 'package:expenz/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //   return MaterialApp(
    //     title: "Expenz",
    //     debugShowCheckedModeBanner: false,
    //     theme: ThemeData(
    //       fontFamily: "Inter",
    //     ),

    //     home: OnboardingScreen(),
    //     // home: Scaffold(
    //     //   body: Center(
    //     //     child: Text(
    //     //       "Hello Flutter",
    //     //       style: TextStyle(fontSize: 20),
    //     //     ),
    //     //   ),
    //     // ),
    //   );
    // }

    return FutureBuilder(
        future: UserServices.checkUsername(),
        builder: (context, snapshot) {
          //if the snapshot is still waiting
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            //here the hasUserName will be sent to true of the data is there in hthe snaphot otherwise false;
            bool hasUserName = snapshot.data ?? false;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: "inter"),
              home: Wrapper(showMainScreen: hasUserName),
            );
          }
        });
  }
}
