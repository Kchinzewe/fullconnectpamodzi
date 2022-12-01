import 'package:connectv01pamodzi/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:connectv01pamodzi/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';

class SignUpWidget extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpWidget({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      // Utils.showSnackBar(e.message);
    }
  }

  Scaffold signInScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).accentColor,
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            SizedBox(
              height: 40,
            ),
            FlutterLogo(
              size: 60,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Connect Pamodzi',
              style: TextStyle(
                fontFamily: "Signatra",
                fontSize: 90.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Email'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (email) =>
              //     email != null && EmailValidator.validate(email)
              //         ? 'Enter a valid email'
              //         : null,
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: passwordController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 6
                  ? 'Enter a min. of 6 characters'
                  : null,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 32,
              ),
              label: Text(
                'Sign Up',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: signUp,
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.white, fontSize: 20),
                text: 'Already have an account? ',
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      text: 'Log In',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.secondary,
                      ))
                ],
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return signInScreen();
    // return SingleChildScrollView(
    //   padding: EdgeInsets.all(16),
    //   child: Form(
    //     key: formKey,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         SizedBox(
    //           height: 40,
    //         ),
    //         FlutterLogo(
    //           size: 120,
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         Text(
    //           'Hey There, \n Welcome Back',
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //             fontSize: 32,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         SizedBox(
    //           height: 40,
    //         ),
    //         TextFormField(
    //           controller: emailController,
    //           cursorColor: Colors.deepPurple,
    //           textInputAction: TextInputAction.next,
    //           decoration: InputDecoration(labelText: 'Email'),
    //           autovalidateMode: AutovalidateMode.onUserInteraction,
    //           validator: (email) =>
    //               email != null && EmailValidator.validate(email)
    //                   ? 'Enter a valid email'
    //                   : null,
    //         ),
    //         SizedBox(
    //           height: 40,
    //         ),
    //         TextFormField(
    //           controller: passwordController,
    //           cursorColor: Colors.deepPurple,
    //           textInputAction: TextInputAction.next,
    //           decoration: InputDecoration(labelText: 'Password'),
    //           obscureText: true,
    //           autovalidateMode: AutovalidateMode.onUserInteraction,
    //           validator: (value) => value != null && value.length < 6
    //               ? 'Enter a min. of 6 characters'
    //               : null,
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         ElevatedButton.icon(
    //           style: ElevatedButton.styleFrom(
    //             minimumSize: Size.fromHeight(50),
    //           ),
    //           icon: Icon(
    //             Icons.arrow_forward_ios,
    //             size: 32,
    //           ),
    //           label: Text(
    //             'Sign Up',
    //             style: TextStyle(fontSize: 24),
    //           ),
    //           onPressed: signUp,
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         RichText(
    //           text: TextSpan(
    //             style: TextStyle(color: Colors.deepPurple, fontSize: 20),
    //             text: 'Already have an account? ',
    //             children: [
    //               TextSpan(
    //                   recognizer: TapGestureRecognizer()
    //                     ..onTap = widget.onClickedSignIn,
    //                   text: 'Log In',
    //                   style: TextStyle(
    //                     decoration: TextDecoration.underline,
    //                     color: Theme.of(context).colorScheme.secondary,
    //                   ))
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
