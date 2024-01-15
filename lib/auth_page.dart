import 'package:flutter/material.dart';
import 'package:flutter_application_travel_3/auth.dart'
    as MyAppAuth; // Use 'MyAppAuth' as a prefix
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginPage extends StatefulWidget {
  static const route = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUserSignUp(SignupData data) async {
    return await Future.delayed(loginTime).then((_) async {
      try {
        await Provider.of<MyAppAuth.Auth>(context, listen: false)
            .signup(data.name ?? "", data.password ?? "");
        _showSnackBar(context, 'Signup successful');
      } catch (err) {
        print(err);
        return err.toString();
      }
      return null; // Return null when the signup is successful
    });
  }

  Future<String?> _authUserLogin(LoginData data) async {
    try {
      await Provider.of<MyAppAuth.Auth>(context, listen: false)
          .login(data.name, data.password);

      _showSnackBar(context, 'Login successful');
      return null;
    } catch (err) {
      print(err);
      return err.toString();
    }
  }

  Future<String?> _recoverPassword(String name) async {
    print('Name: $name');
    await Future.delayed(loginTime);

    if (!users.containsKey(name)) {
      return 'Username not exists';
    }

    return null; // Return null when the recovery is successful
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Ubah sesuai keinginan Anda
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'TRANSCAP',
      // logo: 'assets/images/ecorp-lightblue.png',
      onLogin: _authUserLogin,
      onSignup: _authUserSignUp,
      onSubmitAnimationCompleted: () {
        Provider.of<MyAppAuth.Auth>(context, listen: false)
            .tempData();
        Navigator.pushReplacementNamed(context, '/splash'); // Use 'MyAppAuth.Auth' with the prefix
      },
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        pageColorLight: Color(0xFF26425A),
        pageColorDark: Color(0xFF86A8CF),
        primaryColor: Color.fromARGB(255, 54, 93, 128),
        titleStyle: TextStyle(fontFamily: 'CaveatBrush', color: Colors.white)
      ),
      messages: LoginMessages(
        loginButton: 'Login', // Mengganti teks tombol login
        signupButton: 'SignUp', // Mengganti teks tombol signup
      ),
    );
  }
}
