import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../ui/homepagebody.dart';
import '../ui/settingsbody.dart';


class quizregister extends StatefulWidget{
  GoogleSignInAccount googleSignInAccount;
  GoogleSignIn _googleSignIn;
  quizregister(GoogleSignIn _googleSignIn,GoogleSignInAccount googleSignInAccount){
    this.googleSignInAccount=googleSignInAccount;
    this._googleSignIn=_googleSignIn;
  }
  @override
    State<StatefulWidget> createState() {
      return new quizregisterState(_googleSignIn,googleSignInAccount);
    }
}
class quizregisterState extends State<quizregister>{
  GoogleSignInAccount googleSignInAccount;
  GoogleSignIn _googleSignIn;
  quizregisterState(GoogleSignIn _googleSignIn,GoogleSignInAccount googleSignInAccount){
    this.googleSignInAccount=googleSignInAccount;
    this._googleSignIn=_googleSignIn;
  }
  int currentTab = 0;
  Widget currentPage;
  Home home;
  Settings settings;
  List<Widget> pages;
  @override
    void initState() {
      home = Home();
      settings = Settings(_googleSignIn,googleSignInAccount);
      pages = [home, settings];
      currentTab=0;
      currentPage=home;
      super.initState();
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
        body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: (int index) {
            setState(() {
              currentTab = index;
              currentPage = pages[index];
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Account"),
            ),
          ]),
      );
    }
}