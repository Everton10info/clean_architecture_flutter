import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';

abstract class ShowUsers {
  Future<List<UserEntity>> call();
}
