import 'dart:convert';

import 'package:flutter_clean_architeture/core/http/http_client.dart';
import 'package:flutter_clean_architeture/features/search_users/data/dtos/user_dto.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/repositories/users_repository.dart';

class UserRepositoryImp implements UserRepository {
  final AppClient httpClient;

  UserRepositoryImp(this.httpClient);
  @override
  Future<List<UserEntity>> getListUser() async {
    var result = await httpClient.get();
    final List res = jsonDecode(result);
    List<UserEntity> listUser;
    listUser = res.map((e) => User.fromJson(e)).toList();
    return listUser;
  }
}
