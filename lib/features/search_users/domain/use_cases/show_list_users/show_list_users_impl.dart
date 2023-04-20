import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/repositories/users_repository.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/use_cases/show_list_users/show_list_users.dart';

class ShowUsersImpl implements ShowUsers {
  final UserRepository userRepository;

  ShowUsersImpl({
    required this.userRepository,
  });

  @override
  Future<List<UserEntity>> call() async {
    await Future.delayed(const Duration(seconds: 1));
    return await userRepository.getListUser();
  }
}
