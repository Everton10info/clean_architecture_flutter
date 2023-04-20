import 'package:flutter_clean_architeture/features/search_users/data/data_sources/user_http_cliente_impl.dart';
import 'package:flutter_clean_architeture/features/search_users/data/repositories/user_repository_impl.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/use_cases/search_user/search_user_usecase_impl.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/use_cases/show_details_user/show_detais_user_impl.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/use_cases/show_list_users/show_list_users_impl.dart';
import 'package:test/test.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';

void main() async {
  var usecase = ShowUsersImpl(
    userRepository: UserRepositoryImpl(
      HttpClienteImpl(),
    ),
  );

  List<UserEntity> list = await usecase();

  group('use cases ', () {
    test('testando lista de usuário', () async {
      expect(list[3].name, "Patricia Lebsack");
    });

    test('testando detalhes do usuário', () async {
      ShowDetailsUserImpl details = ShowDetailsUserImpl();
      var show = details(list[3]);
      expect(show[2], "South Elvis");
    });

    test('testando busca de usuário', () async {
      SearchUserImpl search = SearchUserImpl();
      var listSearch = search('Patricia Leb', list);

      expect(listSearch.length, 1);
    });
  });
}
