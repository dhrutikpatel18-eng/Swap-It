import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/mock_data.dart';
import '../widgets/item_card.dart';
import 'notifications_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int chipIndex = 0;
  final chips = const ['All', 'Electronics', 'Furniture', 'Clothing', 'Books', 'Sports'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 6),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    gradient: const LinearGradient(colors: [AppColors.green500, AppColors.green700]),
                  ),
                  child: const Icon(Icons.swap_horiz_rounded, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 8),
                const Text('SwapIt', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: AppColors.green900)),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsScreen())),
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.notifications_outlined, color: AppColors.ink700),
                      Positioned(
                        top: -2,
                        right: -2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(color: AppColors.amber500, shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                  style: IconButton.styleFrom(backgroundColor: Colors.white, side: const BorderSide(color: AppColors.line)),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for items to swap...',
                      hintStyle: const TextStyle(color: AppColors.ink500, fontSize: 14),
                      prefixIcon: const Icon(Icons.search, size: 20),
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(color: AppColors.green100, borderRadius: BorderRadius.circular(9)),
                        child: const Icon(Icons.tune, size: 16, color: AppColors.green700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 36,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: chips.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (_, i) {
                        final active = i == chipIndex;
                        return GestureDetector(
                          onTap: () => setState(() => chipIndex = i),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: active ? AppColors.green700 : Colors.white,
                              borderRadius: BorderRadius.circular(999),
                              border: Border.all(color: active ? AppColors.green700 : AppColors.line),
                            ),
                            child: Text(chips[i],
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600, color: active ? Colors.white : AppColors.ink700)),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Near you', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.ink900)),
                      Text('See all', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.green700)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 0.78,
                    children: mockItems.map((item) => ItemCard(item: item)).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
