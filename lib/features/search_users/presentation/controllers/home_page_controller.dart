import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/use_cases/search_user/search_user_usecase.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/use_cases/show_list_users/show_list_users.dart';

class HomeController {
  final ShowUsers showUsers;

  final SearchUsers searchUsers;

  final userList = ValueNotifier<List<UserEntity>>([]);
  final showUserList = ValueNotifier<List<UserEntity>>([]);

  final loader = ValueNotifier<bool>(false);

  HomeController(
    this.showUsers,
    this.searchUsers,
  );

  void displayUsers() {
    loader.value = true;
    showUsers().then((value) {
      userList.value = value;
      showUserList.value = userList.value;

      loader.value = false;
    });
  }

  void searchUse(String name) {
    showUserList.value = searchUsers(name, userList.value);
  }
}
