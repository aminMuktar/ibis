import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:ibis/utils/authentication.dart';
import 'discover_ui.dart';
import 'sign_up.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool _isSigningIn=false;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  bool _isPasswordVisible=false;

  Widget _labelPlace(){
    return Column(
        children:<Widget>[
          Column(
              children:const <Widget>[
                Text(
                  "Sign in with email",
                  style: TextStyle(fontFamily: "RobotoMono",fontWeight: FontWeight.bold,fontSize: 30),
                ),
              ]
          ),
        ]
    );
  }
  Widget _emailField(){
    return Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30,50,30,0),

        child: Column(
          children: [
            TextFormField(
              autofocus: false,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (String? value ){
                if(value!=null && value.isEmpty){
                  return 'this field is required';
                }
                else{
                  return null;
                }
              },
              onSaved: (value){
                emailController.text = value!;
              },
              textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                    labelText: 'Email address',
                ),
              ),
          ],
        ),
      ),
    );
  }
  Widget _passwordField(){
    return Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30,20,30,0),

        child: Column(
          children: [
            TextFormField(
              autofocus: false,
              controller: passwordController,
              obscureText: !_isPasswordVisible,
              validator: (String? value ){
                if(value!=null && value.isEmpty){
                  return 'this field is required';
                }
                else{
                  return null;
                }
              },
              onSaved: (value){
                passwordController.text = value!;
              },
              textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                      ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible=!_isPasswordVisible;
                      });
                    },

                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
  Widget _signInButton(){
    return Container(
      padding: EdgeInsets.fromLTRB(17,30,17,20),
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DiscoverUI()));
          }

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
      ),
    );
  }

  Widget _forgotPassword(){
    return Container(
          margin: EdgeInsets.only(left: 10, right: 0),
          padding: EdgeInsets.fromLTRB(0,0,30,20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Text("Forgot Password?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                    color: Color(0xff780858)),
                  ),
              ),
            ],
          ),
    );
  }
  Widget _backButton(){
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 50, 0, 0),

              child: Icon(
                Icons.close,
                color: Colors.black,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _createAccountLabel() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder:  (context) => SignUp()));
                },
                child: Row(
                  children: [
                    Text("Don\'t have an account? "),
                    Text("Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff780858)),
                    ),
                  ],
                ),
              ),
          ],
        ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Wrap(
        //
        children:<Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Column(
              children:<Widget>[
                _backButton()
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0,50,0,0),
            alignment: Alignment.center,
            child:Column(
                children:<Widget>[
                  _labelPlace(),
                ]
            ),
          ),
          Container(
          child: Form(
            key: _formKey,
            child: Wrap(
          children: <Widget>[
            _emailField(),
            _passwordField(),

            _signInButton(),
            _forgotPassword(),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,0,10,0),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                  ),
                  Text("Or"),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10,0,10,0),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context,snapshot){
                if(snapshot.hasError){
                  return Text('error initializing');
                }
                else if (snapshot.connectionState == ConnectionState.done){
                  return  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 10),
                      child: _isSigningIn
                          ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Color(0xff780858)),
                      )
                          : SignInButton(
                          Buttons.Google,
                          onPressed: () async {
                            setState(() {
                              _isSigningIn=true;
                            });
                            User? user=await Authentication.signInWithGoogle(context: context);
                            setState(() {
                              _isSigningIn=false;
                            });
                            if(user!=null){
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => DiscoverUI(),
                                ),
                              );
                            }
                          }
                      )

                  );
                }
                return CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xff780858)
                  ),
                );
             }


            ),
            _createAccountLabel(),
          ],

        ),
        ),
      ),

    ],
      ),

    );
  }
}


