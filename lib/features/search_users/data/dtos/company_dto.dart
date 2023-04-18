import 'package:flutter_clean_architeture/features/search_users/domain/entities/company_entity.dart';

class Company extends CompanyEntity {
  Company({
    super.name,
    super.catchPhrase,
    super.bs,
  });

  static Company fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }
}
