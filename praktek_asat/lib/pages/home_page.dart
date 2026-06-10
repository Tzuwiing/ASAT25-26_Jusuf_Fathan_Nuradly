import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktek_asat/services/api_services.dart';
import '../component/car_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        //APPBAR
        title: Column(
          children: [
            Text(
              'GARASI PREMIUM',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
                color: const Color(0xFF6366F1),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Exquisite Car Collection',
              style: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0F172A),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: const Color(0xFFE2E8F0), height: 1),
        ),
      ),
      // MENGAMBIL DATA PAS HALAMAN KEBUKA
      body: FutureBuilder<List<dynamic>>(
        future: _apiService.fetchCars(),
        builder: (context, snapshot) {
          // LOADING MEMUAT DATA
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4F46E5)),
              ),
            );
          }

          // JIKA DATA ERROR
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 48,
                    color: Colors.redAccent,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Gagal memuat data armada.',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF64748B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }

          // JIKA BERHASIL MEMUAT TAPI DATANYA NGGAK ADA
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'Tidak ada koleksi mobil saat ini.',
                style: GoogleFonts.inter(color: const Color(0xFF64748B)),
              ),
            );
          }

          // OPERASI SUKSES DAN SIAP MENAMPILKAN DATA
          final carsData = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            itemCount: carsData.length,
            itemBuilder: (context, index) {
              final car = carsData[index];

              return CarCard(
                brand: car['car'] ?? 'N/A',
                model: car['car_model'] ?? 'N/A',
                color: car['car_color'] ?? 'N/A',
                year: car['car_model_year'] ?? '-',
                vin: car['car_vin'] ?? 'N/A',
                price: car['price'] ?? '\$0',
                availability: car['availability'] ?? false,
              );
            },
          );
        },
      ),
    );
  }
}
