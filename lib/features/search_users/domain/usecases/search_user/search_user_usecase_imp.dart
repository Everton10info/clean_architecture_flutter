import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/search_user/search_user_usecase.dart';

class SearchUserImpl implements SearchUser {
  final List<UserEntity> listUser;

  SearchUserImpl(this.listUser);
  @override
  UserEntity search(String value) {
    return listUser[0];
  }
}
