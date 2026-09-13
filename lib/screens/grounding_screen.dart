import 'package:flutter/material.dart';

class GroundingScreen extends StatelessWidget {
  const GroundingScreen({super.key});

  final List<_GroundingItem> _items = const [
    _GroundingItem('5-4-3-2-1', 'Notice five things you can see, four you can feel, and so on.'),
    _GroundingItem('Cold water', 'Splash cool water on your face or hold something cold.'),
    _GroundingItem('Slow exhale', 'Breathe out longer than you inhale to calm the body.'),
    _GroundingItem('Body scan', 'Tense and release each muscle group gently.'),
    _GroundingItem('Grounding object', 'Hold a textured item and focus on the sensation.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grounding activities')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: _items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(item.subtitle),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _GroundingItem {
  final String title;
  final String subtitle;

  const _GroundingItem(this.title, this.subtitle);
}
