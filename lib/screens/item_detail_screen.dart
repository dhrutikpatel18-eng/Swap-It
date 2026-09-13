import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/mock_data.dart';
import 'meetup_scheduler_screen.dart';

class ItemDetailScreen extends StatelessWidget {
  final Item item;
  const ItemDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: item.gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Center(child: Icon(item.icon, size: 64, color: Colors.white.withOpacity(0.85))),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _circleBtn(Icons.arrow_back, () => Navigator.pop(context)),
                      Row(children: [
                        _circleBtn(Icons.share_outlined, () {}),
                        const SizedBox(width: 8),
                        _circleBtn(Icons.favorite_border, () {}),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    _tag(item.category, AppColors.green100, AppColors.green700),
                    const SizedBox(width: 8),
                    _tag(item.condition, const Color(0xFFFFF1DC), const Color(0xFFA6650F)),
                  ]),
                  const SizedBox(height: 10),
                  Text(item.title, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: AppColors.ink900)),
                  const SizedBox(height: 6),
                  Row(children: [
                    const Icon(Icons.location_on_outlined, size: 13, color: AppColors.ink500),
                    const SizedBox(width: 4),
                    Text(item.distance, style: const TextStyle(fontSize: 12.5, color: AppColors.ink500)),
                    const Text('  •  Posted 2 days ago', style: TextStyle(fontSize: 12.5, color: AppColors.ink500)),
                  ]),
                  const SizedBox(height: 18),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [BoxShadow(color: AppColors.green900.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, 6))],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: AppColors.amber500,
                          child: Text(item.ownerInitials, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.ownerName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.ink900)),
                              Row(children: [
                                const Icon(Icons.star, size: 12, color: AppColors.amber500),
                                const SizedBox(width: 4),
                                Text('${item.ownerRating} · ${item.ownerSwaps} swaps',
                                    style: const TextStyle(fontSize: 12, color: AppColors.amber500, fontWeight: FontWeight.w700)),
                              ]),
                            ],
                          ),
                        ),
                        const Text('View Profile', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: AppColors.green700)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Description', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.ink900)),
                  const SizedBox(height: 8),
                  Text(item.description, style: const TextStyle(fontSize: 13.5, height: 1.6, color: AppColors.ink700)),
                  const SizedBox(height: 20),
                  const Text('Looking to swap for', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.ink900)),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: item.lookingFor
                        .map((t) => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                              decoration: BoxDecoration(
                                  color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.line)),
                              child: Text(t, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.ink700)),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
            decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: AppColors.line))),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(color: AppColors.green100, borderRadius: BorderRadius.circular(14)),
                    child: const Icon(Icons.chat_bubble_outline, color: AppColors.green700, size: 20),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => MeetupSchedulerScreen(item: item))),
                      child: const Text('Send Swap Request'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleBtn(IconData icon, VoidCallback onTap) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.92), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, size: 18, color: AppColors.ink700),
        ),
      );

  Widget _tag(String text, Color bg, Color fg) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(999)),
        child: Text(text, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: fg)),
      );
}
