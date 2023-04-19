import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/show_list_users/show_list_users_imp.dart';

class HomeController {
  final ShowUsersImp showUsers;
  final showList = ValueNotifier<List<UserEntity>>([]);

  final loader = ValueNotifier<bool>(false);

  HomeController(this.showUsers);

  displayUsers() {
    loader.value = true;
    showUsers().then((value) {
      showList.value = value;
      Future.delayed(const Duration(seconds: 2));
      loader.value = false;
    });
  }
}
