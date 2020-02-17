import 'package:flutter/material.dart';
import 'package:flutterapp_registerapp1/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {    // BuildContext context is the place to start

    return MaterialApp(home: Home());

  }
}
class Home extends StatefulWidget {
  @override

  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> { // call the state ‘Home’

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

          child: Container(

            decoration: BoxDecoration(

              gradient: RadialGradient(colors: [Colors.white, Colors.blue.shade600], radius: 1.0),

            ), // create container in the Safearea ... BoxDecoration is background

            child: Center(

              child: Column(

                mainAxisSize: MainAxisSize.min,

                children: <Widget>[

                  showLogo(),

                  showAppName(),

                  SizedBox(

                    height: 8.0,

                  ),

                  showButton()

                ],

              ),

            ),

          )),

    );

  }
  Widget showLogo() {

    return Container(

      width: 200.0, // Control the logo size

      height: 200.0,

      child: Image.asset('assets/images/logo.png'),

    );

  }
  Widget showAppName() {

    return Text(

      'CSC231 Mobile App Development',

      style: TextStyle(

        fontSize: 20.0,

        color: Colors.deepPurple.shade900, // color of the text

        fontWeight: FontWeight.bold,

        fontStyle: FontStyle.italic,fontFamily: 'Railway', // the font name already added in the pubspec.yaml

      ),

    );

  }
  Widget signInButton() { // another widget is a button

    return RaisedButton( // 3D button

      child: Text('Sign In'),

      onPressed: () {},

    );

  }
  Widget signUpButton() {

    return OutlineButton(

      child: Text('Sign Up'),

      onPressed: () {

        print('You Click Sign Up');

        MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Register());

        Navigator.of(context).push(materialPageRoute);

      }, // vv route with “push” method will automatic generate the back button

    );

  }




  Widget showButton() {

    return Row(

      mainAxisSize: MainAxisSize.min,

      children: <Widget>[

        signInButton(),

        SizedBox( // just a space between button

          width: 4.0,

        ), //space between widget rows

        signUpButton()

      ],

    );

  }




}







