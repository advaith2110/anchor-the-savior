import 'package:flutter/material.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  String _selected = 'okay';
  final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Check-in')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'How are you feeling right now?',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: ['calm', 'okay', 'overwhelmed', 'unsafe'].map((mood) {
                final selected = _selected == mood;
                return ChoiceChip(
                  label: Text(mood),
                  selected: selected,
                  onSelected: (_) => setState(() => _selected = mood),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _notesController,
              minLines: 4,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Optional notes',
                hintText: 'What helped? What do you need next?',
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Save check-in'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }
}
