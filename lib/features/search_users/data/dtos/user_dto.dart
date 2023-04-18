import 'package:flutter_clean_architeture/features/search_users/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;

  Company? company;

  UserDto({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.company,
  }) : super(
          nome: name ?? '',
          telefone: phone ?? '',
          cidade: Address.city ?? '',
          compania: Company.name ?? '',
        );

  static UserDto fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      company: Company.fromJson(json['company']),
    );
  }
}

class Address {
  static String? street;
  static String? suite;
  static String? city;
  static String? zipcode;

  Address({street, suite, city, zipcode, geo});

  static Address fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
    );
  }
}

class Company {
  static String? name;
  static String? catchPhrase;
  static String? bs;

  Company({
    name,
    catchPhrase,
    bs,
  });

  static Company fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}
