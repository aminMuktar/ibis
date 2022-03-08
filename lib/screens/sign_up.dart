import 'package:flutter/material.dart';
import 'package:ibis/screens/login_ui.dart';
import 'package:ibis/utils/authentication.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool _isPasswordVisible=false;
  bool isLoading=false;
  final _formKey=GlobalKey<FormState>();
  Widget _labelPlace(){
    return Column(
        children:<Widget>[
          Column(
              children:const <Widget>[
                Text(
                  "Sign Up with email",
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
        padding: const EdgeInsets.fromLTRB(30,20,30,0),

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
                else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value!)){
                  return 'enter a valid email address';
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
            Text("at least 8 characters(combinations of letters,digits and special character)."),
            TextFormField(
              autofocus: false,
              controller: passwordController,
              obscureText: !_isPasswordVisible,
              validator: (String? value ){
                if(value!=null && value.isEmpty){
                  return 'this field is required';
                }
                else if(!RegExp(r'^.{8,}$').hasMatch(value!)){
                  return 'enter a valid password, minimum 8 characters';
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

  Widget _signUpButton(){
    return FutureBuilder(
      future: Authentication.initializeFirebase(context: context),
      builder: (context,snapshot) {

        return Container(
          padding: EdgeInsets.fromLTRB(17,30,17,20),
          child: MaterialButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  isLoading=true;
                });
                  Authentication().signUp(context, emailController.text, passwordController.text);
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
              child: isLoading
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ],
              )
              : Text(
                'Sign Up',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        );
      }
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
              Navigator.push(context, MaterialPageRoute(builder:  (context) => LoginUI()));
            },
            child: Row(
              children: [
                Text("Already have an account? "),
                Text("Sign in",
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
                  _signUpButton(),
                  _createAccountLabel()
                ],

              ),
            ),
          ),

        ],
      ),

    );
  }
}






