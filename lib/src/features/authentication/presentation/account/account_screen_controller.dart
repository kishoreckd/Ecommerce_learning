import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';

class AccountScreenController extends StateNotifier<AsyncValue<void>> {
  AccountScreenController({required this.authRepository})
      : super(const AsyncValue<void>.data(null));

  final FakeAuthRepository authRepository;
  Future<void> signOut() async {
    /// set the loading
    /// sign out (using auth repository)
    /// if success set the data
    /// if error , set state error

    try {
      state = const AsyncValue<void>.loading();
      await authRepository.signOut();

      state = const AsyncValue<void>.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final AccountScreenControllerProvider = StateNotifierProvider.autoDispose<
    AccountScreenController, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountScreenController(authRepository: authRepository);
});
