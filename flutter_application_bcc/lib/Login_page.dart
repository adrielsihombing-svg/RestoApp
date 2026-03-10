import 'package:flutter/material.dart';
import 'Signin_up.dart';
import 'Home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false; // Untuk menampilkan indikator loading saat login

  Future<void> _login() async {
    // Validasi email dan password
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    
    if (email.isEmpty) {
      _showErrorDialog('Email tidak boleh kosong.');
      return;
    }
    
    if (password.isEmpty) {
      _showErrorDialog('Password tidak boleh kosong.');
      return;
    }
    
    // Tampilkan indikator loading
    setState(() {
      _isLoading = true;
    });
    
    // Ganti URL ini dengan endpoint API aslimu
    final Uri url = Uri.parse('https://cobain-dulu.free.beeceptor.com/api/v1/login');

    try {
      // Lakukan HTTP POST Request
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json;charset=utf-8',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      // Cek apakah API mengembalikan status sukses (200 OK)
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        
        // BERHASIL LOGIN - Simpan token jika ada
        if (responseData['token'] != null) {
          print('Token: ${responseData['token']}');
        }
        
        // Navigasi ke HomePage setelah berhasil login
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login Berhasil!'), duration: Duration(seconds: 2)),
          );
          
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      } else {
        // GAGAL LOGIN (Email/Password salah)
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        _showErrorDialog(errorData['error'] ?? 'Email atau password salah.');
      }
    } catch (e) {
      // Gagal terhubung ke server (misal: tidak ada internet)
      _showErrorDialog('Terjadi kesalahan koneksi: ${e.toString()}');
    } finally {
      // Matikan indikator loading
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Fungsi tambahan untuk menampilkan popup error
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Login Gagal'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Tutup'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.blue),
        ),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Masuk",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Selamat datang Kembali",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                        ],
                      ),

                      SizedBox(
                        // ignore: sort_child_properties_last
                        child: Image.asset('assets/IMG/SS_02.png'),
                        width: 150,
                        height: 150,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      inputFile(hint: '...@xxx.com', label: "Email", controller: emailController),
                      SizedBox(height: 10),
                      inputFile(
                        hint: '*****',
                        label: "Password",
                        obscureText: true,
                        controller: passwordController,
                      ),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Lupa password?",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 2, left: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 50,
                      onPressed: _isLoading ? null : _login,
                      color: Colors.blue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: _isLoading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              "Masuk",
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
                  children: <Widget>[
                    Text("Belum punya akun? "),
                    GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => SigninUp()),
                        );
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    ),

                    SizedBox(height: 120),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    }
}

// ignore: strict_top_level_inference
Widget inputFile({hint, label, obscureText = false, required TextEditingController controller}) {
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
        controller: controller,
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
        ),
      ),
    ],
  );
}

Widget inputPassword({
  String? hint,
  required String label,
  obscureText = true,
  required TextEditingController controller,
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
        controller: controller,
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
