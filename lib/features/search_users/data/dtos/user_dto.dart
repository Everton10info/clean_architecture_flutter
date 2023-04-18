import 'package:flutter_clean_architeture/features/search_users/data/dtos/address_dto.dart';
import 'package:flutter_clean_architeture/features/search_users/data/dtos/company_dto.dart';
import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';

class User extends UserEntity {
  int? id;
  String? username;
  String? email;
  String? website;

  User({
    this.id,
    this.username,
    this.email,
    this.website,
    required super.name,
    required super.phone,
    required super.address,
    required super.company,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address = Address.fromJson(json['address']);
    phone = json['phone'];
    website = json['website'];
    company = Company.fromJson(json['company']);
  }
}
