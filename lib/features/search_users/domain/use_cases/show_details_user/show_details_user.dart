// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';

abstract class ShowDetailsUser {
  List<String> call(UserEntity user);
}
