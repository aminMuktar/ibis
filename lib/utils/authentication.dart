import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ibis/screens/discover_ui.dart';


class Authentication{
  final _auth=FirebaseAuth.instance;
  //initialize firebase
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
        backgroundColor: Colors.black,
        content: Text(
        content,
        style:TextStyle(color: Colors.redAccent,letterSpacing: 0.5),
    )
    );
  }
  static Future<FirebaseApp> initializeFirebase({required BuildContext context}) async{
    FirebaseApp firebaseApp=await Firebase.initializeApp();
    User? user=FirebaseAuth.instance.currentUser;
    if(user!=null){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => DiscoverUI()
        ),
      );
    }
    return firebaseApp;
  }
  // method for signing in user email and password
  Future<User?> login(BuildContext context,String email,String password) async{

    User? user;
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user=userCredential.user;
      if (user!=null){
       Navigator.of(context).pushReplacement(
         MaterialPageRoute(
             builder:(context)=> DiscoverUI(),
         )
       );
      }
    }
    on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content:'user not found',
          )
        );

      }
      else if(e.code=='wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content:'the email or password was not correct',
            )
        );
      }
    }
    return user;
  }
Future<void> signUp(BuildContext context,String email,String password) async{

  try {
    final user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    if(user != null){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder:(context)=> DiscoverUI(),
          )
      );
    }
  }
  catch(e){

  }
}
  //method for google signin
  Future<User?> signInWithGoogle({required BuildContext context}) async{
    // FirebaseAuth auth=FirebaseAuth.instance;
    User? user;
    final GoogleSignIn googleSignIn=GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount=await googleSignIn.signIn();
    if(googleSignInAccount != null){
      final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
      final AuthCredential credential=GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try{
        final UserCredential userCredential=await _auth.signInWithCredential(credential);
        user=userCredential.user;

      }
      on FirebaseAuthException catch(e){
        if(e.code == 'account-exists-with-different-credential'){
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'account already exists with a different credential.',
            ),
          );
        }
        else if(e.code == 'invalid-credential'){
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'error occured while accessing credentials. please try again.',
            ),
          );
        }
      }
      catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          Authentication.customSnackBar(
            content: 'error occured while using google sign in.',
          ),
        );
      }
    }
  return user;
  }
  static Future <void> signOut({required BuildContext context}) async{
    final GoogleSignIn googleSignIn=GoogleSignIn();
    try{
      if(!kIsWeb){
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(content: 'error signing out.try again')
      );
    }
  }
  Future<User?> getUser() async{
    User? currentUser=await FirebaseAuth.instance.currentUser;
      return currentUser;
  }
}