import 'package:flutter/material.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/presenter/controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var users = <UserEntity>[];
  @override
  void initState() {
    widget.controller.displayUsers();
    users = widget.controller.showList.value;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Text(users[index].name!);
        },
      ),
    ]));
  }
}
