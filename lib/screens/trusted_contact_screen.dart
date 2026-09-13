import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../models/trusted_contact.dart';

class TrustedContactScreen extends StatefulWidget {
  const TrustedContactScreen({super.key});

  @override
  State<TrustedContactScreen> createState() => _TrustedContactScreenState();
}

class _TrustedContactScreenState extends State<TrustedContactScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trusted contact')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'Choose one person who can help you feel safer when things are hard.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone or contact info'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(labelText: 'Message'),
              minLines: 3,
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                final contact = TrustedContact(
                  name: _nameController.text.trim(),
                  phone: _phoneController.text.trim(),
                  message: _messageController.text.trim(),
                );
                SharePlus.instance.share(
                  ShareParams(
                    text:
                        'Hey ${contact.name}, I want to let you know I may need support today. Please check in if you see this message: ${contact.message}',
                  ),
                );
                Navigator.of(context).pop(contact);
              },
              child: const Text('Save and share'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
