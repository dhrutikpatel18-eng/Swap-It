import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  bool available = true;
  String category = 'Photography';
  String condition = 'Like New';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
        title: const Text('Add New Item'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: List.generate(
                3,
                (i) => Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: i < 2 ? 10 : 0),
                    height: 76,
                    decoration: BoxDecoration(
                      color: AppColors.green50,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.line, style: BorderStyle.solid),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: AppColors.green700, size: 20),
                        SizedBox(height: 4),
                        Text('Add Photo', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.green700)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const TextField(decoration: InputDecoration(labelText: 'Item title', hintText: 'e.g. Canon Camera Tripod')),
            const SizedBox(height: 14),
            const TextField(maxLines: 3, decoration: InputDecoration(labelText: 'Description', hintText: "Describe the item's condition and features...")),
            const SizedBox(height: 14),
            Row(children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: category,
                  decoration: const InputDecoration(labelText: 'Category'),
                  items: ['Photography', 'Furniture', 'Books', 'Sports', 'Electronics']
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) => setState(() => category = v ?? category),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: condition,
                  decoration: const InputDecoration(labelText: 'Condition'),
                  items: ['New', 'Like New', 'Good', 'Fair']
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) => setState(() => condition = v ?? condition),
                ),
              ),
            ]),
            const SizedBox(height: 14),
            const TextField(decoration: InputDecoration(labelText: 'Pickup location', prefixIcon: Icon(Icons.location_on_outlined), hintText: 'Melbourne CBD')),
            const SizedBox(height: 18),
            const Align(alignment: Alignment.centerLeft, child: Text('Availability', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.ink700))),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(color: AppColors.green100, borderRadius: BorderRadius.circular(999)),
              child: Row(children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => available = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      decoration: BoxDecoration(color: available ? AppColors.green700 : Colors.transparent, borderRadius: BorderRadius.circular(999)),
                      alignment: Alignment.center,
                      child: Text('Available', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.5, color: available ? Colors.white : AppColors.green700)),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => available = false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      decoration: BoxDecoration(color: !available ? AppColors.green700 : Colors.transparent, borderRadius: BorderRadius.circular(999)),
                      alignment: Alignment.center,
                      child: Text('Swapped', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.5, color: !available ? Colors.white : AppColors.green700)),
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 22),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Listing published!')));
                Navigator.pop(context);
              },
              child: const Text('Publish Listing'),
            ),
          ],
        ),
      ),
    );
  }
}
