import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RequestsTab extends StatefulWidget {
  const RequestsTab({super.key});

  @override
  State<RequestsTab> createState() => _RequestsTabState();
}

class _RequestsTabState extends State<RequestsTab> {
  int segment = 0;
  final labels = const ['Pending', 'Accepted', 'History'];

  final requests = const [
    {'title': 'Mountain Bike Helmet ⇄ Bookshelf', 'sub': 'from Marcus B. · 2 hours ago', 'initials': 'MB', 'color': Color(0xFF4E8FD6), 'status': 'pending'},
    {'title': 'Design Book Bundle ⇄ Desk Lamp', 'sub': 'from Sarah K. · Yesterday', 'initials': 'SK', 'color': Color(0xFFB5589C), 'status': 'pending'},
    {'title': 'Canon Camera Tripod ⇄ Bookshelf', 'sub': 'with James T. · 3 days ago', 'initials': 'JT', 'color': Color(0xFF2FB374), 'status': 'accepted'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Swap Requests', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.ink900)),
                Icon(Icons.check_circle_outline, color: AppColors.ink700),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
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
                        decoration: BoxDecoration(
                          color: active ? AppColors.green700 : Colors.transparent,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        alignment: Alignment.center,
                        child: Text(labels[i],
                            style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: active ? Colors.white : AppColors.green700)),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
              itemCount: requests.length,
              itemBuilder: (_, i) {
                final r = requests[i];
                final isPending = r['status'] == 'pending';
                return Container(
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
                      Row(
                        children: [
                          CircleAvatar(radius: 22, backgroundColor: r['color'] as Color, child: Text(r['initials'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800))),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(r['title'] as String, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                                Text(r['sub'] as String, style: const TextStyle(fontSize: 12, color: AppColors.ink500)),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: isPending ? const Color(0xFFFEF1DC) : AppColors.green100,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(isPending ? 'Pending' : 'Accepted',
                                style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w800, color: isPending ? const Color(0xFFA6650F) : AppColors.green700)),
                          ),
                        ],
                      ),
                      if (isPending) ...[
                        const SizedBox(height: 12),
                        Row(children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Request accepted'))),
                              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(38), padding: EdgeInsets.zero, textStyle: const TextStyle(fontSize: 12.5)),
                              child: const Text('Accept'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Request declined'))),
                              style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(38), side: const BorderSide(color: AppColors.line)),
                              child: const Text('Decline', style: TextStyle(color: AppColors.ink700, fontSize: 12.5)),
                            ),
                          ),
                        ]),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
