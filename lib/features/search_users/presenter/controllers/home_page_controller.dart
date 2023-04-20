// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/search_user/search_user_usecase_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/show_list_users/show_list_users_imp.dart';

class HomeController {
  final ShowUsersImp showUsers;
  SearchUserImp searchUser;

  final showList = ValueNotifier<List<UserEntity>>([]);

  final loader = ValueNotifier<bool>(false);

  HomeController(
    this.showUsers,
    this.searchUser,
  );

  displayUsers() async {
    loader.value = true;
    showUsers().then((value) {
      showList.value = value;

      loader.value = false;
    });
  }
}
