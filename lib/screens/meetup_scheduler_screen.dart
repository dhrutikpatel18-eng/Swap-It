import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/mock_data.dart';

class MeetupSchedulerScreen extends StatefulWidget {
  final Item item;
  const MeetupSchedulerScreen({super.key, required this.item});

  @override
  State<MeetupSchedulerScreen> createState() => _MeetupSchedulerScreenState();
}

class _MeetupSchedulerScreenState extends State<MeetupSchedulerScreen> {
  int selectedLocation = 0;
  DateTime date = DateTime.now();
  TimeOfDay time = const TimeOfDay(hour: 14, minute: 30);

  final locations = const [
    {'name': 'Melbourne Central Library', 'sub': '0.6 km · Open until 9pm', 'icon': Icons.local_library_outlined},
    {'name': 'Emporium Shopping Centre', 'sub': '1.1 km · Open until 7pm', 'icon': Icons.storefront_outlined},
    {'name': 'RMIT University Campus', 'sub': '1.4 km · Public access', 'icon': Icons.location_on_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        title: const Text('Schedule Meet-up'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Suggested safe locations', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: AppColors.ink900)),
          const SizedBox(height: 10),
          ...List.generate(locations.length, (i) {
            final l = locations[i];
            final selected = selectedLocation == i;
            return GestureDetector(
              onTap: () => setState(() => selectedLocation = i),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: selected ? AppColors.green700 : Colors.transparent, width: 1.5),
                  boxShadow: [BoxShadow(color: AppColors.green900.withOpacity(0.06), blurRadius: 14)],
                ),
                child: Row(children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: AppColors.green100, borderRadius: BorderRadius.circular(10)),
                    child: Icon(l['icon'] as IconData, color: AppColors.green700, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l['name'] as String, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                        Text(l['sub'] as String, style: const TextStyle(fontSize: 12, color: AppColors.ink500)),
                      ],
                    ),
                  ),
                  if (selected) const Icon(Icons.check_circle, color: AppColors.green700, size: 20),
                ]),
              ),
            );
          }),
          const SizedBox(height: 8),
          Row(children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  final picked = await showDatePicker(context: context, initialDate: date, firstDate: DateTime.now(), lastDate: DateTime(2030));
                  if (picked != null) setState(() => date = picked);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Date', suffixIcon: Icon(Icons.calendar_today_outlined, size: 16)),
                  child: Text('${date.day}/${date.month}/${date.year}'),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                onTap: () async {
                  final picked = await showTimePicker(context: context, initialTime: time);
                  if (picked != null) setState(() => time = picked);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: 'Time', suffixIcon: Icon(Icons.access_time, size: 16)),
                  child: Text(time.format(context)),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Meet-up confirmed!')));
              Navigator.popUntil(context, (r) => r.isFirst);
            },
            child: const Text('Confirm Meet-up'),
          ),
          const SizedBox(height: 14),
          const Text("You'll get a reminder notification before the meet-up",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 12.5, color: AppColors.ink500)),
        ],
      ),
    );
  }
}
