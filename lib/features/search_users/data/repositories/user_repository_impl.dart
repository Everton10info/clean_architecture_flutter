import 'dart:convert';

import 'package:flutter_clean_architeture/core/http/http_client.dart';
import 'package:flutter_clean_architeture/features/search_users/data/dtos/user_dto.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/repositories/users_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AppClient httpClient;

  UserRepositoryImpl(this.httpClient);
  @override
  Future<List<UserEntity>> getListUser() async {
    List<UserEntity> listUser;
    var resultClient = await httpClient.get();
    final List res = jsonDecode(resultClient);
    listUser = res.map((e) => User.fromJson(e)).toList();
    return listUser;
  }
}
