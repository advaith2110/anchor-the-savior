import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/support_session.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  bool _started = false;
  int _step = 0;
  final List<String> _prompts = [
    'Name 5 things you can see.',
    'Name 4 things you can feel.',
    'Name 3 things you can hear.',
    'Name 2 things you can smell.',
    'Name 1 thing you can taste.',
  ];

  String _mood = 'calm';
  final TextEditingController _noteController = TextEditingController();

  Future<void> _finish() async {
    final session = SupportSession(
      id: const Uuid().v4(),
      mood: _mood,
      note: _noteController.text.trim(),
      createdAt: DateTime.now(),
      copingStrategy: 'Grounding routine',
    );

    Navigator.of(context).pop(session);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panic mode'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: !_started
          ? _IntroView(
              onStart: () => setState(() => _started = true),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grounding step ${_step + 1} of ${_prompts.length}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _prompts[_step],
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 18),
                        TextField(
                          maxLines: 3,
                          decoration: const InputDecoration(
                            hintText: 'Write what you notice...',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _step > 0
                            ? () => setState(() => _step--)
                            : null,
                        child: const Text('Back'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          if (_step < _prompts.length - 1) {
                            setState(() => _step++);
                          } else {
                            _finish();
                          }
                        },
                        child: Text(_step < _prompts.length - 1 ? 'Next' : 'Finish'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
      ),
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }
}

class _IntroView extends StatelessWidget {
  final VoidCallback onStart;

  const _IntroView({required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pause. Breathe. Return to the present.',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'This exercises helps you slow your thoughts and orient to what is steady around you.',
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onStart,
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text('Start grounding'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
