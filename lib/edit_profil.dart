import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_travel_3/provider_profile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String profileImage;

  EditProfilePage({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.profileImage,
  });

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late String _profileImagePath;

  @override
  void initState() {
    super.initState();
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    _nameController = TextEditingController(text: userProvider.name);
    _phoneNumberController =
        TextEditingController(text: userProvider.phoneNumber);
    _emailController = TextEditingController(text: userProvider.email);
    _profileImagePath = userProvider.profileImage;
  }

  // Fungsi untuk memilih gambar dari galeri
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImagePath = pickedFile.path;
        print('_profileImagePath: $_profileImagePath');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF26425A),
        foregroundColor: Colors.white,
        title: Text('Edit Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: _profileImagePath.isNotEmpty
                    ? FileImage(File(_profileImagePath)) as ImageProvider
                    : AssetImage('assets/images/KotaBandung.jpeg'),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama Panggilan'),
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Nomor Telepon'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Mendapatkan provider
                // var userProvider =
                //     Provider.of<UserProvider>(context, listen: false);

                // Memperbarui data pengguna
                userProvider.updateProfile(
                  name: _nameController.text,
                  phoneNumber: _phoneNumberController.text,
                  email: _emailController.text,
                  profileImage: _profileImagePath,
                );

                // Kembali ke halaman sebelumnya
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
