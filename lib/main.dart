import 'package:flutter/material.dart';
import 'package:flutter_clean_architeture/features/search_users/data/datasources/user_http_cliente_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/data/repositories/user_repository_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/show_list_users/show_list_users_imp.dart';
import 'package:flutter_clean_architeture/features/search_users/presenter/controllers/home_page_controller.dart';
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
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(
                controller: HomeController(
              ShowUsersImp(
                userRepository: UserRepositoryImp(
                  HttpClienteImp(),
                ),
              ),
            ))
        /*     'spalsh':(context) =>  Splashpage()
        'home':(context) => HomePage() */
      },
    );
  }
}
