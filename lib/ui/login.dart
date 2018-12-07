import 'package:flutter/material.dart';
import './quiz_select.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth=FirebaseAuth.instance;
final GoogleSignIn _googleSignIn=new GoogleSignIn();


class Login extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      
      return new LoginState();
    }
}

class LoginState extends State<Login>{
  FirebaseUser user;
  Future<FirebaseUser> _googleSignin() async{
      GoogleSignInAccount googleSignInAccount=await _googleSignIn.signIn().catchError((onError){
        print("Error $onError");
      });

      if(googleSignInAccount!=null){
        GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
      
      

      user= await _auth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken).catchError((onError){
          print("Error $onError");
        });
      if(user!=null){
      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new quizregister(_googleSignIn,googleSignInAccount)));
      return user;
      }
      }
      return null;
    }
  @override
    Widget build(BuildContext context) {
      SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Calculazzi",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Color(0xFF4B0082),
        ),
        body:Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
                Hero(
                  tag: 'Calculazzi',
                  child: new CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 30.0,
                    child: Image.asset('images/quiz.png'),
              ),
            ),
      new Padding(padding: EdgeInsets.only(top: 20.0),),
      new TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 10.0, 20.0),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(23.0))
        ),
      ),
      new Padding(padding: EdgeInsets.only(top:20.0),),
      new TextFormField(
        obscureText: true,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(25.0, 10.0, 10.0, 20.0),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(23.0)),
        ),
      ),
      new Padding(padding: EdgeInsets.only(top:20.0),),
      new RaisedButton(
        onPressed: () {}/*{
        Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new quizregister()));
        }*/,
        padding: EdgeInsets.symmetric(vertical: 16.0),
        elevation: 2.0,
        color: Color(0xFF4B0082),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(23.0)),
          child: new Text("Sign In",style:new TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
        )
        ),
        ),
        FlatButton(
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.black54),
          ),
          padding: EdgeInsets.only(top: 13.0, bottom: 10.0),
          onPressed: () {},
        ),
        new Container(
          alignment: FractionalOffset.center,
          padding: const EdgeInsets.all(20.0),
          child: new Text(
            "- or sign in with - ",
            style: TextStyle(color: Colors.black54),
          ),
        ),
        new IconButton(
          iconSize: 70.0,
          icon: new Image.asset('images/google.png'),
          splashColor: Colors.white,
          onPressed: () =>_googleSignin() ,
        ),
        FlatButton(
          child: Text(
            'Don\'t have an account?  Sign Up',
            style: TextStyle(color: Colors.black54),
          ),
          padding: EdgeInsets.only(top: 10.0),
          onPressed: () {},
        ),
            ],
          ),
        )
      );
    
    
    
    }

}