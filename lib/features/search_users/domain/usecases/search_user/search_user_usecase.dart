import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';

abstract class SearchUser {
  List<UserEntity> call(String value, List<UserEntity> users);
}
