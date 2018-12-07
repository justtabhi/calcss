import 'package:flutter/material.dart';
import 'dart:async';
import '../ui/register.dart';
import 'package:razorpay_plugin/razorpay_plugin.dart';



//const subtitle="Just need to simplify mathematical \nequations to earn exciting prizes \n1.quiz consist of 10 questions \n2.Time allowed is 10 sec for each question";
class Home extends StatefulWidget{
  
  @override
    State<StatefulWidget> createState() {
      return new HomeState();
    }
}
class HomeState extends State<Home>{
  bool _isButtonDisabled;
  @override
  void initState() {
    super.initState();
    _isButtonDisabled = false;
  }

  void _registerset(){
    
    setState(() {
        if(_isButtonDisabled==false){
          _isButtonDisabled=true;
          startPayment();
        }
        });
    
    debugPrint("disable button $_isButtonDisabled");
  }

  void _proceedset(){
    debugPrint("disable button2 $_isButtonDisabled");
    setState(() {
        if(_isButtonDisabled){
          _isButtonDisabled=false;
          Navigator.of(context).pop();
          Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new Register()));
        }
        });
  }

  String pay,pay1;

  startPayment() async {
    Map<String, dynamic> options = new Map();
    options.putIfAbsent("name", () => "Register for Quiz");
    options.putIfAbsent("image", () => "https://www.73lines.com/web/image/12427");
    options.putIfAbsent("description", () => "This is a real transaction");
    options.putIfAbsent("amount", () => "200");
    options.putIfAbsent("email", () => "abhi.in12@gmail.com");
    options.putIfAbsent("contact", () => "7834853995");
    //Must be a valid HTML color.
    options.putIfAbsent("theme", () => "#FF0000");
    options.putIfAbsent("api_key", () => "rzp_test_UNDftkoFjL7mEt");
    Map<dynamic,dynamic> paymentResponse = new Map();
    paymentResponse = await Razorpay.showPaymentForm(options);
    debugPrint("response $paymentResponse");
    /*Iterator i= paymentResponse.values.iterator;
    while(i.moveNext()) { 
      pay=i.current; 
   } */
   //debugPrint("pay123: $pay");
  }
  
  Future<Null> showalert() async{
    return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
    return AlertDialog(
      
      title: Text('Simplify and Earn'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Just need to simplify mathematical'),
              Text('equations to earn exciting prizes'),
              Text('1.quiz consist of 10 questions'),
              Text('2.Time allowed is 10 sec for each question'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Register',style: new TextStyle(color: Colors.white),),
            color: Color(0xFF4B0082),
            onPressed: _registerset,
          ),
          FlatButton(
            child: Text('Cancel',style: new TextStyle(color: Colors.white),),
            color: Color(0xFF4B0082),
            onPressed: () {
              //Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new Register())); 
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Proceed',style: new TextStyle(color: Colors.white),),
            color: Color(0xFF4B0082),
            onPressed: _proceedset,
          )
        ],
    );
    }
    ); 
  }
  @override
    Widget build(BuildContext context) {

      return new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () => showalert(),
                color: Color(0xFF4B0082),
                padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 40.0),
                child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.book,color: Colors.white,size: 50.0,),
                    Text("Register @2",style: new TextStyle(color: Colors.white,fontSize: 40.0))
                  ],
                ),
              ),
              new Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0),)
                ],
              ),
              FlatButton(
                onPressed: () => {},
                color: Color(0xFF4B0082),
                padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 40.0),
                child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.book,color: Colors.white,size: 45.0,),
                    Text("Buy Lives @1",style: new TextStyle(color: Colors.white,fontSize: 40.0))
                  ],
                ),
              ),
            ],
          ),
        );
      /*return new Center(
        child:
         new FloatingActionButton(
        child:  new Icon(Icons.add,size: 40.0,color: Colors.white,),
        backgroundColor: Color(0xFF4B0082),
        onPressed: () {},
      )
      );
      return new Card(
        color: Color(0xFF4B0082),
      child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      const ListTile(
        leading: Icon(Icons.album),
        title: Text('Simplify and Earn',style: TextStyle(
                  color: Colors.white),),
        subtitle: Text(subtitle,style: TextStyle(color: Colors.white),)
      ),
      ButtonTheme.bar( // make buttons use the appropriate styles for cards
        child: ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Text('Register @1',style: new TextStyle(
                color: Colors.white,
              ),),
              color: Colors.deepOrangeAccent,
              onPressed: () {},
            ),
          ],
        ),
      ),
    ],
  ),
);*/

    }
}