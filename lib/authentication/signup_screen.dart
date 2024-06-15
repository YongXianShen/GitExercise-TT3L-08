import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mmusuperapp/authentication/login_screen.dart';
import 'package:mmusuperapp/homepage.dart';
import 'package:mmusuperapp/methods/common_methods.dart';
import 'package:mmusuperapp/widgets/loading_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController userPhoneTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  signUpFormValidation() {
    if (userNameTextEditingController.text.trim().length < 3) {
      cMethods.displaySnackBar("Your username needs to have at least 4 or more characters", context);
    } else if (userPhoneTextEditingController.text.trim().length < 9) {
      cMethods.displaySnackBar("Invalid Phone Number", context);
    } else if (!emailTextEditingController.text.contains("@")) {
      cMethods.displaySnackBar("Invalid Email", context);
    } else if (passwordTextEditingController.text.trim().length < 5) {
      cMethods.displaySnackBar("Your password needs to have at least 6 or more characters", context);
    } else {
      registerNewUser();
    }
  }

  registerNewUser() async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => LoadingDialog(messageText: "Registering your account...."),
  );

  try {
    final User? userFirebase = (
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextEditingController.text.trim(),
        password: passwordTextEditingController.text.trim(),
      )
    ).user;

    if (!context.mounted) return;
    Navigator.pop(context);

    if (userFirebase != null) {
      DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users").child(userFirebase.uid);
      Map userDataMap = {
        "name": userNameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": userPhoneTextEditingController.text.trim(),
        "id": userFirebase.uid,
        "blockStatus": "no",
      };

      print("User data to be saved: $userDataMap"); 
      usersRef.set(userDataMap).then((_) {
        print("User data saved successfully");
        Navigator.push(context, MaterialPageRoute(builder: (c) => HomePage()));
      }).catchError((error) {
        print("Error saving user data: $error");
        cMethods.displaySnackBar("Error saving user data", context);
      });
    }
  } catch (error) {
    Navigator.pop(context);
    cMethods.displaySnackBar(error.toString(), context);
  }
}


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ), 
      child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              Image.asset(
                  "assets/images/logo.png"
              ),

              const Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [

                    TextField(
                      controller: userNameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 22,),

                    TextField(
                      controller: userPhoneTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Phone",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 22,),

                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "User Email",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 22,),

                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Password",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 42,),

                    ElevatedButton(
                      onPressed: signUpFormValidation,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10)
                      ),
                      child: const Text(
                          "Sign Up"
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 12,),

              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
                },
                child: const Text(
                  "Already have an Account? Login here",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    ));
  }
}
