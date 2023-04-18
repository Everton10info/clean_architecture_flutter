import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getListUser();
}
