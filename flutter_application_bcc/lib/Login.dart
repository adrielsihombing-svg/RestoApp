import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'Login_page.dart';
import 'Signin_up.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Text(
                "Let Basic Shop give you a great experience",
                style: TextStyle(fontSize: 12),
              ),

              SizedBox(height: 50),
              Container(
                child: Image.asset(
                  'assets/IMG/SS_06.png',
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(250, 9),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),

              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(250, 9),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.black,
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SigninUp()),
                  );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
