// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';

import 'package:flutter_clean_architeture/features/search_users/domain/usecases/show_details_user/show_detais_user_imp.dart';

class DetailsUserPage extends StatefulWidget {
  static String page = '/detailsPage';
  final ShowDetailsUserImp showDetaislUser;
  const DetailsUserPage({
    Key? key,
    required this.showDetaislUser,
  }) : super(key: key);

  @override
  State<DetailsUserPage> createState() => _DetailsUserPageState();
}

class _DetailsUserPageState extends State<DetailsUserPage> {
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserEntity;
    final detaisList = widget.showDetaislUser(user);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Poc Clean Architecture',
            style: TextStyle(color: Color.fromARGB(255, 202, 82, 74)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 160,
                  child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Nome:  ${detaisList[0]} ',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 202, 82, 74),
                              ),
                            ),
                            Text(
                              'Telefone:  ${detaisList[1]} ',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 202, 82, 74),
                              ),
                            ),
                            Text(
                              'Cidade:  ${detaisList[2]} ',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 202, 82, 74),
                              ),
                            ),
                            Text(
                              'Empresa:  ${detaisList[3]} ',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 202, 82, 74),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ]),
        ));
  }
}
