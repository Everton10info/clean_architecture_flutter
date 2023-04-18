import 'package:flutter/material.dart';
import 'package:flutter_clean_architeture/features/search_users/data/datasources/user_http_cliente_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/data/repositories/user_repository_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/show_list_users/show_list_users_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final showUser = ShowUsersImp(
    userRepository: UserRepositoryImp(
      HttpClienteImp(),
    ),
  );
  List<UserEntity>? users;
  @override
  void initState() {
    showUser.call().then((value) => users = value);
    super.initState();
  }

  Future get() async {
    showUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: users!.length,
      itemBuilder: (context, index) {
        return Text(users![index].name!);
      },
    ));
  }
}
