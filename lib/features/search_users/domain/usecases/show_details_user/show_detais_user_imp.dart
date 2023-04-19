// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/usecases/show_details_user/show_details_user.dart';

class ShowDetailsUserImp implements ShowDetailsUser {
  @override
  List<String> call(UserEntity user) {
    return [
      user.name!,
      user.phone!,
      user.address!.city.toString(),
      user.company!.name!,
    ];
  }
}
