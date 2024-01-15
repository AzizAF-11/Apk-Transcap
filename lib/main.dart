import 'package:flutter/material.dart';
import 'package:flutter_application_travel_3/auth.dart';
import 'package:flutter_application_travel_3/auth_page.dart';
import 'package:flutter_application_travel_3/home_page.dart';
import 'package:flutter_application_travel_3/provider_profile.dart';
import 'package:flutter_application_travel_3/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProxyProvider<Auth, UserProvider>(
          create: (_) => UserProvider(),
          update: (_, auth, userProvider) => userProvider!
            ..isAuthenticated = auth.isAuth
            ..updateAuthStatus(auth.isAuth),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, child) {
          // Use auth.isAuth to determine which page to display
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: auth.isAuth
                ? FutureBuilder(
                    future: Future.delayed(Duration(seconds: 3)),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SplashScreenPage();
                      } else {
                        return HomePage();
                      }
                    },
                  )
                : FutureBuilder(
                    future: auth.autoLogin(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFF26425A),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        // Handle authentication errors here
                        return Scaffold(
                          body: Center(
                            child: Text('Error: ${snapshot.error}'),
                          ),
                        );
                      }
                      return LoginPage();
                    },
                  ),
            routes: {
              SplashScreenPage.route: (ctx) => SplashScreenPage(),
              HomePage.route: (ctx) => HomePage(),
              LoginPage.route: (ctx) => LoginPage(),
            },
          );
        },
      ),
    );
  }
}
