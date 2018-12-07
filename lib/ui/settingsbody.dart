import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../ui/login.dart';

final FirebaseAuth _auth=FirebaseAuth.instance;


class Settings extends StatefulWidget{
  GoogleSignInAccount googleSignInAccount;
  GoogleSignIn _googleSignIn;
  Settings(GoogleSignIn _googleSignIn,GoogleSignInAccount googleSignInAccount){
    this.googleSignInAccount=googleSignInAccount;
    this._googleSignIn=_googleSignIn;
  }
  @override
    State<StatefulWidget> createState() {
      return new SettingState(_googleSignIn,googleSignInAccount);
    }
}
class SettingState extends State<Settings>{
  GoogleSignInAccount googleSignInAccount;
  GoogleSignIn _googleSignIn;
  SettingState(GoogleSignIn _googleSignIn,GoogleSignInAccount googleSignInAccount){
    this.googleSignInAccount=googleSignInAccount;
    this._googleSignIn=_googleSignIn;
  }
  void _logout(){
          //debugPrint(googleSignInAccount.email);
          setState(() {
                      _googleSignIn.signOut();
                      Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new Login()));  
                    });
                    
        }
  
  @override
    Widget build(BuildContext context) {
        return Scaffold(
          body:Center(
            child:Column(
            mainAxisAlignment:MainAxisAlignment.center, 
            children: <Widget>[
            Expanded(
      child: Center(
        child: ListView(
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            new Container(
              height: 250.0,
              padding: EdgeInsets.only(top: 15.0, bottom: 30.0),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.elliptical(150.0, 35.0),
                    bottomRight: const Radius.elliptical(150.0, 35.0)),
                gradient: new LinearGradient(
                    colors: [
                      const Color(0xFF4B0082),
                      const Color(0xFF4B0082),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    stops: [0.0, 0.6],
                    tileMode: TileMode.clamp),
              ),
              margin: new EdgeInsets.only(bottom: 20.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/chris_liverani.jpg'),
                  ),
                  new SizedBox(height: 20.0),
                  new Text("Abhinav Pandey",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 23.0)),
                  new SizedBox(height: 10.0),
                  new Text("Points : 2,400",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 17.0)),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            new Row(
              children: <Widget>[
                new SizedBox(width: 30.0),
                new Text(
                  "ACCOUNT",
                  style: TextStyle(
                      letterSpacing: 1.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0),
                ),
              ],
            ),
            new FlatButton(
              onPressed: () {},
              padding: EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 20.0, right: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(17.0),
                shadowColor: Color.fromRGBO(50, 50, 50, 0.2),
                elevation: 0.5,
                child: MaterialButton(
                  color: Colors.white,
                  minWidth: 300.0,
                  height: 70.0,
                  onPressed: () {
//                  Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Image(
                          alignment: FractionalOffset.centerLeft,
                          image: new AssetImage('images/picture.png'),
                          height: 40.0,
                          width: 50.0),
                      new Container(
                        child: SizedBox(width: 10.0),
                      ),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text("Update Email Address",
                              style: TextStyle(
                                  color: Color(0xFF4B0082),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0)),
                          new Container(
                            child: SizedBox(height: 5.0),
                          ),
                          new Text("${googleSignInAccount.email}",
                              style: TextStyle(
                                  color: Color(0xFF4B0082),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.0)),
                        ],
                      ),
                      new Expanded(
                        child: new Container(),
                        flex: 1,
                      ),
                      new Icon(Icons.navigate_next, color: Colors.black38),
                    ],
                  ),
                ),
              ),
            ),
            new FlatButton(
              onPressed: () {},
              padding: EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 20.0, right: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(17.0),
                shadowColor: Color.fromRGBO(50, 50, 50, 0.2),
                elevation: 0.5,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  minWidth: 300.0,
                  height: 70.0,
//          onPressed: () {
//                  Navigator.of(context).pushNamed(HomePage.tag);
//          },
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Image(
                          alignment: FractionalOffset.centerLeft,
                          image: new AssetImage('images/picture.png'),
                          height: 40.0,
                          width: 50.0),
                      new Container(
                        child: SizedBox(width: 10.0),
                      ),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text("Change Password",
                              style: TextStyle(
                                  color: Color(0xFF4B0082),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0)),
                          new Container(
                            child: SizedBox(height: 5.0),
                          ),
                          new Text("last changed 13 days ago",
                              style: TextStyle(
                                  color: Color(0xFF4B0082),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.0)),
                        ],
                      ),
                      new Expanded(
                        child: new Container(),
                        flex: 1,
                      ),
                      new Icon(Icons.navigate_next, color: Colors.black38),
                    ],
                  ),
                ),
              ),
            ),
            new FlatButton(
              onPressed: ()=>_logout(),
              padding: EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 20.0, right: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(17.0),
                shadowColor: Color.fromRGBO(50, 50, 50, 0.2),
                elevation: 0.5,
                child: MaterialButton(
                  onPressed: ()=>_logout(),
                  color: Colors.white,
                  minWidth: 400.0,
                  height: 70.0,
//          onPressed: () {
//                  Navigator.of(context).pushNamed(HomePage.tag);
//          },
                  child: Text("Log out",
                      style: TextStyle(
                          color: Color(0xFF4B0082),
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0)),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            new Row(
              children: <Widget>[
                new SizedBox(width: 30.0),
                new Text(
                  "OTHER",
                  style: TextStyle(
                      letterSpacing: 1.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.0),
                ),
              ],
            ),
            new FlatButton(
              onPressed: () {},
              padding: EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 20.0, right: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(17.0),
                shadowColor: Color.fromRGBO(50, 50, 50, 0.2),
                elevation: 0.5,
                child: MaterialButton(
                  color: Colors.white,
                  minWidth: 300.0,
                  height: 70.0,
                  onPressed: () {}/*{
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => {}));
                  }*/,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Image(
                          alignment: FractionalOffset.centerLeft,
                          image: new AssetImage('images/picture.png'),
                          height: 40.0,
                          width: 50.0),
                      new Container(
                        child: SizedBox(width: 10.0),
                      ),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text("About Us",
                              style: TextStyle(
                                  color: Color(0xFF4B0082),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0)),
                          new Container(
                            child: SizedBox(height: 5.0),
                          ),
                          new Text("BTS Birdbrain",
                              style: TextStyle(
                                  color: Color(0xFF4B0082),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.0)),
                        ],
                      ),
                      new Expanded(
                        child: new Container(),
                        flex: 1,
                      ),
                        new Icon(Icons.navigate_next, color: Colors.black38),
                    ],
                  ),
                ),
              ),
            ),
            new FlatButton(
              onPressed: () {},
              padding: EdgeInsets.only(
                  top: 16.0, bottom: 16.0, left: 20.0, right: 20.0),
              child: Material(
                borderRadius: BorderRadius.circular(17.0),
                shadowColor: Color.fromRGBO(50, 50, 50, 0.2),
                elevation: 0.5,
                child: MaterialButton(
                  color: Colors.white,
                  minWidth: 300.0,
                  height: 70.0,
                  onPressed: () {},
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Image(
                          alignment: FractionalOffset.centerLeft,
                          image: new AssetImage('images/picture.png'),
                          height: 40.0,
                          width: 50.0),
                      new Container(
                        child: SizedBox(width: 10.0),
                      ),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          new Text("Contact Us",
                              style: TextStyle(
                                  color: Color(0xFF4B0082),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0)),
                          new Container(
                            child: SizedBox(height: 5.0),
                          ),
                          new Text("We want to hear from you!",
                              style: TextStyle(
                                  color: Color(0xFF4B0082),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.0)),
                        ],
                      ),
                      new Expanded(
                        child: new Container(),
                        flex: 1,
                      ),
                      new Icon(Icons.navigate_next, color: Colors.black38),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    )
    ]
    )
  )
        );
    }
}