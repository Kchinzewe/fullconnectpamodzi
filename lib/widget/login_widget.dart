import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LoginWidget extends StatefulWidget {
  // const LoginWidget({super.key});

  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    // Navigator.of(context) not working!
    // Navigator.currentState!.popUntil((route) => route.isFirst);
  }

  Scaffold logInScreen() {
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
            children: <Widget>[
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
                  Icons.lock_open,
                  size: 32,
                ),
                label: Text(
                  'Log In',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: signIn,
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  text: 'No account sign up? ',
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignUp,
                        text: 'Sign Up',
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
    return logInScreen();
    
    // return SingleChildScrollView(
    //   padding: EdgeInsets.all(16),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       SizedBox(
    //         height: 30,
    //       ),
    //       TextField(
    //         controller: emailController,
    //         cursorColor: Colors.deepPurple,
    //         textInputAction: TextInputAction.next,
    //         decoration: InputDecoration(labelText: 'Email'),
    //       ),
    //       SizedBox(
    //         height: 30,
    //       ),
    //       TextField(
    //         controller: passwordController,
    //         cursorColor: Colors.deepPurple,
    //         textInputAction: TextInputAction.next,
    //         decoration: InputDecoration(labelText: 'Password'),
    //         obscureText: true,
    //       ),
    //       ElevatedButton.icon(
    //         style: ElevatedButton.styleFrom(
    //           minimumSize: Size.fromHeight(50),
    //         ),
    //         icon: Icon(
    //           Icons.lock_open,
    //           size: 32,
    //         ),
    //         label: Text(
    //           'Sign In',
    //           style: TextStyle(fontSize: 24),
    //         ),
    //         onPressed: signIn,
    //       ),
    //       SizedBox(
    //         height: 24,
    //       ),
    //       RichText(
    //         text: TextSpan(
    //           style: TextStyle(color: Colors.deepPurple, fontSize: 20),
    //           text: 'No account? ',
    //           children: [
    //             TextSpan(
    //                 recognizer: TapGestureRecognizer()
    //                   ..onTap = widget.onClickedSignUp,
    //                 text: 'Sign Up',
    //                 style: TextStyle(
    //                   decoration: TextDecoration.underline,
    //                   color: Theme.of(context).colorScheme.secondary,
    //                 ))
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
