import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/repositories/users_repository.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/search_user/search_user_usecase.dart';

class SearchUserImpl implements SearchUser {
  final UserRepository repository;
  List<UserEntity> listUser;

  SearchUserImpl(
    this.repository,
    this.listUser,
  );

  @override
  List<UserEntity> search(String valueSearch, List<UserEntity> users) {
    var search = <UserEntity>[];
    var contains = users.where(
      (element) => element.name!.contains(valueSearch),
    );
    if (contains.isEmpty) {
      search.addAll(users);
    } else {
      search.addAll(contains);
    }

    return search;
  }
}
