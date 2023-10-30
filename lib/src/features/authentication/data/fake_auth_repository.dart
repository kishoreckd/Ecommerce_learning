import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/src/utils/in_memory_store.dart';
import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';

class FakeAuthRepository {
  final _authstate = InMemoryStore<AppUser?>(null);

  Stream<AppUser?> authStateChanges() => Stream.value(null);
  AppUser? get currentUser => _authstate.value;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    if (currentUser == null) {
      _createNewUser(email);
    }
  }

  Future<void> createUserWithEmailPassword(
      String email, String password) async {
    if (currentUser == null) {
      _createNewUser(email);
    }
  }

  void dispose() => _authstate.close();
  Future<void> signOut() async {
    // await Future.delayed(const Duration(seconds: 3));
    // throw Exception('connection failed');
    _authstate.value = null;
  }

  void _createNewUser(String email) {
    _authstate.value ==
        AppUser(uid: email.split('').reversed.join(), email: email);
  }
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  final auth = FakeAuthRepository();
  ref.onDispose(() => auth.dispose());
  return auth;
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
