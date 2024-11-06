import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import './login.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Selamat datang di Website Konseling",
          body:
              "Terima kasih sudah meluangkan waktu. Kami di sini untuk mendengarkan dan mendukung Anda. Jangan ragu untuk berbagi apa yang sedang Anda alami atau butuhkan saat ini.",
          image: Center(
            child: Container(
              width: 350,
              height: 350,
              child: Lottie.asset(
                "assets/lotties/login.json",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        PageViewModel(
          title: "Masuk untuk tahap selanjutnya",
          body: "Sudah siap untuk bercerita? yuk login dulu!",
          image: Center(
            child: Container(
              width: 350,
              height: 350,
              child: Lottie.asset(
                "assets/lotties/laptop.json",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
      done: const Text("Login", style: TextStyle(fontWeight: FontWeight.w600)),
      showNextButton: true,
      next: Text("Next >>"),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }
}
