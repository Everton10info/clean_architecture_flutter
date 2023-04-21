import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/use_cases/show_details_user/show_details_user.dart';

class DetailsController {
  final ShowDetailsUser showDetailsUser;

  final listDetails = <String>[];

  final loader = ValueNotifier<bool>(false);

  DetailsController(this.showDetailsUser);

  List<String> showDetails(UserEntity user) {
    return showDetailsUser(user);
  }
}
