import 'package:flutter/material.dart';
import 'package:flutter_clean_architeture/core/config/theme/app_theme.dart';
import 'package:flutter_clean_architeture/features/search_users/data/data_sources/user_http_cliente_impl.dart';
import 'package:flutter_clean_architeture/features/search_users/data/repositories/user_repository_impl.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/use_cases/search_user/search_user_usecase_impl.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/use_cases/show_details_user/show_detais_user_impl.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/use_cases/show_list_users/show_list_users_impl.dart';
import 'package:flutter_clean_architeture/features/search_users/presentation/controllers/details_page_controller.dart';
import 'package:flutter_clean_architeture/features/search_users/presentation/controllers/home_page_controller.dart';
import 'package:flutter_clean_architeture/features/search_users/presentation/pages/details_user_page.dart';
import 'package:flutter_clean_architeture/features/search_users/presentation/pages/home_page.dart';

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
      theme: AppTheme.appTheme,
      initialRoute: HomePage.page,
      routes: {
        HomePage.page: (context) => HomePage(
              controller: HomeController(
                ShowUsersImpl(
                  userRepository: UserRepositoryImpl(
                    HttpClienteImpl(),
                  ),
                ),
                SearchUserImpl(),
              ),
            ),
        DetailsUserPage.page: (context) => DetailsUserPage(
              detailsController: DetailsController(
                ShowDetailsUserImpl(),
              ),
            )
      },
    );
  }
}
