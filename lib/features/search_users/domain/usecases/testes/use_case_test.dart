import 'package:flutter_clean_architeture/features/search_users/domain/usecases/search_user/search_user_usecase_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/show_details_user/show_detais_user_imp.dart';
import 'package:test/test.dart';

import 'package:flutter_clean_architeture/features/search_users/data/datasources/user_http_cliente_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/data/repositories/user_repository_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/show_list_users/show_list_users_imp.dart';

void main() async {
  var usecase = ShowUsersImp(
    userRepository: UserRepositoryImp(
      HttpClienteImp(),
    ),
  );

  List<UserEntity> list = await usecase();

  group('use cases ', () {
    test('testando lista de usuário', () async {
      expect(list[3].name, "Patricia Lebsack");
    });

    test('testando detalhes do usuário', () async {
      ShowDetailsUserImp details = ShowDetailsUserImp();
      var show = details(list[3]);
      expect(show[2], "South Elvis");
    });

    test('testando busca de usuário', () async {
      SearchUserImp search = SearchUserImp();
      var listSearch = search('Patricia Leb', list);

      expect(listSearch.length, 1);
    });
  });
}
