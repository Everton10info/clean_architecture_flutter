import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/use_cases/search_user/search_user_usecase.dart';

class SearchUserImpl implements SearchUsers {
  @override
  List<UserEntity> call(String nameUser, List<UserEntity> users) {
    var searchList = <UserEntity>[];
    var result = users.where(
      (element) => element.name!.toString().toLowerCase().trim().contains(
            nameUser.trim().toLowerCase(),
          ),
    );

    if (result.isEmpty) {
      searchList.addAll(users);
    } else {
      searchList.addAll(result);
    }

    return searchList;
  }
}
