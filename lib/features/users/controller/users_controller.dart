import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reqres_in_api_example/core/screen_state/screen_state.dart';
import 'package:reqres_in_api_example/features/users/model/users_model.dart';
import 'package:reqres_in_api_example/features/users/service/users_service.dart';

class UsersController extends AutoDisposeNotifier<ScreenState<UsersModel>> {
  @override
  ScreenState<UsersModel> build() {
    loadUsers();
    return LoadingState<UsersModel>();
  }

  var _usersModel = UsersModel();

  Future<void> loadUsers() async {
    try {
      if (_usersModel.page != null &&
          _usersModel.page == _usersModel.totalPages) {
        return;
      }

      final response = await const UsersService().loadUsers(
        page: (_usersModel.page ?? 0) + 1,
      );

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final usersModel = UsersModel.fromJson(json);

      _usersModel = _usersModel.copyWith(
        page: usersModel.page,
        perPage: usersModel.perPage,
        total: usersModel.total,
        totalPages: usersModel.totalPages,
        support: usersModel.support,
        users: (_usersModel.users ?? [])..addAll(usersModel.users ?? []),
      );

      state = SuccessState(data: _usersModel);
    } catch (e) {
      state = ErrorState(message: '$e');
    }
  }
}

final usersProvider =
    AutoDisposeNotifierProvider<UsersController, ScreenState<UsersModel>>(
  () => UsersController(),
);
