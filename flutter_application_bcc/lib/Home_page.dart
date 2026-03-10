import 'package:flutter/material.dart';
import 'package:flutter_application_bcc/Menu.dart';
import 'Menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> daftarMenu = [];

  // ignore: non_constant_identifier_names
  var Menu = MenuItem().Menu;

  _buatList() {
    for (var i = 0; i < Menu.length; i++) {
      final menunya = Menu[i];
      final String gambar = menunya["gambar"]!;

      daftarMenu.add(
        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/IMG/$gambar',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 30,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      menunya["nama"]!,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 10),
                    child: Text(
                      menunya["Price"]!,
                      style: TextStyle(
                        fontSize: 10,
                        color: const Color.fromARGB(255, 127, 120, 60),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 10),
                    child: Row(
                      children: [
                        Icon(Icons.star, size: 15),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Text(menunya["Ranting"]!, style: TextStyle(fontSize: 10),),
                        ),
                        ]
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    setState(() {});
  } 

  @override
  void initState() {
    super.initState();
    _buatList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Agar teks rata kiri
                  children: [
                    Text(
                      "Hola! Supernova",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Siap menjalani harimu?"),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/IMG/SS_07.png',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.grey[100],
                  hintText: "Cari barang apa hari ini?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          // GridView di dalam Expanded
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(20),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: daftarMenu,
            ),
          ),
        ],
      ),
    );
  }
}
