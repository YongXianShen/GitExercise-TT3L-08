import 'package:flutter/material.dart';
import 'package:mmusuperapp/authentication/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              Image.asset(
                  "assets/images/logo.png"
              ),
              const Text(
                'Login as a User',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Text Fields & Sign Up Button
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [

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
                        color: Colors.grey ,
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
                        color: Colors.grey ,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 42,),

                    ElevatedButton(
                      onPressed: ()
                      {

                      },
                      style:  ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10)
                      ),
                      child: const Text(
                          "Log In"
                      ),
                    ),

                  ],
                ),
              ),

              const SizedBox(height: 12,),

              // Text Button
              TextButton(
                onPressed: ()
                {
                  Navigator.push(context,MaterialPageRoute(builder: (c)=> SignUpScreen()));
                },
                child: Text(
                  "Don't have an account? Sign Up here",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}