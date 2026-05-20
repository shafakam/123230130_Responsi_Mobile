import 'package:responsi/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  // Get.put membuat LoginController aktif dan bisa dipakai di halaman ini.
  // Kalau butuh logic login atau ambil isi TextField, ubahnya di controller.
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold adalah kerangka utama halaman: tempat body, appBar, drawer, dll.
      body: Center(
        // Center membuat isi halaman berada di tengah layar.
        child: SingleChildScrollView(
          // SingleChildScrollView membuat form tetap bisa discroll saat layar kecil
          // atau saat keyboard muncul, jadi UI tidak kepotong.
          padding: const EdgeInsets.all(24.0),
          child: Column(
            // Column menyusun widget dari atas ke bawah.
            // mainAxisAlignment mengatur posisi widget di sumbu utama Column,
            // yaitu vertikal. center berarti isi Column ditaruh di tengah.
            // Kalau mau naik/turun, bisa ganti ke start, end, spaceBetween, dll.
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon logo aplikasi. Ubah size untuk besar-kecil, color untuk warna.
              const Icon(Icons.shopping_bag, size: 100, color: Colors.blue),

              // SizedBox dipakai sebagai jarak kosong antar widget.
              // height mengatur jarak vertikal.
              const SizedBox(height: 16),

              // Text judul aplikasi. TextStyle mengatur ukuran dan tebal tulisan.
              const Text(
                'Toko Online',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),

              // TextField input username.
              // controller menyambungkan isi input ke LoginController.
              TextField(
                controller: controller.usernameController,
                decoration: const InputDecoration(
                  // labelText adalah teks kecil yang tampil sebagai label input.
                  labelText: 'Username',

                  // OutlineInputBorder membuat input punya garis kotak.
                  border: OutlineInputBorder(),

                  // prefixIcon adalah ikon di bagian kiri TextField.
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),

              // TextField input password.
              TextField(
                controller: controller.passwordController,

                // obscureText true membuat password disembunyikan.
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 24),

              // SizedBox di sini dipakai untuk mengatur ukuran tombol.
              SizedBox(
                // double.infinity membuat tombol selebar parent-nya.
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  // Saat tombol ditekan, jalankan fungsi login() dari controller.
                  onPressed: controller.login,
                  style: ElevatedButton.styleFrom(
                    // backgroundColor warna tombol, foregroundColor warna teks/icon.
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 18)),
                ),
              ),
              TextButton(
                onPressed: () => Get.toNamed(Routes.register),
                child: const Text('Belum punya akun? Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
