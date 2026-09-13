import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.anchor, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'ANCHOR',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'A calm place to land when things feel intense.',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Anchor helps you slow the spiral, ground your attention, and reach out to what steadies you.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.grey.shade700,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 28),
              _ActionCard(
                title: 'Panic mode',
                subtitle: 'Step through a grounding routine and a steady reset',
                icon: Icons.safety_check,
                onTap: () => Navigator.of(context).pushNamed('/support'),
              ),
              const SizedBox(height: 16),
              _ActionCard(
                title: 'Grounding activities',
                subtitle: 'Use small rituals to reconnect to the present',
                icon: Icons.self_improvement,
                onTap: () => Navigator.of(context).pushNamed('/grounding'),
              ),
              const SizedBox(height: 16),
              _ActionCard(
                title: 'Trusted contact',
                subtitle: 'Keep one safe person ready when support is needed',
                icon: Icons.people_alt,
                onTap: () => Navigator.of(context).pushNamed('/trusted'),
              ),
              const SizedBox(height: 16),
              _ActionCard(
                title: 'Check-in',
                subtitle: 'Notice how you are doing after a hard moment',
                icon: Icons.favorite_border,
                onTap: () => Navigator.of(context).pushNamed('/checkin'),
              ),
              const SizedBox(height: 16),
              _ActionCard(
                title: 'My patterns',
                subtitle: 'Look back at your support sessions and recurring signals',
                icon: Icons.bar_chart,
                onTap: () => Navigator.of(context).pushNamed('/patterns'),
              ),
              const SizedBox(height: 16),
              _ActionCard(
                title: 'Settings',
                subtitle: 'Adjust the experience to feel calmer and simpler',
                icon: Icons.settings,
                onTap: () => Navigator.of(context).pushNamed('/settings'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
