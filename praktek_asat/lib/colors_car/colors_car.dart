import 'package:flutter/material.dart';

//CONVERTS WARNA JADI BULET BULET
Color getCarColor(String colorName) {
  switch (colorName.toLowerCase().trim()) {
    case 'red':
      return Colors.red;
    case 'blue':
      return Colors.blue;
    case 'green':
      return Colors.green;
    case 'yellow':
      return Colors.amber;
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    case 'grey':
    case 'gray':
      return Colors.grey;
    case 'silver':
      return const Color(0xFFE0E0E0);
    case 'maroon':
      return const Color(0xFF800000);
    case 'purple':
      return Colors.purple;
    case 'orange':
      return Colors.orange;
    case 'brown':
      return Colors.brown;
    case 'gold':
      return const Color(0xFFFFD700);
    //WARNA ANEH (MINTA TOLONG AI CARIIN KODE HEXNYA)
    case 'mauve':
    case 'mauv':
      return const Color(0xFFE0B0FF); // Ungu muda pucat / mallow
    case 'puce':
      return const Color(0xFFCC8899); // Pink gelap kecokelatan
    case 'aquamarine':
      return const Color(0xFF7FFFD4); // Hijau kebiruan muda
    case 'teal':
      return const Color(0xFF008080); // Biru hijau tua
    case 'beige':
    case 'cream':
      return const Color(0xFFF5F5DC); // Krem / Abu-abu kekuningan
    case 'khaki':
      return const Color(0xFFC3B091); // Warna tanah / khaki
    case 'crimson':
      return const Color(0xFFDC143C); // Merah tua menyala
    case 'turquoise':
      return const Color(0xFF40E0D0); // Biru Toska
    default:
      return const Color(0xFF6366F1);
  }
}