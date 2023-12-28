typedef GeoRecord = ({String lat, String lon});

class Geo {
  final double lat;
  final double lon;

  Geo({required this.lat, required this.lon});

  factory Geo.fromJson(GeoRecord record) {
    return Geo(
      lat: double.parse(record.lat),
      lon: double.parse(record.lon),
    );
  }
}
