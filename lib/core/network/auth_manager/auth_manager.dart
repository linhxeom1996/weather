// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AuthManager extends StateNotifier<UserEntity?> {
//   final GetUserUseCase getUserUseCase;

//   AuthManager(this.getUserUseCase) : super(null);

//   Future<void> checkUserStatus() async {
//     final result = await getUserUseCase.execute();
//     result.fold(
//       (failure) => state = null,
//       (user) => state = user,
//     );
//   }

//   void logout() {
//     state = null;
//   }

//   bool get isLoggedIn => state != null;
// }