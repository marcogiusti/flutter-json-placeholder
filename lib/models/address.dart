import "./geo.dart";

typedef AddressRecord = ({
  String street,
  String suite,
  String city,
  String zipcode,
  GeoRecord geo
});

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  factory Address.fromJson(AddressRecord record) {
    return Address(
        street: record.street,
        suite: record.suite,
        city: record.city,
        zipcode: record.zipcode,
        geo: Geo.fromJson(record.geo));
  }
}
