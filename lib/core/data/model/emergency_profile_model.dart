// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmergencyProfileModel {
  final String name;
  final String email;
  final String address;
  final String phone;

  EmergencyProfileModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
  });


  factory EmergencyProfileModel.fromJson(Map<String, dynamic> json) {
    return EmergencyProfileModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
    };
  }
}
