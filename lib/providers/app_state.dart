import 'package:flutter/foundation.dart';

import '../models/support_session.dart';
import '../models/trusted_contact.dart';
import '../repositories/local_app_repository.dart';

class AppState extends ChangeNotifier {
  final LocalAppRepository _repository;

  AppState(this._repository);

  List<SupportSession> sessions = [];
  TrustedContact? trustedContact;
  bool reduceAnimations = false;

  Future<void> load() async {
    sessions = await _repository.getSessions();
    trustedContact = await _repository.getTrustedContact();
    reduceAnimations = await _repository.getReduceAnimations();
    notifyListeners();
  }

  Future<void> addSession(SupportSession session) async {
    sessions = [session, ...sessions];
    await _repository.saveSessions(sessions);
    notifyListeners();
  }

  Future<void> saveTrustedContact(TrustedContact contact) async {
    trustedContact = contact;
    await _repository.saveTrustedContact(contact);
    notifyListeners();
  }

  Future<void> setReduceAnimations(bool value) async {
    reduceAnimations = value;
    await _repository.setReduceAnimations(value);
    notifyListeners();
  }
}
