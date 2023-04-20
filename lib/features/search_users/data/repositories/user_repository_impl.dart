import 'package:flutter_clean_architeture/core/http/http_client.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/repositories/users_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AppHttpClient httpClient;

  UserRepositoryImpl(this.httpClient);
  @override
  Future<List<UserEntity>> getListUser() async {
    List<UserEntity> listUser = await httpClient.get();
    return listUser;
  }
}
