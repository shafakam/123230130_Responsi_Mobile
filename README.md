# Keripikroll

Aplikasi Flutter sederhana untuk menampilkan daftar anime dari API Kitsu. Project ini dibuat untuk responsi praktikum mobile.

## Fitur

- Login menggunakan username dan password.
- Session login disimpan dengan SharedPreferences.
- Menampilkan daftar anime dalam bentuk grid.
- Detail anime berisi cover, rating, episode, rating umur, dan sinopsis.
- Menambahkan dan menghapus anime favorit.
- Data favorit disimpan menggunakan Hive.
- Profile menampilkan username dan jumlah anime favorit.

## API

Data anime diambil dari Kitsu:

```text
https://kitsu.io/api/edge/anime/?page[limit]=20&page[offset]=0
https://kitsu.io/api/edge/anime/{anime_id}
```

## Login

Username bebas diisi apa saja.

```text
Password: 123230130
```

## Cara Menjalankan

```bash
flutter pub get
flutter run
```

## Package

- get
- http
- hive
- hive_flutter
- shared_preferences
