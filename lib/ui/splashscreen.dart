import 'package:flutter/material.dart';
import 'dart:async';
import './login.dart';

class SplashScreen extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
      return new SplashScreenState();
    }
}

class SplashScreenState extends State<SplashScreen>{

  @override
    void initState() {
      super.initState();
      Timer(Duration(seconds: 7), onClose);
    }
     void onClose(){
         Navigator.of(context).pushReplacement(new PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => new Login(),
        transitionDuration: const Duration(seconds: 2),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
      }
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Container(decoration: BoxDecoration(color: Color(0xFF4B0082)),),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                new Expanded(
                  flex: 2,
                  child: new Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50.0,
                          child: new Icon(Icons.question_answer,
                          color: Colors.redAccent,
                          size: 50.0,
                          ),
                          ),
                          new Padding(padding: EdgeInsets.only(top: 10.0),),
                          new Text("Calculazzi",
                          style: new TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2.0))
                      ],
                    ),
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new  CircularProgressIndicator(),
                      new Padding(padding: EdgeInsets.only(top: 20.0),),
                      new Text("Play and Earn \n  Paytm cash",style: new TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],
                  ),
                )
          ],)
          ],
        ),
      );
     
    }
} 