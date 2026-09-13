import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/support_session.dart';
import '../models/trusted_contact.dart';

class LocalAppRepository {
  static const _sessionsKey = 'anchor_sessions';
  static const _trustedContactKey = 'anchor_trusted_contact';
  static const _reduceAnimationsKey = 'anchor_reduce_animations';

  Future<List<SupportSession>> getSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final serialized = prefs.getStringList(_sessionsKey) ?? <String>[];

    return serialized
        .map((value) => SupportSession.fromJson(jsonDecode(value) as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveSessions(List<SupportSession> sessions) async {
    final prefs = await SharedPreferences.getInstance();
    final serialized = sessions.map((session) => jsonEncode(session.toJson())).toList();
    await prefs.setStringList(_sessionsKey, serialized);
  }

  Future<TrustedContact?> getTrustedContact() async {
    final prefs = await SharedPreferences.getInstance();
    final serialized = prefs.getString(_trustedContactKey);
    if (serialized == null) return null;

    return TrustedContact.fromJson(jsonDecode(serialized) as Map<String, dynamic>);
  }

  Future<void> saveTrustedContact(TrustedContact contact) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_trustedContactKey, jsonEncode(contact.toJson()));
  }

  Future<bool> getReduceAnimations() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_reduceAnimationsKey) ?? false;
  }

  Future<void> setReduceAnimations(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_reduceAnimationsKey, value);
  }
}
