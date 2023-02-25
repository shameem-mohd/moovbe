import 'package:flutter/material.dart';
import 'package:moovbe_bus_project/ui/Home/HomePage.dart';
import 'package:moovbe_bus_project/ui/Home/ScreenLogin.dart';
import 'package:moovbe_bus_project/ui/Widgets/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future.delayed(const Duration(seconds: 3), () {
      if (prefs.containsKey('token')) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const ScreenLogin()),
            (route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    checkLogin(context);
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: RedColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: Container(),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .29,
            width: MediaQuery.of(context).size.width * .6,
            decoration: const BoxDecoration(
                // color: Colors.yellow,
                image: DecorationImage(
                    image: AssetImage("assets/moovbe.png"),
                    fit: BoxFit.contain)),
          ),
          SizedBox(
            height: mHeight * .27,
          ),
          SizedBox(
            height: mHeight * .07,
            width: mWidth * .8,
            child: ElevatedButton(
                onPressed: () {
                  checkLogin(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: primaryColor, //background color of button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: RedColor),
                )),
          ),
          SizedBox(
            height: mHeight * .03,
          )
        ],
      ),
    );
  }
}
