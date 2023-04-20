import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/search_user/search_user_usecase.dart';

class SearchUserImp implements SearchUser {
  @override
  List<UserEntity> call(String nameUser, List<UserEntity> users) {
    var searchList = <UserEntity>[];
    var contain = users.where(
      (element) => element.name!.toString().toLowerCase().trim().contains(
            nameUser.trim().toLowerCase(),
          ),
    );

    if (contain.isEmpty) {
      searchList.addAll(users);
    } else {
      searchList.addAll(contain);
    }

    contain = [];

    return searchList;
  }
}
