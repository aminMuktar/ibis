import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'login_ui.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Widget _logoPlace(){
    return Column(
      children:<Widget>[
        Column(
          children:<Widget>[
            const Image(
            image: AssetImage('assets/images/animal.png'),
          ),
            Text(
                "welcome to Ibis",
              style: TextStyle(fontFamily: "RobotoMono",fontWeight: FontWeight.bold,fontSize: 30),
            ),
    ]

        ),
      ]
    );
  }
  Widget _loginButton(){
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginUI()));
      },
      child: Container(

        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Color(0xff780858)),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
  Widget _signUpButton(){
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUp()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
  Widget _bottom_label(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(15),

      alignment: Alignment.bottomCenter,
      child: Wrap(

        children: <Widget>[
          Text("By tapping Login and Sign Up I agree to Ibis\'s "),
          GestureDetector(
            onTap: () {},
            child: Text("Terms of service",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline
              ),),
          ),
        ],
      ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Wrap(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                _logoPlace(),
                SizedBox(
                  height: 80,
                ),
                _loginButton(),
                SizedBox(
                  height: 20,
                ),
                _signUpButton(),
                Stack(

                    children:[
                      Positioned(child:_bottom_label() )

                    ]
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }
}


