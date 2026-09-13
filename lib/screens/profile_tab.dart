import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int segment = 2;
  final labels = const ['Listings', 'History', 'Reviews'];

  final reviews = const [
    {'name': 'Marcus B.', 'stars': '★★★★★', 'color': Color(0xFFF6C177), 'initials': 'MB', 'text': '"Smooth swap, item was exactly as described. Would swap again!"'},
    {'name': 'James T.', 'stars': '★★★★☆', 'color': Color(0xFF9FC7F0), 'initials': 'JT', 'text': '"Great communication and an easy, safe meet-up."'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(width: 38),
                Text('Profile', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                Icon(Icons.settings_outlined, color: AppColors.ink700),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
              child: Column(
                children: [
                  Container(
                    width: 84,
                    height: 84,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [Color(0xFFF6C177), Color(0xFFE8A33D)]),
                    ),
                    child: const Center(child: Text('EC', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800))),
                  ),
                  const SizedBox(height: 12),
                  const Text('Emily Carter', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.ink900)),
                  const SizedBox(height: 4),
                  const Text('★★★★☆ 4.8 · 32 swaps', style: TextStyle(fontSize: 12.5, color: AppColors.amber500, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 16),
                  Row(children: [
                    _stat('12', 'Listings'),
                    const SizedBox(width: 10),
                    _stat('32', 'Swaps'),
                    const SizedBox(width: 10),
                    _stat('4.8', 'Rating'),
                  ]),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(color: AppColors.green100, borderRadius: BorderRadius.circular(999)),
                    child: Row(
                      children: List.generate(labels.length, (i) {
                        final active = segment == i;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => segment = i),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 9),
                              decoration: BoxDecoration(color: active ? AppColors.green700 : Colors.transparent, borderRadius: BorderRadius.circular(999)),
                              alignment: Alignment.center,
                              child: Text(labels[i], style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: active ? Colors.white : AppColors.green700)),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...reviews.map((r) => Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [BoxShadow(color: AppColors.green900.withOpacity(0.06), blurRadius: 16)],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              CircleAvatar(radius: 18, backgroundColor: r['color'] as Color, child: Text(r['initials'] as String, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800))),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(r['name'] as String, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                                    Text(r['stars'] as String, style: const TextStyle(color: AppColors.amber500, fontSize: 12)),
                                  ],
                                ),
                              ),
                            ]),
                            const SizedBox(height: 10),
                            Text(r['text'] as String, style: const TextStyle(fontSize: 13, color: AppColors.ink700)),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(String value, String label) => Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [BoxShadow(color: AppColors.green900.withOpacity(0.06), blurRadius: 16)],
          ),
          child: Column(children: [
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.green700)),
            Text(label, style: const TextStyle(fontSize: 10.5, color: AppColors.ink500)),
          ]),
        ),
      );
}
