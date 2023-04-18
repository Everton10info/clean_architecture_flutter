import 'package:flutter_clean_architeture/features/search_users/domain/entities/address_entity.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/company_entity.dart';

class UserEntity {
  String? name;
  String? phone;
  AddressEntity? address;
  CompanyEntity? company;

  UserEntity({
    this.name,
    this.phone,
    this.address,
    this.company,
  });
}
