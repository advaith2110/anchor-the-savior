import 'package:flutter/material.dart';

import '../models/support_session.dart';

class PatternsScreen extends StatelessWidget {
  const PatternsScreen({super.key, this.sessions = const []});

  final List<SupportSession> sessions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My patterns')),
      body: sessions.isEmpty
          ? const Center(
              child: Text('No sessions recorded yet. Your patterns will show here.'))
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: sessions.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final session = sessions[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          session.mood.toUpperCase(),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(session.note.isEmpty ? 'No notes added.' : session.note),
                        const SizedBox(height: 8),
                        Text(
                          'On ${session.createdAt.toLocal().toString().split(' ').first}',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
