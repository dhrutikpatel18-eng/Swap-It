import 'package:flutter/material.dart';

class Item {
  final String title;
  final String condition;
  final String distance;
  final String category;
  final List<Color> gradient;
  final IconData icon;
  final String description;
  final String ownerName;
  final String ownerInitials;
  final double ownerRating;
  final int ownerSwaps;
  final List<String> lookingFor;

  const Item({
    required this.title,
    required this.condition,
    required this.distance,
    required this.category,
    required this.gradient,
    required this.icon,
    required this.description,
    required this.ownerName,
    required this.ownerInitials,
    required this.ownerRating,
    required this.ownerSwaps,
    required this.lookingFor,
  });
}

const mockItems = <Item>[
  Item(
    title: 'Canon Camera Tripod',
    condition: 'Like New',
    distance: '1.2 km away',
    category: 'Photography',
    gradient: [Color(0xFF8FD3B0), Color(0xFF2FB374)],
    icon: Icons.camera_alt_outlined,
    description:
        "Lightweight aluminium tripod, adjustable up to 150cm. Used for about a year of studio shoots — barely any wear, all leg locks and the ball head work smoothly. Comes with the original carry bag.",
    ownerName: 'Emily Carter',
    ownerInitials: 'EC',
    ownerRating: 4.8,
    ownerSwaps: 32,
    lookingFor: ['Bookshelf', 'Studio Lighting', 'Open to offers'],
  ),
  Item(
    title: 'Oak Bookshelf',
    condition: 'Good',
    distance: '2.5 km away',
    category: 'Furniture',
    gradient: [Color(0xFFF6C177), Color(0xFFE8A33D)],
    icon: Icons.shelves,
    description:
        "Solid oak 5-shelf bookcase, minor surface scratches on the top shelf. Sturdy and well-built, easy to disassemble for transport.",
    ownerName: 'Marcus B.',
    ownerInitials: 'MB',
    ownerRating: 4.6,
    ownerSwaps: 18,
    lookingFor: ['Camera gear', 'Desk lamp'],
  ),
  Item(
    title: 'Mountain Bike Helmet',
    condition: 'New',
    distance: '0.8 km away',
    category: 'Sports',
    gradient: [Color(0xFF9FC7F0), Color(0xFF4E8FD6)],
    icon: Icons.sports_motorsports_outlined,
    description:
        "Brand new, never worn — wrong size ordered online. Includes original box and adjustable fit dial.",
    ownerName: 'Sarah K.',
    ownerInitials: 'SK',
    ownerRating: 4.9,
    ownerSwaps: 41,
    lookingFor: ['Bookshelf', 'Kitchenware'],
  ),
  Item(
    title: 'Design Book Bundle',
    condition: 'Good',
    distance: '3.1 km away',
    category: 'Books',
    gradient: [Color(0xFFE4A6D1), Color(0xFFB5589C)],
    icon: Icons.menu_book_outlined,
    description:
        "Set of 6 graphic design and typography reference books. Great condition, light shelf wear on covers.",
    ownerName: 'James T.',
    ownerInitials: 'JT',
    ownerRating: 4.7,
    ownerSwaps: 25,
    lookingFor: ['Camera tripod', 'Art supplies'],
  ),
];
