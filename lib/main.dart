import 'package:flutter/material.dart';
import 'package:flutter_clean_architeture/features/search_users/data/datasources/user_http_cliente_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/data/repositories/user_repository_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/search_user/search_user_usecase_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/show_details_user/show_detais_user_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/show_list_users/show_list_users_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/presenter/controllers/home_page_controller.dart';
import 'package:flutter_clean_architeture/features/search_users/presenter/pages/details_user_page.dart';
import 'package:flutter_clean_architeture/features/search_users/presenter/pages/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 114, 166, 209),
          ),
          scaffoldBackgroundColor: Colors.green[200],
          cardColor: const Color.fromARGB(255, 218, 207, 110)),
      initialRoute: HomePage.page,
      routes: {
        HomePage.page: (context) => HomePage(
              controller: HomeController(
                ShowUsersImp(
                  userRepository: UserRepositoryImp(
                    HttpClienteImp(),
                  ),
                ),
                SearchUserImp(),
              ),
            ),
        DetailsUserPage.page: (context) => DetailsUserPage(
              showDetaislUser: ShowDetailsUserImp(),
            )
      },
    );
  }
}
