import 'package:flutter/material.dart';
import 'package:flutter_application_travel_3/auth.dart';
import 'package:flutter_application_travel_3/auth_page.dart';
import 'package:flutter_application_travel_3/home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SplashScreenPage extends StatefulWidget {
  static const String route = "/splash";

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    openSplashScreen();
  }

  void openSplashScreen() async {
    // Tunda selama 2 detik
    await Future.delayed(Duration(seconds: 2));

    // Dapatkan objek Auth dari Provider
    Auth auth = Provider.of<Auth>(context, listen: false);

    // Periksa status otentikasi
    if (auth.isAuth) {
      // Beralih ke halaman beranda (HomePage)
      Navigator.pushReplacementNamed(context, HomePage.route);
    } else {
      // Jika tidak terotentikasi, beralih ke halaman login
      Navigator.pushReplacementNamed(context, LoginPage.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ganti dengan widget gambar Anda
            Image.asset(
              "assets/images/captrans1.png",
              width: 300,
              height: 400,
            ),
            SizedBox(height: 10),
            // Tambahkan spinner loading untuk efek visual
            SpinKitWave(
              color: Color(0xFF3D737F),
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}

// class SplashScreenPage extends StatelessWidget {
//   static const String route = '/splash';

//   @override
//     Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Ganti dengan widget gambar Anda
//             Image.asset(
//               "assets/images/saveKontak.png",
//               width: 200,
//               height: 300,
//             ),
//             SizedBox(height: 10),
//             // Tambahkan spinner loading untuk efek visual
//             SpinKitWave(
//               color: Color(0xFF3D737F),
//               size: 25.0,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
