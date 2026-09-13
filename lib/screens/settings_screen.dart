import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _reduceAnimations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            SwitchListTile(
              title: const Text('Reduce motion'),
              subtitle: const Text('Simplify animations when you need a calmer experience.'),
              value: _reduceAnimations,
              onChanged: (value) => setState(() => _reduceAnimations = value),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.refresh),
              label: const Text('Load demo data'),
            ),
          ],
        ),
      ),
    );
  }
}
