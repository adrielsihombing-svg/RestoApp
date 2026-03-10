import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_application_bcc/Home_page.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'Home_page.dart';

class SigninUp extends StatefulWidget {
  const SigninUp({super.key});

  @override
  State<SigninUp> createState() => _SigninUpState();
}

class _SigninUpState extends State<SigninUp> {
  bool _onClik = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.blue),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 150,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Buat akun baru kamu!",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),

                Column(
                  children: [
                    inputFile(label: "Nama Lengkap"),
                    inputFile(label: "User Name"),
                    inputFile(label: "No Handphone"),
                    inputPassword(
                      label: "Kata Sandi",
                      obscureText: _onClik,
                      onEyeClik: () {
                        setState(() {
                          _onClik = !_onClik;
                        });
                      },
                    ),
                    inputPassword(
                      label: "Konfirmasi Kata Sandi",
                      obscureText: _onClik,
                      onEyeClik: () {
                        setState(() {
                          _onClik = !_onClik;
                        });
                      },
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 0,
                      left: 5,
                      bottom: 0,
                      right: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 40,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      color: Colors.blue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sudah punya akun? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Kembali ke halaman sebelumnya
                      },
                      child: Text(
                        "Masuk",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@override
Widget inputFile({hint, label}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),

      SizedBox(height: 5),
      TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 15),
        ),
      ),
    ],
  );
}

Widget inputPassword({
  String? hint,
  required String label,
  obscureText = true,
  required,
  required VoidCallback onEyeClik,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),

      SizedBox(height: 5),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 15),

          suffixIcon: IconButton(
            icon: Icon(
              // Ganti ikon berdasarkan status
              obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.orange[200], // Sesuaikan warna dengan gambarmu
            ),
            onPressed: onEyeClik,
          ),
        ),
      ),
    ],
  );
}
