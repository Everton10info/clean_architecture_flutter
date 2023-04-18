import 'package:test/test.dart';

import 'package:flutter_clean_architeture/features/search_users/data/datasources/user_http_cliente_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/data/repositories/user_repository_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/show_list_users/show_list_users_imp.dart';

void main() async {
  var usc = ShowUsersImp(
    userRepository: UserRepositoryImp(
      HttpClienteImp(),
    ),
  );
  test('testando lista user', () async {
    List<UserEntity> list;
    list = await usc();
    expect(list.length, 10);
  });
}
