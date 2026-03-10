import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'Login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // 1. Controller untuk mengontrol perpindahan slide
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Data konten slide
  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Fresh & Healthy Every Day",
      "desc":
          "Dapatkan sayur segar langsung dari petani ke rumah Anda. Kualitas terbaik untuk hidup sehat!",
      "image": "assets/IMG/SS_03.jpg", // Ganti dengan path gambarmu
    },
    {
      "title": "Belanja Mudah, Hemat Waktu",
      "desc":
          "Pesan sayur favorit Anda dalam hitungan detik. Tanpa ribet, tanpa antri, langsung diantar ke rumah!",
      "image": "assets/IMG/SS_04.png",
    },
    {
      "title": "Dukung Petani Lokal",
      "desc":
          "Setiap pembelian Anda membantu petani lokal berkembang. Makan sehat sambil berbagi kebaikan!",
      "image": "assets/IMG/SS_05.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // BAGIAN ATAS (Logo & Gambar Slide)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60), // Jarak dari status bar HP
                // Logo & Nama Shop (Row di tengah)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/IMG/SS_02.png', width: 30, height: 30),
                    const SizedBox(width: 10),
                    new Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: const Text(
                          "Basic Shop",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // PageView untuk Slide Gambar
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _onboardingData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Image.asset(
                          _onboardingData[index]["image"]!,
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          SafeArea(
            // BAGIAN BAWAH (Kotak Biru Gelap)
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              decoration: const BoxDecoration(
                color: Color(0xFF2D4558), // Warna Biru Navy
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Judul
                  Text(
                    _onboardingData[_currentPage]["title"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Deskripsi
                  Text(
                    _onboardingData[_currentPage]["desc"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 40),

                  // BAR NAVIGASI (Skip, Indikator, Next)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        // Tombol hanya terlihat jika BUKAN halaman terakhir
                        visible: _currentPage != _onboardingData.length - 1,
                        maintainSize:
                            true, // Opsional: agar posisi widget lain tidak bergeser saat Skip hilang
                        maintainAnimation: true,
                        maintainState: true,
                        child: TextButton(
                          onPressed: () {
                            _pageController.jumpToPage(
                              _onboardingData.length - 1,
                            );
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      
                      // Indikator Titik
                      Row(
                        children: List.generate(
                          _onboardingData.length,
                          (index) => _buildIndicator(index == _currentPage),
                        ),
                      ),

                      // Tombol Next
                      TextButton(
                        onPressed: () {
                          if (_currentPage < _onboardingData.length - 1) {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          }
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi pembuat indikator
  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: isActive ? 24 : 12,
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.white38,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
