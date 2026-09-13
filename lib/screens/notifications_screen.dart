import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final today = [
      {'icon': Icons.swap_horiz, 'bg': AppColors.green100, 'fg': AppColors.green700, 'title': 'New swap request', 'sub': 'Marcus B. wants to swap for your Mountain Bike Helmet', 'time': '10 minutes ago'},
      {'icon': Icons.location_on_outlined, 'bg': const Color(0xFFFEF1DC), 'fg': const Color(0xFFA6650F), 'title': 'Meet-up reminder', 'sub': 'Your meet-up at Melbourne Central Library starts in 1 hour', 'time': '1 hour ago'},
    ];
    final earlier = [
      {'icon': Icons.favorite_border, 'bg': AppColors.green100, 'fg': AppColors.green700, 'title': 'Wishlist match found', 'sub': 'A new "Bookshelf" listing matches your wishlist', 'time': 'Yesterday'},
      {'icon': Icons.check_circle_outline, 'bg': AppColors.green100, 'fg': AppColors.green700, 'title': 'Request accepted', 'sub': 'James T. accepted your swap for Canon Camera Tripod', 'time': '3 days ago'},
    ];

    Widget tile(Map m) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [BoxShadow(color: AppColors.green900.withOpacity(0.06), blurRadius: 14)],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: m['bg'] as Color, shape: BoxShape.circle),
                child: Icon(m['icon'] as IconData, color: m['fg'] as Color, size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(m['title'] as String, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                    const SizedBox(height: 2),
                    Text(m['sub'] as String, style: const TextStyle(fontSize: 12, color: AppColors.ink500)),
                    const SizedBox(height: 4),
                    Text(m['time'] as String, style: const TextStyle(fontSize: 11, color: AppColors.ink300)),
                  ],
                ),
              ),
            ],
          ),
        );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        title: const Text('Notifications'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Today', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.ink900)),
          const SizedBox(height: 10),
          ...today.map(tile),
          const SizedBox(height: 6),
          const Text('Earlier', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.ink900)),
          const SizedBox(height: 10),
          ...earlier.map(tile),
        ],
      ),
    );
  }
}
