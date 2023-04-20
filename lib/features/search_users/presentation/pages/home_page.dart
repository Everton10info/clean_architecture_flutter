import 'package:flutter/material.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/presentation/controllers/home_page_controller.dart';
import 'package:flutter_clean_architeture/features/search_users/presentation/pages/details_user_page.dart';

class HomePage extends StatefulWidget {
  static String page = 'homePage';
  final HomeController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textController = TextEditingController();
  var showListScreen = ValueNotifier<List<UserEntity>>([]);
  @override
  void initState() {
    widget.controller.displayUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final users = widget.controller.showUserList;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Poc Flutter Clean Architecture',
            style: TextStyle(color: Color.fromARGB(255, 202, 82, 74)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: Text(
                    'User List',
                    style: TextStyle(
                        fontSize: 32,
                        color: Color.fromARGB(255, 202, 82, 74),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 89, 128, 195),
                    ),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'search users',
                      hintStyle: TextStyle(color: Colors.blueGrey),
                    ),
                    onChanged: (value) {
                      widget.controller.searchUse(value);
                    },
                  ),
                ),
                Expanded(
                    flex: 9,
                    child: ValueListenableBuilder(
                      valueListenable: users,
                      builder: (context, user, child) {
                        return widget.controller.loader.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                itemCount: user.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                      elevation: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 40,
                                          child: ListTile(
                                            leading: Text(
                                              user[index].name!,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Color.fromARGB(
                                                    255, 202, 82, 74),
                                              ),
                                            ),
                                            trailing: const Icon(
                                              Icons.arrow_right_alt_rounded,
                                              color: Color.fromARGB(
                                                  255, 202, 82, 74),
                                            ),
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  DetailsUserPage.page,
                                                  arguments: user[index]);
                                            },
                                          ),
                                        ),
                                      ));
                                },
                              );
                      },
                    )),
              ]),
        ));
  }
}
