import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  late String _name;
  late String _phoneNumber;
  late String _email;
  late String _profileImage;
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }

  UserProvider() {
    _profileImage = 'assets/images/KotaBandung.jpeg';
    _name = 'User';
    _email = 'user@gmail.com';
    _phoneNumber = '081225612561'; 
    _loadUserProfile();
  }

  String get name => _name;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get profileImage => _profileImage;

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name') ?? '';
    _phoneNumber = prefs.getString('phoneNumber') ?? '';
    _email = prefs.getString('email') ?? '';
    _profileImage = prefs.getString('profileImage') ?? '';
    notifyListeners();
  }

  Future<void> _saveUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _name);
    prefs.setString('phoneNumber', _phoneNumber);
    prefs.setString('email', _email);
    prefs.setString('profileImage', _profileImage);
    print('Path Gambar Loaded: $_profileImage');
  }

  void updateProfile({
    required String name,
    required String phoneNumber,
    required String email,
    required String profileImage,
  }) {
    _name = name;
    _phoneNumber = phoneNumber;
    _email = email;
    _profileImage = profileImage;
    _saveUserProfile();
    notifyListeners();
  }

  void updateAuthStatus(bool isAuthenticated) {
    _isAuthenticated = isAuthenticated;
    notifyListeners();
  }
}

