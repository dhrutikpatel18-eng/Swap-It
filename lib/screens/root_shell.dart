import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_tab.dart';
import 'map_tab.dart';
import 'requests_tab.dart';
import 'profile_tab.dart';
import 'add_item_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int index = 0;

  final tabs = const [HomeTab(), MapTab(), RequestsTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: index, children: tabs),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.green700,
        elevation: 4,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AddItemScreen())),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home_outlined, Icons.home, 'Home', 0),
            _navItem(Icons.location_on_outlined, Icons.location_on, 'Map', 1),
            const SizedBox(width: 40),
            _navItem(Icons.swap_horiz_outlined, Icons.swap_horiz, 'Requests', 2),
            _navItem(Icons.person_outline, Icons.person, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData outline, IconData filled, String label, int i) {
    final active = index == i;
    return InkWell(
      onTap: () => setState(() => index = i),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(active ? filled : outline, size: 22, color: active ? AppColors.green700 : AppColors.ink300),
            const SizedBox(height: 3),
            Text(label, style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600, color: active ? AppColors.green700 : AppColors.ink300)),
          ],
        ),
      ),
    );
  }
}
