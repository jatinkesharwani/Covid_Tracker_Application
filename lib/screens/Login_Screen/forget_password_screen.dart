import 'package:covid19_tracker/screens/Login_Screen/SignInPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  String _email;
  bool isLoading = false;
  bool circular = false;
  final auth = FirebaseAuth.instance;
  TextEditingController emailTextEditingController = TextEditingController();
  final requestformkey = GlobalKey<FormState>();

  forgetPasswordPsessButton() async {
    if (requestformkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      auth.sendPasswordResetEmail(email: _email);
      showAlertDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          //alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: requestformkey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      const Text(
                        "Forget Password",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      TextFormField(
                        validator: (val) {
                          return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val)
                              ? null
                              : "Please Enter Correct Email";
                        },
                        controller: emailTextEditingController,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 1.5,
                              color: Colors.amber,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value.trim();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                const Padding(padding: EdgeInsets.only(top: 20)),
                colorButton(),
                const SizedBox(height: 330,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget colorButton() {
    return InkWell(
      onTap: () {
        forgetPasswordPsessButton();
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 100,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(colors: [
            Color(0xfffd746c),
            Color(0xffff9068),
            Color(0xfffd746c)
          ]),
        ),
        child: Center(
          child: circular
              ? const CircularProgressIndicator()
              : const Text(
            "Send Request",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => const SignInPage()
      ));
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Request !"),
    content: const Text("please check your email"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}