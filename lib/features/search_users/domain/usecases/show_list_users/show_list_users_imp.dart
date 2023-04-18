import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/repositories/users_repository.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/show_list_users/show_list_users.dart';

class ShowUsersImp implements ShowhUsers {
  final UserRepository userRepository;

  ShowUsersImp({
    required this.userRepository,
  });

  @override
  Future<List<UserEntity>> call() async {
    List<UserEntity> users;
    return await userRepository.getListUser();
  }
}
