import 'package:flutter_clean_architeture/features/search_users/domain/entities/address_entity.dart';

class Address extends AddressEntity {
  Address({
    street,
    suite,
    city,
    zipcode,
  });

  static Address fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      city: json['city'],
      zipcode: json['zipcode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['city'] = city;
    data['zipcode'] = zipcode;
    return data;
  }
}
