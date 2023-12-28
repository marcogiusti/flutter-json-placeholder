import "./address.dart";
import "./company.dart";

class User {
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User(
      {required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  factory User.fromJson(
      ({
        String name,
        String username,
        String email,
        AddressRecord address,
        String phone,
        String website,
        CompanyRecord company
      }) record) {
    return User(
        name: record.name,
        username: record.username,
        email: record.email,
        address: Address.fromJson(record.address),
        phone: record.phone,
        website: record.website,
        company: Company.fromJson(record.company));
  }
}
