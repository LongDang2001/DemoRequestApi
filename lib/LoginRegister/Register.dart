
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiktok/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterState();
  }
}
class RegisterState extends State<RegisterScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;
  final textEmailController = TextEditingController();
  final textPasswordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEmailController.dispose();
    textPasswordController.dispose();
    super.dispose();
  }
  Future<void> loginFirebase() async {
    await FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        return Scaffold(
          body: Container(
            color: Colors.yellow,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      }
    });
    auth.setPersistence(Persistence.NONE);
    // auth.signInAnonymously();
    //auth.createUserWithEmailAndPassword(email: 'null', password: 'null');
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: textEmailController.text,
          password: textPasswordController.text
      );
    } on FirebaseAuthException catch (error) {
      if(error.code == 'weak-password') {
        print('Error passwork');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Align(
                alignment: Alignment.center,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Image.asset('assets/group72.png'),
                      ),
                      Container(
                        child: Text(
                          'No Internet',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              content: Text(
                'Please try again!',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(80, 81, 86, 1)
                ),
                textAlign: TextAlign.center,
              ),
              actions: [
                Align(
                  alignment: Alignment.center,
                  child: FlatButton(
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            );
          }
        );
      } else if(error.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('The account already exists for that email'),
            );
          }
        );
      }
    } catch (error){
      print(error);
    }

  }

  // Login Google
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    // tao ra mot cai thong bao, nhan chi tiet xac thuc yeu cau
    final GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
    // tao mot thong tin dang nhap moi
    final GoogleAuthCredential googleAuthCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken
    );
    return auth.signInWithCredential(googleAuthCredential);
  }
  //Login FaceBook
  // Future<UserCredential> signInWithFaceBook() async {
  //   final resuld = await FacebookAuth.instance.login();
  //   final FacebookAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(resuld.token);
  //   return await auth.signInWithCredential(facebookAuthCredential);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 27, 37, 1),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 100,
                margin: EdgeInsets.only(top: 95, bottom: 15),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/group.png'),
                )
            ),
            Container(
              height: 35,
              child: Image.asset('assets/nameapp.png'),
            ),
            Container(
              //color: Colors.yellow,
              height: 470,
              width: 330,
              margin: EdgeInsets.only(top: 70, left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Input Your TikTok Username',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(177, 178, 181, 1),
                          fontStyle: FontStyle.normal

                      ),
                    ),
                  ),
                  Container(
                    height: 58,
                    margin: EdgeInsets.only(top: 20, bottom: 34),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '  Email',
                      ),
                      cursorColor: Colors.red,
                      keyboardType: TextInputType.emailAddress,
                      controller: textEmailController,
                      // onEditingComplete: () async {
                      //   await showDialog(
                      //     context: context,
                      //     builder: (context) {
                      //       return AlertDialog(
                      //         content: Text('textEmailController.text: ${textEmailController.text}'),
                      //         actions: [
                      //           Container(
                      //             child: FlatButton(
                      //               child: Text('ok'),
                      //               onPressed: () {
                      //                 Navigator.pop(context);
                      //               },
                      //             ),
                      //           )
                      //         ],
                      //       );
                      //     },
                      //   );
                      // },
                    ),
                  ),
                  Container(
                    height: 58,
                    margin: EdgeInsets.only( bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '  PassWord',
                      ),
                      cursorColor: Colors.red,
                      keyboardType: TextInputType.visiblePassword,
                      controller: textPasswordController,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(75, 79, 103, 1),

                    ),
                    child: TextButton(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white
                        ),
                      ),
                      onPressed: () async {
                        try {
                          print('000');
                          auth.createUserWithEmailAndPassword(
                              email: textEmailController.text,
                              password: textPasswordController.text
                          ).then((value) {
                            if(value != null) {
                              print('111');
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return RegisterScreen();
                              }));
                            } else {
                              print('222');
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Error'),
                                      content: Text('Error: PassWork and Email Error'),

                                    );
                                  }
                              );
                            }
                          });
                          // gui ma xac minh den

                        } on FirebaseAuthException catch(error) {
                          print('333');
                          if (error.code == 'weak-password') {
                            print(error.code);
                            print('The password provided is too weak.');
                          } else if (error.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (error) {
                          print('444');
                          print(error);
                        }
                      },

                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(75, 79, 103, 1),

                    ),
                    child: TextButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white
                        ),
                      ),
                      onPressed: () async {
                        try {
                          auth.signInWithEmailAndPassword(
                              email: textEmailController.text,
                              password: textPasswordController.text
                          ).catchError((onError) {
                            print('111');
                          }).then((value) {

                            if(value != null) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return MainScreen();
                              }));
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Error: PassWork and Email Error'),

                                  );
                                }
                              );
                            }
                          });
                        } on FirebaseAuthException catch(error) {
                          if (error.code == 'user-not-found') {
                            print(error.code);
                            print('The password provided is too weak.');
                          } else if (error.code == 'wrong-password') {
                            print('The account already exists for that email.');
                          }
                          return 'Sign in error';
                        } catch (error) {
                          print(error);
                        }
                      },
                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(75, 79, 103, 1),
                    ),
                    child: TextButton(
                      child: Text(
                        'Login with Google',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white
                        ),
                      ),
                      onPressed: () {
                        signInWithGoogle().then((value) {
                          if(value != null) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return MainScreen();
                            }));
                          }
                        });
                      },
                    ),
                  ),

                ],
              ),

            ),
          ],
        ),

      ),
    );
  }
}