import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/mock_data.dart';
import 'item_detail_screen.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    final item = mockItems.first;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFDCEFE3), Color(0xFFBFE0CC)])),
            child: Stack(
              children: const [
                Positioned(top: 120, left: 90, child: Icon(Icons.location_on, color: AppColors.green700, size: 30)),
                Positioned(top: 220, left: 240, child: Icon(Icons.location_on, color: AppColors.green700, size: 22)),
                Positioned(top: 80, left: 260, child: Icon(Icons.location_on, color: AppColors.green700, size: 18)),
                Positioned(top: 320, left: 60, child: Icon(Icons.location_on, color: AppColors.green700, size: 20)),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12)],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, size: 18, color: AppColors.ink500),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: InputBorder.none, hintText: 'Search this area...'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ItemDetailScreen(item: item))),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 16)],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(colors: item.gradient),
                      ),
                      child: Icon(item.icon, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title, style: const TextStyle(fontWeight: FontWeight.w700)),
                          Text('${item.distance} · ${item.ownerName}', style: const TextStyle(fontSize: 11.5, color: AppColors.ink500)),
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(color: AppColors.green100, borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.navigation_outlined, color: AppColors.green700, size: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
