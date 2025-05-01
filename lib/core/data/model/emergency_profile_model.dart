// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmergencyProfileModel {
  final String name;
  final String email;
  final String address;
  final String phone;
  final int number;

  EmergencyProfileModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.number
  });


  factory EmergencyProfileModel.fromJson(Map<String, dynamic> json) {
    return EmergencyProfileModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      number: json['number']??0
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'number':number
    };
  }
}
