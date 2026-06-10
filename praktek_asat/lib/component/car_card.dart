import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:praktek_asat/colors_car/colors_car.dart';

class CarCard extends StatelessWidget {
  final String brand;
  final String model;
  final String color;
  final dynamic year;
  final String vin;
  final String price;
  final dynamic availability;

  const CarCard({
    super.key,
    required this.brand,
    required this.model,
    required this.color,
    required this.year,
    required this.vin,
    required this.price,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAvailable =
        availability == true || availability.toString().toLowerCase() == 'true';

    final Color dynamicCarColor = getCarColor(color);

    // untuk border warna bulet kalo warnaya wara terang biar kontras
    final bool isLightColor =
        color.toLowerCase() == 'white' || color.toLowerCase() == 'silver';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // MEREK, MODEL, TAHUN
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              brand,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF64748B),
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              model,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF0F172A),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //KOTAK TAHUN
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          year.toString(),
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF334155),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //WARNA
                      Row(
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: dynamicCarColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isLightColor
                                    ? const Color(0xFFCBD5E1)
                                    : Colors.transparent,
                                width: isLightColor ? 1 : 0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            color,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: const Color(0xFF475569),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      //STATUS
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isAvailable
                              ? const Color(0xFFDCFCE7)
                              : const Color(0xFFFEE2E2), // Hijau / Merah soft
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isAvailable
                                  ? LucideIcons.checkCircle2
                                  : LucideIcons.xCircle,
                              size: 14,
                              color: isAvailable
                                  ? const Color(0xFF15803D)
                                  : const Color(0xFFB91C1C),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              isAvailable ? 'Tersedia' : 'Terjual',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isAvailable
                                    ? const Color(0xFF15803D)
                                    : const Color(0xFFB91C1C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const Divider(color: Color(0xFFE2E8F0), height: 1),
                  const SizedBox(height: 16),

                  //VIN (NOMOR RANGKA)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          LucideIcons.fingerprint,
                          size: 16,
                          color: Color(0xFF94A3B8),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'VIN: ',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            vin,
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 12,
                              color: const Color(0xFF334155),
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // SECTION HARGA
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              color: const Color(0xFF4F46E5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Estimasi Nilai Pasar',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: const Color(0xFFC7D2FE),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    price,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
