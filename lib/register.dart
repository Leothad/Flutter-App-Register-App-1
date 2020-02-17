import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
// Explicit
  final formKey = GlobalKey<FormState>(); // new variable for the validation
  String nameString, emailString, passwordString;  // String variable for Entry data
// Method
  Widget registerButton() {
    return IconButton(
        icon: Icon(Icons.cloud_upload), // download icon from google material.io
        onPressed: () {
          print('Upload is clicked');
          if (formKey.currentState
              .validate()) { // Validate by check state of the input text = all text are filled work with ‘validator:’
            formKey.currentState
                .save(); // save the state of the input text fields to defined String variables
            print(
                'name = $nameString, email = $emailString, password = $passwordString'); // Print out the strings     }
          }

        }
          );
        }



        Widget nameText() {
      // the first input text field
      return TextFormField(
        style: TextStyle(color: Colors.purple), // color of input text
        decoration: InputDecoration(
          icon: Icon(
            Icons.face, // download icon from google material.io
            color: Colors.purple.shade500, // icon's color
            size: 45, //icon's size
          ),
          labelText: 'USERNAME :',
          labelStyle: TextStyle(
            //style of lable text
              color: Colors.purple.shade500,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
          helperText: 'Enter your user name',
          helperStyle: TextStyle(
            // style of helpertext
            color: Colors.purple,
            fontStyle: FontStyle.italic,
          ),
        ),validator: (String value){
        if (value.isEmpty) { // validate the user name value must not empty
          return 'User name is a required filed. Cannot leave it blank';
        } else {
          return 'Hello $value';
        }
      }, onSaved: (String value){
        nameString = value.trim();  // Save trimmed String to nameString
      },
      );
    }


    Widget emailText() {
      // the 2nd input text field
      return TextFormField(keyboardType: TextInputType.emailAddress, //set virtual type
        style: TextStyle(color: Colors.blue.shade700), // color of input text
        decoration: InputDecoration(
          icon: Icon(
            Icons.email, // download icon from google material.io
            color: Colors.blue.shade700, // icon's color
            size: 45, //icon's size
          ),
          labelText: 'E-Mail :',
          labelStyle: TextStyle(
            //style of lable text
              color: Colors.blue.shade700,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
          helperText: 'Enter your e-mail account',
          helperStyle: TextStyle(
            // style of helpertext
            color: Colors.blue.shade700,
            fontStyle: FontStyle.italic,
          ),
        ),validator: (String value){
          if (!((value.contains('@')) && (value.contains('.')))) { //validate email must contain '@' and '.'
            return 'Please enter your valid email';
          } else {
            return 'Hello $value';
          }
        }, onSaved: (String value){
          emailString = value.trim(); // Save trimmed String to emailString
        },
      );
    }


    Widget passwordText() {
      // the 3rd input text field
      return TextFormField(
        style: TextStyle(color: Colors.red), // color of input text
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock, // download icon from google material.io
            color: Colors.red, // icon's color
            size: 45, //icon's size
          ),
          labelText: 'Password :',
          labelStyle: TextStyle(
            //style of lable text
              color: Colors.red,
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
          helperText: 'Enter your secret code more than 7 characters',
          helperStyle: TextStyle(
            // style of helpertext
            color: Colors.red,
            fontStyle: FontStyle.italic,
          ),
        ),validator: (String value){
        if (value.length < 7) { // validate password must longer than 6 character
          return 'Password is too short must more than 7 characters' ;
        } else {
          return null;
        }
      }, onSaved: (String value){
        passwordString = value.trim(); // Save trimmed String to passwordString
      },
      );
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue.shade800,
            title: Text('Register'),
            actions: <Widget>[
              registerButton()
            ], // call method registerButton() from above
          ),
          body: Form(key: formKey,  // stored the values of input text in the variable wrapper
              child: ListView( // input text fields wrapper
                padding: EdgeInsets.all(30.0),
                children: <Widget>[
                  nameText(),
                  emailText(),
                  passwordText(),
                ],
              )
          )
      );
    }
  }