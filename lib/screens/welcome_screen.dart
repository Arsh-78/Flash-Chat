import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/Components/Resable_Button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1)); //setting up listener and controller

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.greenAccent)
        .animate(controller);
    controller
        .forward(); //this is basically procedding the animation forward ,by default the ticker goes from 0 to 1 in fixd number of steps or starting the animation,it id here where you can change the flow of animation to go from 0 to 1 ot 1 to 0 as aminmation generally occurs over a number

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText("Flash Chat",
                        textStyle: TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                        ),
                        speed: Duration(milliseconds: 100))
                  ],
                ),
              ],
            ),
            Reusable_Button(
              text: 'Log In',
              btnColor: Colors.lightBlueAccent,
              onPress: () {
//Go to login screen.
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            SizedBox(
              height: 48.0,
            ),
            Reusable_Button(
              text: 'Register',
              btnColor: Colors.blueAccent,
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
//Go to registration screen.
              },
            ),
          ],
        ),
      ),
    );
  }
}
