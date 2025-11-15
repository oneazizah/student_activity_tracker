import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Center( // <-- buat semua konten di tengah layar
        child: Column(
          mainAxisSize: MainAxisSize.min, // agar kolom menyesuaikan tinggi konten
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              "One Azizah",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "NIM: 1230076",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
