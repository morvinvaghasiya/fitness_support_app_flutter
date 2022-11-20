import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../res/palette.dart';
import '../utils/sign_in.dart';

import 'name_page.dart';

/// Displays the `LoginPage`.
///
/// Uses Google Sign In for user authentication.
///
/// **Connected pages:**
///
/// - `NamePage` (forward)
///
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Palette.loginBackground);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palette.loginBackground,
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Text(
              "Anna",
              style: TextStyle(
                fontFamily: 'TitilliumWeb',
                fontSize: screenSize.width / 8.5,
                color: Colors.black,
              ),
            ),
            Image.asset(
              'assets/images/3.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              color: Palette.loginBackground,
              colorBlendMode: BlendMode.darken,
              //semanticsLabel: 'Cover Image',
            ),
            // WebsafeSvg.asset(
            //   'assets/images/cover1.svg',
            //   width: MediaQuery.of(context).size.width,
            //   semanticsLabel: 'Cover Image',
            // ),
            _googleSignInButton(),
          ],
        ),
      ),
    );
  }

  /// Generates Google Sign In button widget
  Widget _googleSignInButton() {
    return DecoratedBox(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          color: Colors.white),
      child: OutlineButton(
        highlightColor: Colors.grey[100],
        splashColor: Colors.grey[100],
        color: Colors.grey[100],
        onPressed: () {
          // Navigates to the NamePage if the authentication
          // is successful.
          signInWithGoogle().then((user) {
            if (user != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return NamePage();
                  },
                ),
              ).then((_) {
                // Sets the status bar color of the one set to this page
                // if an user comes back to this page.
                FlutterStatusbarcolor.setStatusBarColor(
                    Palette.loginBackground);
                FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
              });
            }
          }).catchError(
            (e) => print('SIGN IN ERROR: $e'),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage("assets/images/google_logo.png"),
                  height: 35.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
