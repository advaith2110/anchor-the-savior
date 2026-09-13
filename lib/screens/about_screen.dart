import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'Anchor The Savior',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Anchor is a supportive personal wellness app designed to help people pause, regulate, and reconnect when a moment feels too intense. It encourages steady, self-directed support with grounding activities, a trusted contact, and check-ins that help people notice what helps them feel safer.',
            ),
          ],
        ),
      ),
    );
  }
}
