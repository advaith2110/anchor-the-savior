import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/support_session.dart';
import 'providers/app_state.dart';
import 'repositories/local_app_repository.dart';
import 'screens/about_screen.dart';
import 'screens/check_in_screen.dart';
import 'screens/grounding_screen.dart';
import 'screens/home_screen.dart';
import 'screens/patterns_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/support_screen.dart';
import 'screens/trusted_contact_screen.dart';
import 'theme/anchor_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = LocalAppRepository();
  final state = AppState(repository);
  await state.load();

  runApp(
    ChangeNotifierProvider.value(
      value: state,
      child: const AnchorApp(),
    ),
  );
}

class AnchorApp extends StatelessWidget {
  const AnchorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anchor The Savior',
      debugShowCheckedModeBanner: false,
      theme: AnchorTheme.light,
      routes: {
        '/': (context) => const HomeShell(),
        '/support': (context) => const SupportScreen(),
        '/grounding': (context) => const GroundingScreen(),
        '/trusted': (context) => const TrustedContactScreen(),
        '/checkin': (context) => const CheckInScreen(),
        '/patterns': (context) => const PatternsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/about': (context) => const AboutScreen(),
      },
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  static const _pages = [
    HomeScreen(),
    GroundingScreen(),
    CheckInScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.self_improvement), label: 'Grounding'),
          NavigationDestination(icon: Icon(Icons.favorite_border), label: 'Check-in'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.of(context).push<SupportSession>(
            MaterialPageRoute(builder: (_) => const SupportScreen()),
          );
          if (result != null && mounted) {
            context.read<AppState>().addSession(result);
          }
        },
        icon: const Icon(Icons.warning_amber_rounded),
        label: const Text('Panic mode'),
      ),
    );
  }
}
