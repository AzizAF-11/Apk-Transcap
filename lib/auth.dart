import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  Timer? _authTimer;
  String? _idToken, userId;
  DateTime? _expiryDate;

  late String _tempidToken, tempuserId;
  late DateTime _tempexpiryDate;
  bool _isMounted = true;

  Future<void> tempData() async {
    _idToken = _tempidToken;
    userId = tempuserId;
    _expiryDate = _tempexpiryDate;

    final sharedPref = await SharedPreferences.getInstance();

    final myMapSPref = json.encode({
      'token': _tempidToken,
      'uid': tempuserId,
      'expired': _tempexpiryDate.toIso8601String(),
    });

    sharedPref.setString('authData', myMapSPref);

    _autologout();
    notifyListeners();
  }

  bool get isMounted {
    return _isMounted;
  }

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_idToken != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _expiryDate != null) {
      return _idToken;
    } else {
      return null;
    }
  }

  Future<void> signup(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDBs1DPK2qfnCziALDHnW1zUZGVRoWoUNo");

    try {
      var response = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      var responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']["message"];
      }

      _tempidToken = responseData["idToken"];
      tempuserId = responseData["localId"];
      _tempexpiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData["expiresIn"]),
        ),
      );
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDBs1DPK2qfnCziALDHnW1zUZGVRoWoUNo");

    try {
      var response = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      var responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']["message"];
      }
      _tempidToken = responseData["idToken"];
      tempuserId = responseData["localId"];
      _tempexpiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData["expiresIn"]),
        ),
      );
    } catch (error) {
      throw error;
    }
  }

  Future<void> logout() async {
    print('Before Logout - isAuth: ${isAuth}');

    _idToken = null;
    userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    // await PesananStorage.clearPesanan();
    // final pref = await SharedPreferences.getInstance();
    // pref.clear();

    notifyListeners();

    print('Logout called');

    print('After Logout - isAuth: ${isAuth}');
  }

  void _autologout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry = _tempexpiryDate.difference(DateTime.now()).inSeconds;
    print(timeToExpiry);
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  Future<bool> autoLogin() async {
    final pref = await SharedPreferences.getInstance();

    if (!pref.containsKey('authData')) {
      return false;
    }

    final myData =
        json.decode(pref.getString('authData') ?? '{}') as Map<String, dynamic>;

    final myExpiryDateString = myData["expired"] as String?;
    if (myExpiryDateString == null) {
      return false;
    }

    final myExpiryDate = DateTime.tryParse(myExpiryDateString);
    if (myExpiryDate == null || myExpiryDate.isBefore(DateTime.now())) {
      // Token telah kedaluwarsa atau tidak valid
      return false;
    }

    _idToken = myData["token"] as String?;
    userId = myData["uid"] as String?;
    _expiryDate = myExpiryDate;

    if (_idToken != null && userId != null && _expiryDate != null) {
      if (_expiryDate!.isAfter(DateTime.now())) {
        // Pengguna masih terotentikasi
        notifyListeners();
        return true;
      } else {
        // Token telah kedaluwarsa
        logout(); // Melakukan logout karena token sudah tidak valid
        return false;
      }
    }

    // Data otentikasi tidak lengkap atau tidak valid
    return false;
  }

  void dispose() {
    _isMounted = false;
    super.dispose();
  }
}
